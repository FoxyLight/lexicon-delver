extends SceneTree

var failures := 0

func _initialize() -> void:
    test_ball_effects()
    test_wall_effects()
    test_shield_effects()
    test_armor_effects()
    test_trap_effects()
    test_reset_integrity()

    if failures == 0:
        print("LEXICON_DELVER_CP2_TESTS: PASS")
        quit(0)
    else:
        print("LEXICON_DELVER_CP2_TESTS: FAIL (%d failures)" % failures)
        quit(1)

func test_ball_effects() -> void:
    var combat := CombatModel.new()

    _assert(combat.resolve("FIRE|BALL"), "FIRE BALL resolves")
    _assert(combat.enemy_armor == 0, "FIRE BALL removes 3 armor first")
    _assert(combat.enemy_hp == 7, "FIRE BALL applies remaining 1 damage")

    combat.reset()
    _assert(combat.resolve("ICE|BALL"), "ICE BALL resolves")
    _assert(combat.enemy_armor == 1, "ICE BALL deals 2 into armor")
    _assert(combat.enemy_delayed_activations == 1, "ICE BALL delays one activation")
    _assert(combat.consume_delay(), "ICE BALL delay can be consumed")
    _assert(combat.enemy_delayed_activations == 0, "delay count returns to zero")

    combat.reset()
    _assert(combat.resolve("LIGHT|BALL"), "LIGHT BALL resolves")
    _assert(not combat.enemy_hidden, "LIGHT BALL reveals target")
    _assert(combat.enemy_armor == 1, "LIGHT BALL also deals 2 damage")

func test_wall_effects() -> void:
    var combat := CombatModel.new()

    _assert(combat.resolve("FIRE|WALL", "left"), "FIRE WALL resolves")
    _assert(combat.wall_turns["left"] == 1, "FIRE WALL lasts one turn")
    _assert(not combat.attempt_enemy_advance("left"), "FIRE WALL blocks advance")
    _assert(combat.enemy_armor == 1, "FIRE WALL first entrant takes 2")
    combat.end_enemy_turn()
    _assert(combat.wall_turns["left"] == 0, "FIRE WALL expires")

    combat.reset()
    _assert(combat.resolve("ICE|WALL", "right"), "ICE WALL resolves")
    _assert(combat.wall_turns["right"] == 2, "ICE WALL lasts two turns")
    _assert(not combat.attempt_enemy_advance("right"), "ICE WALL blocks first turn")
    combat.end_enemy_turn()
    _assert(combat.wall_turns["right"] == 1, "ICE WALL has one turn remaining")
    _assert(not combat.attempt_enemy_advance("right"), "ICE WALL blocks second turn")
    combat.end_enemy_turn()
    _assert(combat.wall_turns["right"] == 0, "ICE WALL expires after two turns")

    combat.reset()
    _assert(combat.resolve("LIGHT|WALL", "left"), "LIGHT WALL resolves")
    _assert(not combat.attempt_enemy_advance("left"), "LIGHT WALL blocks while active")
    _assert(not combat.enemy_hidden, "LIGHT WALL reveals hidden crosser")

func test_shield_effects() -> void:
    var combat := CombatModel.new()

    _assert(combat.resolve("FIRE|SHIELD"), "FIRE SHIELD resolves")
    var damage_taken := combat.receive_enemy_attack(3, true)
    _assert(damage_taken == 1, "FIRE SHIELD blocks 2 of 3 damage")
    _assert(combat.player_hp == 6, "remaining shield damage reaches player")
    _assert(combat.enemy_armor == 2, "FIRE SHIELD retaliation deals 1 into armor")

    combat.reset()
    _assert(combat.resolve("ICE|SHIELD"), "ICE SHIELD resolves")
    damage_taken = combat.receive_enemy_attack(3, true)
    _assert(damage_taken == 0, "ICE SHIELD blocks all 3 damage")
    _assert(combat.player_hp == 7, "ICE SHIELD preserves player HP")

    combat.reset()
    _assert(combat.resolve("LIGHT|SHIELD"), "LIGHT SHIELD resolves")
    _assert(not combat.enemy_hidden, "LIGHT SHIELD reveals hidden enemy")
    damage_taken = combat.receive_enemy_attack(2, false)
    _assert(damage_taken == 0, "LIGHT SHIELD blocks 2 damage")

