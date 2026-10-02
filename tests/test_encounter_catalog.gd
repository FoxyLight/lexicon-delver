extends SceneTree

var failures := 0

func _initialize() -> void:
    test_catalog_shape()
    test_encounter_a()
    test_encounter_b()
    test_encounter_c()
    test_copy_integrity()

    if failures == 0:
        print("LEXICON_DELVER_CP3_CATALOG_TESTS: PASS")
        quit(0)
    else:
        print("LEXICON_DELVER_CP3_CATALOG_TESTS: FAIL (%d failures)" % failures)
        quit(1)

func test_catalog_shape() -> void:
    var encounters := EncounterCatalog.all_encounters()

    _assert(encounters.size() == 3, "catalog contains exactly three encounters")
    _assert(encounters[0]["id"] == "A", "Encounter A is first")
    _assert(encounters[1]["id"] == "B", "Encounter B is second")
    _assert(encounters[2]["id"] == "C", "Encounter C is third")

func test_encounter_a() -> void:
    var encounter := EncounterCatalog.get_encounter("A")

    _assert(not encounter.is_empty(), "Encounter A exists")
    _assert(
        encounter["available_words"] == ["FIRE", "ICE", "BALL", "WALL"],
        "Encounter A has bounded shared-resource word pool"
    )
    _assert(encounter["threats"].size() == 2, "Encounter A has two pressures")
    _assert(
        "FIRE" in encounter["available_words"]
        and "BALL" in encounter["available_words"]
        and "WALL" in encounter["available_words"],
        "Encounter A allows FIRE to compete across forms"
    )

func test_encounter_b() -> void:
    var encounter := EncounterCatalog.get_encounter("B")

    _assert(not encounter.is_empty(), "Encounter B exists")
    _assert(
        encounter["available_words"] == ["FIRE", "ICE", "WALL", "TRAP"],
        "Encounter B exposes WALL and TRAP together"
    )
    _assert(encounter["threats"].size() == 2, "Encounter B has Runner and Brute")
    _assert(encounter["threats"][0]["lane"] == "left", "Runner starts left")
    _assert(encounter["threats"][1]["lane"] == "right", "Brute starts right")

func test_encounter_c() -> void:
    var encounter := EncounterCatalog.get_encounter("C")

    _assert(not encounter.is_empty(), "Encounter C exists")
    _assert(encounter["threats"].size() == 3, "Encounter C has three tactical pressures")
    _assert("LIGHT" in encounter["available_words"], "Encounter C includes reveal option")
    _assert("ICE" in encounter["available_words"], "Encounter C includes control option")
    _assert("TRAP" in encounter["available_words"], "Encounter C includes triggered lane form")

    var scout: Dictionary = encounter["threats"][0]
    var caster: Dictionary = encounter["threats"][2]

    _assert(scout["hidden"], "Encounter C includes hidden Scout")
    _assert(caster["attack_type"] == "ranged", "Encounter C includes ranged Caster")
    _assert(caster["attack_damage"] == 3, "Caster pressure matches validated mixed-hand state")

func test_copy_integrity() -> void:
    var first := EncounterCatalog.get_encounter("B")
    first["available_words"].erase("FIRE")

    var second := EncounterCatalog.get_encounter("B")

    _assert(
        "FIRE" in second["available_words"],
        "retrieving an encounter returns independent state"
    )

func _assert(condition: bool, description: String) -> void:
    if condition:
        print("PASS: %s" % description)
    else:
        failures += 1
        push_error("FAIL: %s" % description)
