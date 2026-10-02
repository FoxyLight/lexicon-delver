# Lexicon Delver Diagnostic Playtest Specification v0.1

Status: Authoritative
Date: 2026-09-24

## 1. Validation goal

Determine whether the word-merging mechanic produces meaningful tactical choices that players can reason about from word meaning.

Primary success evidence:

A player identifies at least two plausible moves, predicts materially different consequences, chooses between them for a coherent reason, and later connects the result to that choice.

Primary failure evidence:

A player recognizes legal combinations but sees no meaningful reason to choose one over another, or must rely on recipe memorization.

## 2. Common procedure

For each scenario record:

1. First move chosen
2. Other move seriously considered
3. Why the chosen move was preferred
4. Predicted consequence before resolution
5. Any rule surprise
6. Whether the player felt more than one reasonable choice existed
7. What the player believes caused the outcome

Classify stated reasoning after the fact as:
- tactical effect
- future resource preservation
- numerical optimization
- semantic inference
- word recognition only
- guess
- other

Do not coach the player toward the intended tradeoff.

---

# LD-D1: One FIRE, Three Uses

## State

Threats:
- 4-health enemy
- second enemy approaching through a narrow lane
- incoming 3-damage attack

Available words:
- FIRE
- BALL
- WALL
- SHIELD

Available combinations:
- FIREBALL: deal 4 damage
- FIREWALL: block lane 1 turn; first entrant takes 2 damage
- FIRE SHIELD: block 2 damage; attacker takes 1 damage

## Test question

Does one flexible modifier create several genuinely useful tactical options?

## Supporting evidence

The player can explain why each option solves a different problem and makes a situational choice.

## Evidence against

One FIRE use appears plainly superior or the player sees the other combinations as fake choices.

## Unique purpose

Tests flexibility and opportunity cost around a single modifier.

---

# LD-D2: Shared Form Competition

## State

Two enemies:
- fast weak enemy in left lane
- slow strong enemy in right lane

Available words:
- FIRE
- ICE
- WALL

Available combinations:
- FIREWALL: block one lane for 1 turn; first entrant takes 2 damage
- ICE WALL: block one lane for 2 turns

The WALL card can be used only once.

## Test question

Does competition for the same form word produce a meaningful semantic choice?

## Supporting evidence

The player reasons about damage versus delay and lane assignment.

## Evidence against

The decision reduces to obvious arithmetic or one modifier has no plausible use.

## Unique purpose

Tests competition around a shared form word rather than a modifier.

---

# LD-D3: Multiple Valid Solutions

## State

Threats:
- hidden 2-health attacker
- visible 4-health attacker
- incoming 2-damage hit

Available words:
- LIGHT
- FIRE
- ICE
- BALL
- SHIELD

Relevant combinations:
- LIGHTBALL: reveal target and deal 2 damage
- FIREBALL: deal 4 damage
- ICEBALL: deal 2 damage and delay target 1 turn
- LIGHT SHIELD: reveal hidden enemies and block 2 damage
- FIRE SHIELD: block 2 damage; attacker takes 1
- ICE SHIELD: block 3 damage

## Test question

Can different word allocations produce genuinely different viable plans?

## Supporting evidence

Multiple plausible lines emerge and players can explain tradeoffs.

## Evidence against

One sequence dominates or alternatives are only cosmetically different.

## Unique purpose

Tests whole-hand allocation rather than one component.

---

# LD-D4: Semantic Prediction

## Procedure

Do not show the effect table first.

Show only these combinations:
- FIREBALL
- ICE WALL
- LIGHT SHIELD
- BREAK ARMOR

Ask the player what each should probably do.

Do not score exact numbers.

## Expected broad functions

FIREBALL
- direct damage / burning projectile

ICE WALL
- blocking / slowing barrier

LIGHT SHIELD
- defense plus reveal / detection

BREAK ARMOR
- remove or reduce armor

## Test question

Can players infer broad mechanical function from the words themselves?

## Supporting evidence

Predictions align with the intended functional categories even if exact details differ.

## Evidence against

Players routinely predict incompatible effects or find the official mapping surprising.

## Unique purpose

Directly tests semantic predictability.

---

# LD-D5: Open Tactical Encounter

## State

Brute:
- 6 health
- 2 armor
- reaches player in 3 turns

Hidden Archer:
- 3 health
- attacks every 2 turns

Runner:
- 2 health
- reaches player next turn through a narrow lane

Available words:
- FIRE
- ICE
- LIGHT
- BREAK
- BALL
- WALL
- SHIELD
- ARMOR

Use each word once.

Goal:
- survive three enemy turns
- neutralize at least two threats

Use the supported combination table from `LEXICON_DELVER_SPEC_v0.1.md`.

## Test question

Does the full small system support planning without collapsing into recipe lookup or ordinary numerical optimization?

## Supporting evidence

The player:
- considers several viable plans,
- reserves words for later purposes,
- describes choices using word meaning,
- understands the cost of consuming flexible components.

## Evidence against

The player:
- continually consults recipes,
- reasons almost entirely from numbers,
- treats source words as irrelevant labels,
- or converges immediately on one obvious sequence.

## Unique purpose

System-level stress test.

---

# 3. Rule-surprise log

Record every instance where the player:
- expects an unsupported merge,
- expects a different broad effect,
- asks why two words combine,
- asks why two reasonable words do not combine,
- interprets a word's semantic role differently from the specification.

These are primary evidence, not minor usability notes.

# 4. What not to measure yet

Do not use as primary decision criteria:
- 1-10 fun ratings
- theme preference
- progression requests
- feature wishlists
- willingness to buy
- visual presentation feedback

One optional closing question is allowed:

"Was anything confusing or arbitrary?"

# 5. Decision after testing

After the five scenarios, assess:

CONTINUE
- meaningful choices repeatedly occur,
- semantic prediction is broadly reliable,
- no dominant combination invalidates most scenarios.

PIVOT
- the core idea works but one narrow rule or semantic mapping causes repeated failure.

KILL
- choices are mostly forced, arbitrary, recipe-driven, or equivalent to ordinary card optimization with word labels.

Do not expand scope before making this decision.