func test_armor_effects() -> void:
    var combat := CombatModel.new()

    _assert(combat.resolve("BREAK|ARMOR"), "BREAK ARMOR resolves")
    _assert(combat.enemy_armor == 0, "BREAK ARMOR removes all armor")

    combat.reset()
    _assert(combat.resolve("ICE|ARMOR"), "ICE ARMOR resolves")
    _assert(combat.player_temp_armor == 4, "ICE ARMOR grants 4 temporary armor")
    var damage_taken := combat.receive_enemy_attack(3, true)
    _assert(damage_taken == 0, "ICE ARMOR absorbs attack")
    _assert(combat.player_temp_armor == 1, "ICE ARMOR retains unused armor")

    combat.reset()
    _assert(combat.resolve("FIRE|ARMOR"), "FIRE ARMOR resolves")
    _assert(combat.player_temp_armor == 2, "FIRE ARMOR grants 2 temporary armor")
    damage_taken = combat.receive_enemy_attack(1, true)
    _assert(damage_taken == 0, "FIRE ARMOR absorbs melee damage")
    _assert(combat.enemy_armor == 2, "FIRE ARMOR retaliates for 1 into armor")

func test_trap_effects() -> void:
    var combat := CombatModel.new()

    _assert(combat.resolve("FIRE|TRAP", "left"), "FIRE TRAP resolves")
    _assert(combat.trap_type["left"] == "fire", "FIRE TRAP arms")
    _assert(combat.attempt_enemy_advance("left"), "FIRE TRAP survivor continues")
    _assert(combat.enemy_armor == 0, "FIRE TRAP removes armor")
    _assert(combat.enemy_hp == 7, "FIRE TRAP deals remaining damage")
    _assert(combat.trap_type["left"] == "", "FIRE TRAP is consumed")

    combat.reset()
    _assert(combat.resolve("ICE|TRAP", "right"), "ICE TRAP resolves")
    _assert(not combat.attempt_enemy_advance("right"), "ICE TRAP stops activation")
    _assert(combat.enemy_delayed_activations == 1, "ICE TRAP records lost activation")
    _assert(combat.trap_type["right"] == "", "ICE TRAP is consumed")

    combat.reset()
    _assert(combat.resolve("LIGHT|TRAP", "left"), "LIGHT TRAP resolves")
    _assert(combat.attempt_enemy_advance("left"), "LIGHT TRAP allows advance")
    _assert(not combat.enemy_hidden, "LIGHT TRAP reveals hidden enemy")
    _assert(combat.trap_type["left"] == "", "LIGHT TRAP is consumed")

func test_reset_integrity() -> void:
    var combat := CombatModel.new()

    combat.resolve("FIRE|ARMOR")
    combat.resolve("ICE|WALL", "left")
    combat.resolve("FIRE|TRAP", "right")
    combat.receive_enemy_attack(2, true)

    combat.reset()

    _assert(combat.enemy_hp == 8, "reset restores enemy HP")
    _assert(combat.enemy_armor == 3, "reset restores enemy armor")
    _assert(combat.enemy_hidden, "reset restores hidden state")
    _assert(combat.enemy_delayed_activations == 0, "reset clears delay")
    _assert(combat.player_hp == 7, "reset restores player HP")
    _assert(combat.player_temp_armor == 0, "reset clears temporary armor")
    _assert(combat.wall_turns["left"] == 0, "reset clears walls")
    _assert(combat.trap_type["right"] == "", "reset clears traps")

func _assert(condition: bool, description: String) -> void:
    if condition:
        print("PASS: %s" % description)
    else:
        failures += 1
        push_error("FAIL: %s" % description)
