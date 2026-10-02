extends Control

var model := WordModel.new()
var combat := CombatModel.new()

var word_buttons: Dictionary = {}
var current_encounter: Dictionary = {}
var current_encounter_id := "A"

@onready var encounter_selector: OptionButton = $Margin/RootVBox/Header/EncounterSelector

@onready var encounter_title: Label = $Margin/RootVBox/Body/LeftColumn/EncounterPanel/VBox/EncounterTitle
@onready var encounter_purpose: Label = $Margin/RootVBox/Body/LeftColumn/EncounterPanel/VBox/EncounterPurpose
@onready var threat_label: Label = $Margin/RootVBox/Body/LeftColumn/EncounterPanel/VBox/ThreatLabel

@onready var words_grid: GridContainer = $Margin/RootVBox/Body/LeftColumn/WordsPanel/VBox/WordsGrid

@onready var selection_label: Label = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/SelectionLabel
@onready var preview_label: Label = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/PreviewLabel
@onready var result_label: Label = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/ResultLabel

@onready var execute_button: Button = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/Actions/ExecuteButton
@onready var cancel_button: Button = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/Actions/CancelButton
@onready var reset_button: Button = $Margin/RootVBox/Body/LeftColumn/MergePanel/VBox/Actions/ResetButton

@onready var state_label: Label = $Margin/RootVBox/Body/RightColumn/CombatPanel/VBox/StateLabel

@onready var lane_selector: OptionButton = $Margin/RootVBox/Body/RightColumn/EnemyPanel/VBox/LaneSelector
@onready var advance_button: Button = $Margin/RootVBox/Body/RightColumn/EnemyPanel/VBox/AdvanceButton
@onready var attack_button: Button = $Margin/RootVBox/Body/RightColumn/EnemyPanel/VBox/AttackButton
@onready var end_turn_button: Button = $Margin/RootVBox/Body/RightColumn/EnemyPanel/VBox/EndTurnButton

func _ready() -> void:
    encounter_selector.add_item("A - Shared-Resource Readability")
    encounter_selector.add_item("B - WALL versus TRAP")
    encounter_selector.add_item("C - Mixed-Hand Tactical Allocation")
    encounter_selector.item_selected.connect(_on_encounter_selected)

    lane_selector.add_item("Left lane")
    lane_selector.add_item("Right lane")

    for word in WordModel.WORDS:
        var button := Button.new()
        button.text = word
        button.custom_minimum_size = Vector2(180, 50)
        button.pressed.connect(_on_word_pressed.bind(word))
        words_grid.add_child(button)
        word_buttons[word] = button

    execute_button.pressed.connect(_on_execute_pressed)
    cancel_button.pressed.connect(_on_cancel_pressed)
    reset_button.pressed.connect(_on_reset_pressed)

    advance_button.pressed.connect(_on_advance_pressed)
    attack_button.pressed.connect(_on_attack_pressed)
    end_turn_button.pressed.connect(_on_end_turn_pressed)

    _load_encounter("A")

func _on_encounter_selected(index: int) -> void:
    match index:
        0:
            _load_encounter("A")
        1:
            _load_encounter("B")
        2:
            _load_encounter("C")

func _load_encounter(id: String) -> void:
    var encounter := EncounterCatalog.get_encounter(id)

    if encounter.is_empty():
        result_label.text = "Encounter could not be loaded."
        return

    current_encounter_id = id
    current_encounter = encounter

    model.reset()
    combat.reset()

    model.available_words.clear()
    for word in encounter["available_words"]:
        model.available_words.append(word)

    combat.player_hp = encounter["player_hp"]

    result_label.text = "Encounter %s loaded." % id
    _refresh()

func _on_word_pressed(word: String) -> void:
    if model.select_word(word):
        result_label.text = ""

    _refresh()

