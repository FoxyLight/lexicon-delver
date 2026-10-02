class_name CombatModel
extends RefCounted

var enemy_hp := 8
var enemy_armor := 3
var enemy_hidden := true
var enemy_delayed_activations := 0

var player_hp := 7
var player_temp_armor := 0
var shield_block := 0
var shield_retaliation := 0
var armor_retaliation := 0

var wall_turns := {
    "left": 0,
    "right": 0,
}

var wall_damage := {
    "left": 0,
    "right": 0,
}

var wall_reveal := {
    "left": false,
    "right": false,
}

var trap_type := {
    "left": "",
    "right": "",
}

var last_event := ""

func reset() -> void:
    enemy_hp = 8
    enemy_armor = 3
    enemy_hidden = true
    enemy_delayed_activations = 0

    player_hp = 7
    player_temp_armor = 0
    shield_block = 0
    shield_retaliation = 0
    armor_retaliation = 0

    wall_turns = {
        "left": 0,
        "right": 0,
    }

    wall_damage = {
        "left": 0,
        "right": 0,
    }

    wall_reveal = {
        "left": false,
        "right": false,
    }

    trap_type = {
        "left": "",
        "right": "",
    }

    last_event = ""

func resolve(pair_key: String, lane := "left") -> bool:
    if lane != "left" and lane != "right":
        return false

    match pair_key:
        "FIRE|BALL":
            _damage_enemy(4)
            last_event = "FIRE BALL dealt 4 damage."

        "ICE|BALL":
            _damage_enemy(2)
            enemy_delayed_activations += 1
            last_event = "ICE BALL dealt 2 damage and delayed 1 activation."

        "LIGHT|BALL":
            enemy_hidden = false
            _damage_enemy(2)
            last_event = "LIGHT BALL revealed the enemy and dealt 2 damage."

        "FIRE|WALL":
            wall_turns[lane] = 1
            wall_damage[lane] = 2
            wall_reveal[lane] = false
            last_event = "FIRE WALL blocks %s lane for 1 turn." % lane

        "ICE|WALL":
            wall_turns[lane] = 2
            wall_damage[lane] = 0
            wall_reveal[lane] = false
            last_event = "ICE WALL blocks %s lane for 2 turns." % lane

        "LIGHT|WALL":
            wall_turns[lane] = 1
            wall_damage[lane] = 0
            wall_reveal[lane] = true
            last_event = "LIGHT WALL reveals hidden enemies crossing %s lane." % lane

        "FIRE|SHIELD":
            shield_block = 2
            shield_retaliation = 1
            last_event = "FIRE SHIELD will block 2 damage and retaliate for 1."

        "ICE|SHIELD":
            shield_block = 3
            shield_retaliation = 0
            last_event = "ICE SHIELD will block 3 damage."

        "LIGHT|SHIELD":
            enemy_hidden = false
            shield_block = 2
            shield_retaliation = 0
            last_event = "LIGHT SHIELD revealed the enemy and will block 2 damage."

        "BREAK|ARMOR":
            enemy_armor = 0
            last_event = "BREAK ARMOR removed all enemy armor."

        "ICE|ARMOR":
            player_temp_armor = 4
            armor_retaliation = 0
            last_event = "ICE ARMOR granted 4 temporary armor."

        "FIRE|ARMOR":
            player_temp_armor = 2
            armor_retaliation = 1
            last_event = "FIRE ARMOR granted 2 temporary armor with melee retaliation."

        "FIRE|TRAP":
            trap_type[lane] = "fire"
            last_event = "FIRE TRAP armed in %s lane." % lane

        "ICE|TRAP":
            trap_type[lane] = "ice"
            last_event = "ICE TRAP armed in %s lane." % lane

        "LIGHT|TRAP":
            trap_type[lane] = "light"
            last_event = "LIGHT TRAP armed in %s lane." % lane

        _:
            return false

    return true

func attempt_enemy_advance(lane: String) -> bool:
    if lane != "left" and lane != "right":
        return false

    var armed_trap: String = trap_type[lane]

    if armed_trap != "":
        trap_type[lane] = ""

        match armed_trap:
            "fire":
                _damage_enemy(4)
                last_event = "FIRE TRAP triggered for 4 damage."
            "ice":
                enemy_delayed_activations += 1
                last_event = "ICE TRAP triggered; activation lost."
                return false
            "light":
                enemy_hidden = false
                last_event = "LIGHT TRAP triggered; enemy revealed."

    if wall_turns[lane] > 0:
        if wall_reveal[lane]:
            enemy_hidden = false

        if wall_damage[lane] > 0:
            _damage_enemy(wall_damage[lane])
            wall_damage[lane] = 0

        last_event = "Enemy advance blocked by wall."
        return false

    last_event = "Enemy advance completed."
    return true

func receive_enemy_attack(damage: int, melee := true) -> int:
    var remaining := maxi(damage, 0)

    if shield_block > 0:
        var blocked := mini(shield_block, remaining)
        remaining -= blocked
        shield_block -= blocked

        if shield_retaliation > 0:
            _damage_enemy(shield_retaliation)
            shield_retaliation = 0

    if remaining > 0 and player_temp_armor > 0:
        var had_armor := player_temp_armor > 0
        var absorbed := mini(player_temp_armor, remaining)
        player_temp_armor -= absorbed
        remaining -= absorbed

        if melee and had_armor and armor_retaliation > 0:
            _damage_enemy(armor_retaliation)

    if remaining > 0:
        player_hp = maxi(player_hp - remaining, 0)

    last_event = "Enemy attack resolved."
    return remaining

func end_enemy_turn() -> void:
    for lane in ["left", "right"]:
        if wall_turns[lane] > 0:
            wall_turns[lane] -= 1

            if wall_turns[lane] == 0:
                wall_damage[lane] = 0
                wall_reveal[lane] = false

func consume_delay() -> bool:
    if enemy_delayed_activations <= 0:
        return false

    enemy_delayed_activations -= 1
    last_event = "Enemy activation skipped."
    return true

func snapshot() -> Dictionary:
    return {
        "enemy_hp": enemy_hp,
        "enemy_armor": enemy_armor,
        "enemy_hidden": enemy_hidden,
        "enemy_delayed_activations": enemy_delayed_activations,
        "player_hp": player_hp,
        "player_temp_armor": player_temp_armor,
        "shield_block": shield_block,
        "left_wall_turns": wall_turns["left"],
        "right_wall_turns": wall_turns["right"],
        "left_trap": trap_type["left"],
        "right_trap": trap_type["right"],
    }

func _damage_enemy(amount: int) -> void:
    var remaining := maxi(amount, 0)

    if enemy_armor > 0:
        var absorbed := mini(enemy_armor, remaining)
        enemy_armor -= absorbed
        remaining -= absorbed

    if remaining > 0:
        enemy_hp = maxi(enemy_hp - remaining, 0)
