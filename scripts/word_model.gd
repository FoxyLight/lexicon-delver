class_name WordModel
extends RefCounted

const WORDS := [
    "FIRE",
    "ICE",
    "LIGHT",
    "BREAK",
    "BALL",
    "WALL",
    "SHIELD",
    "ARMOR",
    "TRAP",
]

const EFFECTS := {
    "FIRE|BALL": "Deal 4 damage.",
    "ICE|BALL": "Deal 2 damage and delay the target 1 turn.",
    "LIGHT|BALL": "Reveal the target and deal 2 damage.",

    "FIRE|WALL": "Block one lane for 1 turn; first entrant takes 2 damage.",
    "ICE|WALL": "Block one lane for 2 turns.",
    "LIGHT|WALL": "Reveal hidden enemies crossing that lane.",

    "FIRE|SHIELD": "Block 2 damage; attacker takes 1 damage.",
    "ICE|SHIELD": "Block 3 damage.",
    "LIGHT|SHIELD": "Reveal hidden enemies and block 2 damage.",

    "BREAK|ARMOR": "Remove all armor from one enemy.",
    "ICE|ARMOR": "Gain 4 temporary armor.",
    "FIRE|ARMOR": "Gain 2 temporary armor; melee attackers take 1 damage.",

    "FIRE|TRAP": "First advancing enemy in the lane takes 4 damage; survivor continues.",
    "ICE|TRAP": "First advancing enemy in the lane loses that activation and does not advance.",
    "LIGHT|TRAP": "First hidden advancing enemy in the lane is revealed before completing the advance.",
}

var available_words: Array[String] = []
var selected_words: Array[String] = []
var last_executed_pair := ""

func _init() -> void:
    reset()

func reset() -> void:
    available_words.clear()
    available_words.append_array(WORDS)
    selected_words.clear()
    last_executed_pair = ""

func is_available(word: String) -> bool:
    return word in available_words

func select_word(word: String) -> bool:
    if not is_available(word):
        return false

    if word in selected_words:
        selected_words.erase(word)
        return true

    if selected_words.size() >= 2:
        return false

    selected_words.append(word)
    return true

func clear_selection() -> void:
    selected_words.clear()

func get_pair_key(a: String, b: String) -> String:
    var forward := "%s|%s" % [a, b]
    if EFFECTS.has(forward):
        return forward

    var reverse := "%s|%s" % [b, a]
    if EFFECTS.has(reverse):
        return reverse

    return ""

func current_pair_key() -> String:
    if selected_words.size() != 2:
        return ""
    return get_pair_key(selected_words[0], selected_words[1])

func current_preview() -> String:
    if selected_words.is_empty():
        return "Select two words."

    if selected_words.size() == 1:
        return "Select a second word."

    var key := current_pair_key()
    if key.is_empty():
        return "Unsupported pairing."

    return EFFECTS[key]

func can_execute() -> bool:
    return selected_words.size() == 2 and not current_pair_key().is_empty()

func execute() -> bool:
    if not can_execute():
        return false

    var first := selected_words[0]
    var second := selected_words[1]

    available_words.erase(first)
    available_words.erase(second)

    last_executed_pair = current_pair_key()
    selected_words.clear()
    return true