func _on_execute_pressed() -> void:
    if not model.can_execute():
        result_label.text = "That pairing cannot be executed."
        _refresh()
        return

    var pair_key := model.current_pair_key()
    var preview := model.current_preview()
    var lane := _selected_lane()

    if combat.resolve(pair_key, lane):
        if model.execute():
            result_label.text = "Executed: %s\n%s" % [preview, combat.last_event]
    else:
        result_label.text = "Combat effect could not resolve."

    _refresh()

func _on_cancel_pressed() -> void:
    model.clear_selection()
    result_label.text = ""
    _refresh()

func _on_reset_pressed() -> void:
    _load_encounter(current_encounter_id)

func _on_advance_pressed() -> void:
    var lane := _selected_lane()

    if combat.consume_delay():
        result_label.text = combat.last_event
    else:
        var advanced := combat.attempt_enemy_advance(lane)

        result_label.text = "%s\nAdvance completed: %s" % [
            combat.last_event,
            "yes" if advanced else "no"
        ]

    _refresh()

func _on_attack_pressed() -> void:
    if combat.consume_delay():
        result_label.text = combat.last_event
    else:
        var damage_taken := combat.receive_enemy_attack(3, true)

        result_label.text = "%s\nDamage reaching player HP: %d" % [
            combat.last_event,
            damage_taken
        ]

    _refresh()

func _on_end_turn_pressed() -> void:
    combat.end_enemy_turn()
    result_label.text = "Enemy turn ended. Wall durations advanced."
    _refresh()

func _selected_lane() -> String:
    return "left" if lane_selector.selected == 0 else "right"

func _refresh() -> void:
    for word in WordModel.WORDS:
        var button: Button = word_buttons[word]
        button.visible = model.is_available(word)

        if word in model.selected_words:
            button.text = "✓ %s" % word
        else:
            button.text = word

    if model.selected_words.is_empty():
        selection_label.text = "Selected: none"
    else:
        selection_label.text = "Selected: %s" % " + ".join(model.selected_words)

    preview_label.text = model.current_preview()
    execute_button.disabled = not model.can_execute()
    cancel_button.disabled = model.selected_words.is_empty()

    if not current_encounter.is_empty():
        encounter_title.text = "Encounter %s: %s" % [
            current_encounter["id"],
            current_encounter["title"],
        ]

        encounter_purpose.text = current_encounter["purpose"]
        threat_label.text = _threat_text()

    state_label.text = _combat_state_text()

func _threat_text() -> String:
    var lines: Array[String] = []

    for threat in current_encounter["threats"]:
        var hidden_text := "hidden" if threat["hidden"] else "visible"

        lines.append(
            "%s\n%d HP | %d armor | %s | %s lane | %d step(s) | %d %s damage\n%s"
            % [
                threat["name"],
                threat["hp"],
                threat["armor"],
                hidden_text,
                threat["lane"],
                threat["steps"],
                threat["attack_damage"],
                threat["attack_type"],
                threat["timing"],
            ]
        )

    return "\n\n".join(lines)

func _combat_state_text() -> String:
    return (
        "ENEMY\n"
        + "%d HP\n"
        + "%d armor\n"
        + "%s\n"
        + "Delayed activations: %d\n\n"
        + "PLAYER\n"
        + "%d HP\n"
        + "%d temporary armor\n"
        + "Shield block: %d\n\n"
        + "LEFT LANE\n"
        + "Wall: %d turn(s)\n"
        + "Trap: %s\n\n"
        + "RIGHT LANE\n"
        + "Wall: %d turn(s)\n"
        + "Trap: %s"
    ) % [
        combat.enemy_hp,
        combat.enemy_armor,
        "Hidden" if combat.enemy_hidden else "Revealed",
        combat.enemy_delayed_activations,
        combat.player_hp,
        combat.player_temp_armor,
        combat.shield_block,
        combat.wall_turns["left"],
        combat.trap_type["left"] if combat.trap_type["left"] != "" else "none",
        combat.wall_turns["right"],
        combat.trap_type["right"] if combat.trap_type["right"] != "" else "none",
    ]
