extends Control

var model := WordModel.new()
var combat := CombatModel.new()

var word_buttons: Dictionary = {}

@onready var words_grid: GridContainer = $Margin/VBox/WordsGrid
@onready var selection_label: Label = $Margin/VBox/SelectionLabel
@onready var preview_label: Label = $Margin/VBox/PreviewPanel/PreviewLabel
@onready var result_label: Label = $Margin/VBox/ResultLabel
@onready var execute_button: Button = $Margin/VBox/Actions/ExecuteButton
@onready var cancel_button: Button = $Margin/VBox/Actions/CancelButton
@onready var reset_button: Button = $Margin/VBox/Actions/ResetButton

var state_label: Label
var lane_selector: OptionButton
var trigger_button: Button
var attack_button: Button
var end_turn_button: Button

func _ready() -> void:
    for word in WordModel.WORDS:
        var button := Button.new()
        button.text = word
        button.custom_minimum_size = Vector2(180, 58)
        button.pressed.connect(_on_word_pressed.bind(word))
        words_grid.add_child(button)
        word_buttons[word] = button

    execute_button.pressed.connect(_on_execute_pressed)
    cancel_button.pressed.connect(_on_cancel_pressed)
    reset_button.pressed.connect(_on_reset_pressed)

    _build_cp2_controls()
    _refresh()

func _build_cp2_controls() -> void:
    var separator := HSeparator.new()
    $Margin/VBox.add_child(separator)

    var heading := Label.new()
    heading.text = "CP2 DETERMINISTIC COMBAT STATE"
    heading.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    $Margin/VBox.add_child(heading)

    state_label = Label.new()
    state_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    $Margin/VBox.add_child(state_label)

    var controls := HBoxContainer.new()
    controls.add_theme_constant_override("separation", 12)
    $Margin/VBox.add_child(controls)

    lane_selector = OptionButton.new()
    lane_selector.add_item("Left lane")
    lane_selector.add_item("Right lane")
    controls.add_child(lane_selector)

    trigger_button = Button.new()
    trigger_button.text = "Enemy Attempts Advance"
    trigger_button.pressed.connect(_on_advance_pressed)
    controls.add_child(trigger_button)

    attack_button = Button.new()
    attack_button.text = "Enemy Melee Attack (3)"
    attack_button.pressed.connect(_on_attack_pressed)
    controls.add_child(attack_button)

    end_turn_button = Button.new()
    end_turn_button.text = "End Enemy Turn"
    end_turn_button.pressed.connect(_on_end_turn_pressed)
    controls.add_child(end_turn_button)

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
    model.reset()
    combat.reset()
    result_label.text = "Prototype reset."
    _refresh()

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

    if state_label != null:
        state_label.text = _combat_state_text()

func _combat_state_text() -> String:
    return (
        "Enemy: %d HP | %d armor | %s | delayed activations: %d\n"
        + "Player: %d HP | %d temp armor | shield block: %d\n"
        + "Left lane: wall %d turn(s) | trap %s\n"
        + "Right lane: wall %d turn(s) | trap %s"
    ) % [
        combat.enemy_hp,
        combat.enemy_armor,
        "hidden" if combat.enemy_hidden else "revealed",
        combat.enemy_delayed_activations,
        combat.player_hp,
        combat.player_temp_armor,
        combat.shield_block,
        combat.wall_turns["left"],
        combat.trap_type["left"] if combat.trap_type["left"] != "" else "none",
        combat.wall_turns["right"],
        combat.trap_type["right"] if combat.trap_type["right"] != "" else "none",
    ]
