extends SceneTree

var failures := 0

func _initialize() -> void:
    var model := WordModel.new()

    _assert(model.available_words.size() == 9, "reset starts with all nine words")

    _assert(model.select_word("FIRE"), "FIRE can be selected")
    _assert(model.select_word("BALL"), "BALL can be selected")
    _assert(model.can_execute(), "FIRE + BALL is executable")
    _assert(
        model.current_preview() == "Deal 4 damage.",
        "FIRE + BALL preview matches authority"
    )

    _assert(model.execute(), "supported pair executes")
    _assert(not model.is_available("FIRE"), "FIRE is consumed")
    _assert(not model.is_available("BALL"), "BALL is consumed")
    _assert(not model.select_word("FIRE"), "consumed FIRE cannot be reused")

    model.reset()
    _assert(model.available_words.size() == 9, "reset restores all words")
    _assert(model.is_available("FIRE"), "reset restores FIRE")
    _assert(model.is_available("BALL"), "reset restores BALL")

    _assert(model.select_word("BREAK"), "BREAK can be selected")
    _assert(model.select_word("TRAP"), "TRAP can be selected")
    _assert(not model.can_execute(), "BREAK + TRAP is unsupported")
    _assert(not model.execute(), "unsupported pair does not execute")
    _assert(model.is_available("BREAK"), "unsupported execution does not consume BREAK")
    _assert(model.is_available("TRAP"), "unsupported execution does not consume TRAP")

    model.reset()

    for key in WordModel.EFFECTS.keys():
        var parts: PackedStringArray = key.split("|")
        _assert(parts.size() == 2, "%s has exactly two source words" % key)
        _assert(
            model.get_pair_key(parts[0], parts[1]) == key,
            "%s resolves in authoritative order" % key
        )
        _assert(
            model.get_pair_key(parts[1], parts[0]) == key,
            "%s resolves regardless of click order" % key
        )

    if failures == 0:
        print("LEXICON_DELVER_CP1_TESTS: PASS")
        quit(0)
    else:
        print("LEXICON_DELVER_CP1_TESTS: FAIL (%d failures)" % failures)
        quit(1)

func _assert(condition: bool, description: String) -> void:
    if condition:
        print("PASS: %s" % description)
    else:
        failures += 1
        push_error("FAIL: %s" % description)
