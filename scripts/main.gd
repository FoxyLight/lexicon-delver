extends Control

var model := WordModel.new()

var word_buttons: Dictionary = {}

@onready var words_grid: GridContainer = $Margin/VBox/WordsGrid
@onready var selection_label: Label = $Margin/VBox/SelectionLabel
@onready var preview_label: Label = $Margin/VBox/PreviewPanel/PreviewLabel
@onready var result_label: Label = $Margin/VBox/ResultLabel
@onready var execute_button: Button = $Margin/VBox/Actions/ExecuteButton
@onready var cancel_button: Button = $Margin/VBox/Actions/CancelButton
@onready var reset_button: Button = $Margin/VBox/Actions/ResetButton

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

    _refresh()

func _on_word_pressed(word: String) -> void:
    if model.select_word(word):
        result_label.text = ""
    _refresh()

func _on_execute_pressed() -> void:
    var preview := model.current_preview()

    if model.execute():
        result_label.text = "Executed: %s" % preview
    else:
        result_label.text = "That pairing cannot be executed."

    _refresh()

func _on_cancel_pressed() -> void:
    model.clear_selection()
    result_label.text = ""
    _refresh()

func _on_reset_pressed() -> void:
    model.reset()
    result_label.text = "Encounter reset."
    _refresh()

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
