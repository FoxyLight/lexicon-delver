class_name EncounterCatalog
extends RefCounted

const ENCOUNTER_A := {
    "id": "A",
    "title": "Shared-Resource Readability",
    "purpose": "Test basic selection, preview, consumption, and shared-word opportunity cost.",
    "available_words": ["FIRE", "ICE", "BALL", "WALL"],
    "player_hp": 7,
    "threats": [
        {
            "id": "runner",
            "name": "Runner",
            "hp": 3,
            "armor": 0,
            "lane": "left",
            "steps": 1,
            "hidden": false,
            "attack_damage": 2,
            "attack_type": "melee",
            "timing": "attacks when it reaches the player",
        },
        {
            "id": "caster",
            "name": "Back-line Caster",
            "hp": 4,
            "armor": 0,
            "lane": "back",
            "steps": 0,
            "hidden": false,
            "attack_damage": 3,
            "attack_type": "ranged",
            "timing": "attacks on the next enemy turn",
        },
    ],
}

const ENCOUNTER_B := {
    "id": "B",
    "title": "WALL versus TRAP",
    "purpose": "Test persistent lane blocking versus a one-shot triggered lane effect.",
    "available_words": ["FIRE", "ICE", "WALL", "TRAP"],
    "player_hp": 7,
    "threats": [
        {
            "id": "runner",
            "name": "Runner",
            "hp": 3,
            "armor": 0,
            "lane": "left",
            "steps": 1,
            "hidden": false,
            "attack_damage": 2,
            "attack_type": "melee",
            "timing": "attacks when it reaches the player",
        },
        {
            "id": "brute",
            "name": "Brute",
            "hp": 6,
            "armor": 0,
            "lane": "right",
            "steps": 2,
            "hidden": false,
            "attack_damage": 3,
            "attack_type": "melee",
            "timing": "attacks when it reaches the player",
        },
    ],
}

const ENCOUNTER_C := {
    "id": "C",
    "title": "Mixed-Hand Tactical Allocation",
    "purpose": "Test multi-word planning, visible consumption, semantic prediction, and preserving words for later use.",
    "available_words": ["FIRE", "ICE", "LIGHT", "BALL", "WALL", "TRAP"],
    "player_hp": 7,
    "threats": [
        {
            "id": "scout",
            "name": "Hidden Scout",
            "hp": 2,
            "armor": 0,
            "lane": "left",
            "steps": 1,
            "hidden": true,
            "attack_damage": 2,
            "attack_type": "melee",
            "timing": "attacks when it reaches the player",
        },
        {
            "id": "brute",
            "name": "Brute",
            "hp": 6,
            "armor": 0,
            "lane": "right",
            "steps": 2,
            "hidden": false,
            "attack_damage": 3,
            "attack_type": "melee",
            "timing": "attacks when it reaches the player",
        },
        {
            "id": "caster",
            "name": "Back-line Caster",
            "hp": 4,
            "armor": 0,
            "lane": "back",
            "steps": 0,
            "hidden": false,
            "attack_damage": 3,
            "attack_type": "ranged",
            "timing": "attacks on the next enemy turn",
        },
    ],
}

const ENCOUNTERS := [
    ENCOUNTER_A,
    ENCOUNTER_B,
    ENCOUNTER_C,
]

static func get_encounter(id: String) -> Dictionary:
    for encounter in ENCOUNTERS:
        if encounter["id"] == id:
            return encounter.duplicate(true)

    return {}

static func all_encounters() -> Array:
    var result: Array = []

    for encounter in ENCOUNTERS:
        result.append(encounter.duplicate(true))

    return result
