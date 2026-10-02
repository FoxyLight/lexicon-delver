# Lexicon Delver Project Status

Status: Active concept validation
Version: 0.1
Date: 2026-09-24

## Current objective

Determine whether Lexicon Delver's word-merging mechanic creates meaningful tactical decisions that players can reason about from language, rather than reducing to recipe memorization or ordinary card optimization.

## Current design state

Lexicon Delver is a small tactical word-combination game concept.

The player holds individual word cards. Words are combined into temporary abilities. Each source word can be consumed only once in the current encounter.

Examples:
- FIRE + BALL -> FIREBALL
- ICE + WALL -> ICE WALL
- LIGHT + SHIELD -> LIGHT SHIELD
- BREAK + ARMOR -> BREAK ARMOR

The important design property is opportunity cost:
- FIRE can be used with BALL, WALL, SHIELD, or ARMOR.
- BALL can be used with FIRE, ICE, or LIGHT.
- Using one word removes its other possible uses.

The current prototype intentionally uses compositional phrases as well as conventional compounds. Strict dictionary compounds are not required.

## Current evidence

Paper design has established that the mechanic can plausibly create:
- tactical tradeoffs
- competition for flexible words
- multiple valid solutions
- allocation decisions across a hand
- predictable semantic roles

The main unresolved risk is whether players can infer ability behavior from word meaning without memorizing a recipe table.

## Ready for testing

The reduced five-scenario diagnostic paper prototype is ready to run.

No additional design expansion is authorized before that test unless a genuine rules contradiction appears.

## Not yet authorized

Do not add:
- progression
- deckbuilding progression
- narrative
- metagame systems
- shops
- unlocks
- character classes
- rarity
- procedural generation
- implementation planning
- production scope
- content scaling
- visual design systems

## Exact next step

Run the five diagnostic paper-test scenarios in `DIAGNOSTIC_PLAYTEST_SPEC_v0.1.md`.

Collect the specified evidence.

Then decide whether the core mechanic:
- CONTINUES as designed,
- needs a targeted PIVOT,
- or should be KILLED before further expansion.

No concept winner comparison is needed because Lexicon Delver is now the only active direction.
