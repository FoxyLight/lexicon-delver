# Lexicon Delver Modifier Expansion Experiment v0.1.1

Status: Authoritative experiment specification
Date: 2026-09-24

## 1. Purpose

Test whether Lexicon Delver's validated semantic grammar can accept one new modifier word whose meaning transfers across existing forms without requiring recipe memorization or introducing a new combat subsystem.

This is not a full-game design exercise.

The validated nine-word system remains authoritative and unchanged.

## 2. Validated baseline

Authoritative vocabulary before this experiment:

Modifiers / function words:
- FIRE
- ICE
- LIGHT
- BREAK

Form words:
- BALL
- WALL
- SHIELD
- ARMOR
- TRAP

All previously validated combinations, effects, consumption rules, and presentation rules remain unchanged.

TRAP remains authoritative as a one-shot lane-trigger form.

Consumed source words must be visibly removed from the available-word pool during mixed-hand testing.

## 3. New modifier under test

Add exactly one modifier word:

- THORN

### THORN semantic role

THORN means:

- snag or entangle on physical contact,
- delay an enemy after it touches, strikes, or triggers the affected form,
- favor reactive control rather than direct damage.

THORN introduces no new status condition, timing subsystem, movement rule, targeting rule, or resource.

It uses only existing blocking, one-turn delay, temporary armor, melee-attacker, and lane-trigger concepts.

## 4. Supported THORN combinations

Only these four combinations are supported in this experiment:

| Combination | Prototype effect |
|---|---|
| THORN + WALL | Block one lane for 1 enemy turn; the first enemy whose advance is blocked also skips its next activation |
| THORN + SHIELD | Block 1 damage from the first attack during the next enemy turn; that attacker skips its next activation |
| THORN + ARMOR | Gain 2 temporary armor; the first melee attacker that completes an attack while that armor remains skips its next activation |
| THORN + TRAP | Place in one lane; the first enemy that attempts to advance in that lane completes that advance normally, then skips its next activation; the trap is consumed |

THORN + BALL is unsupported.

No other new combinations are introduced.

## 5. Why BALL is unsupported

The experiment defines THORN narrowly as reactive contact entanglement.

BALL is an active projectile form rather than a contact surface or trigger.

The unsupported pairing is intentional and must be tested for semantic friction rather than hidden from the player.

If players strongly expect THORN BALL and find its rejection arbitrary, that is evidence against this modifier grammar.

## 6. Experiment hypothesis

A player who understands the existing forms can infer that THORN consistently snags or entangles enemies after contact across WALL, SHIELD, ARMOR, and TRAP, while recognizing that those forms still determine how and when contact occurs.

The stronger hypothesis is that THORN remains semantically and tactically distinct from FIRE because THORN converts contact into delayed future action rather than additional damage.

## 7. Major failure modes

### F-01: Recipe dependence

The player cannot predict THORN combinations from the words and must memorize the effect table.

### F-02: Modifier inconsistency

THORN means materially different things across WALL, SHIELD, ARMOR, and TRAP rather than transferring one understandable contact-entanglement concept.

### F-03: FIRE collision

The player cannot explain a meaningful semantic or tactical distinction between THORN's reactive delay and FIRE's damage on overlapping forms.

### F-04: BALL exclusion friction

The player strongly expects THORN BALL to work and finds its exclusion arbitrary after the contact-entanglement rule is explained.

### F-05: Form collapse

The player focuses only on THORN's delay and stops reasoning about whether the form is a WALL, SHIELD, ARMOR, or TRAP.

### F-06: Numerical substitution

The player chooses between FIRE and THORN without using the damage-versus-reactive-delay distinction or the trigger conditions.

### F-07: Tactical redundancy

THORN combinations are understandable but add no meaningful decision because FIRE's damage and THORN's reactive delay do not lead to different practical choices in the tested states.

## 8. Common procedure

Use a player who completed the validated baseline and TRAP semantic-scalability experiments.

For each scenario record:

1. first prediction or move,
2. alternatives seriously considered,
3. reason for the answer or move,
4. predicted consequence before resolution,
5. any rule surprise,
6. whether more than one reasonable interpretation or tactical choice existed,
7. what the player believes caused the result.

Classify reasoning after the fact as:

- semantic transfer,
- form reasoning,
- tactical effect,
- future resource preservation,
- numerical optimization,
- recipe recall,
- guess,
- other.

Do not coach the player toward intended distinctions.

Do not show the THORN combination table before ME-1 is complete.

After any merge in a mixed-hand scenario, visibly remove both consumed words before asking for a follow-up plan.

Record unsupported-combination expectations as primary evidence.

---

# ME-1: Blind Modifier Transfer

## Presentation

Tell the player only:

A new modifier word has been added:

- THORN

THORN represents something that snags or entangles after physical contact.

Do not show the supported-combination table.

Ask:

1. Which of BALL, WALL, SHIELD, ARMOR, and TRAP would you expect THORN to combine with?
2. What should THORN WALL probably do?
3. What should THORN SHIELD probably do?
4. What should THORN ARMOR probably do?
5. What should THORN TRAP probably do?
6. What should THORN BALL probably do, if anything?
7. In broad terms, how should THORN differ from FIRE?

Exact numbers do not matter.

## Test question

Does one new modifier meaning transfer across established forms before recipe instruction?

## Supporting evidence

The player broadly predicts:

- reactive delay or entanglement on WALL,
- attacker delay after contact with SHIELD,
- melee-attacker delay after contact with ARMOR,
- delayed future action after triggering TRAP,
- a coherent shared idea across those forms.

The player does not need exact numbers.

## Evidence against

The player:

- predicts unrelated functions across forms,
- cannot identify a shared THORN meaning,
- treats the combinations as arbitrary recipes,
- or immediately treats THORN as interchangeable with FIRE.

## Special evidence

Record the player's expectation for THORN BALL without correcting it until all predictions are complete.

A predicted THORN BALL is not automatically failure.

After all predictions, explain the reactive-contact-entanglement boundary and ask whether BALL's exclusion feels reasonable or arbitrary.

---

# ME-2: FIRE versus THORN

## State

Runner:
- 3 health
- left lane
- 1 step from the player
- melee attack deals 2 damage

Brute:
- 6 health
- right lane
- 1 step from the player
- melee attack deals 3 damage

Available words:

- FIRE
- THORN
- WALL
- SHIELD

Each word may be used once.

Relevant effects:

- FIRE + WALL: block one lane for 1 enemy turn; first entrant takes 2 damage
- THORN + WALL: block one lane for 1 enemy turn; first enemy whose advance is blocked also skips its next activation
- FIRE + SHIELD: block 2 damage; attacker takes 1 damage
- THORN + SHIELD: block 1 damage; that attacker skips its next activation

The player may make one combination before the next enemy turn.

## Procedure

Ask the player to choose one combination and any required lane.

Before resolution record:

- another move seriously considered,
- why the chosen modifier was preferred,
- why the chosen form was preferred,
- predicted consequence,
- whether FIRE and THORN felt meaningfully different.

Resolve only the immediate next enemy turn as required by the chosen WALL or SHIELD effect. If THORN creates a skipped next activation beyond that turn, record that pending delay explicitly; no second enemy turn is required.

## Test question

Can the player distinguish the new modifier from FIRE using semantic role and trigger structure rather than damage arithmetic alone?

## Supporting evidence

The player reasons about distinctions such as:

- protection versus retaliation,
- blocking versus being struck,
- FIRE's damage identity versus THORN's contact-entanglement identity,
- immediate damage versus delayed future action,
- which enemy is expected to trigger the chosen form.

## Evidence against

The player:

- treats FIRE and THORN as interchangeable,
- ignores the immediate-damage versus future-delay distinction,
- cannot explain why one modifier better fits the intended trigger,
- or sees one modifier as a strict upgrade.

---

# ME-3: Mixed-Form Opportunity Cost

## State

Hidden Scout:
- 2 health
- left lane
- 1 step from the player

Brute:
- 6 health
- right lane
- 1 step from the player
- melee attack deals 3 damage

Back-line Caster:
- 4 health
- visible
- will deal 3 damage on the next enemy turn

Available words:

- FIRE
- THORN
- LIGHT
- WALL
- SHIELD
- TRAP

Each word may be used once.

Relevant effects:

- FIRE + WALL: block one lane for 1 turn; first entrant takes 2 damage
- THORN + WALL: block one lane for 1 turn; first blocked enemy also skips its next activation
- LIGHT + WALL: reveal hidden enemies crossing that lane
- FIRE + SHIELD: block 2 damage; attacker takes 1 damage
- THORN + SHIELD: block 1 damage; that attacker skips its next activation
- LIGHT + SHIELD: reveal hidden enemies and block 2 damage
- FIRE + TRAP: first enemy attempting to advance in the chosen lane takes 4 damage
- THORN + TRAP: first enemy attempting to advance in the chosen lane completes that advance, then skips its next activation
- LIGHT + TRAP: first hidden enemy attempting to advance in the chosen lane is revealed

## Procedure

Display the current available-word pool before every decision.

Ask the player to choose a first move.

Before resolving it record:

- one alternative seriously considered,
- why the chosen modifier was preferred,
- why the chosen form was preferred,
- predicted consequence,
- whether any word is intentionally being preserved.

Resolve only the chosen ability's immediate effect.

Immediately remove both consumed source words from the visible pool.

Show the updated available-word pool.

Then ask:

"Using only the words still visible, if you had one more move, what combination would you be trying to preserve or set up, and why?"

Do not require a full multi-round combat simulation.

## Test question

Does THORN remain understandable inside a mixed hand, with both modifier choice and form choice contributing to planning?

## Supporting evidence

The player:

- distinguishes modifier meaning from form meaning,
- considers more than one viable line,
- preserves words for later purposes,
- keeps consumed-word opportunity cost active,
- uses THORN because reactive entanglement fits the intended trigger rather than because its number is larger.

## Evidence against

The player:

- loses track of modifier versus form roles,
- treats THORN as interchangeable with FIRE despite the damage-versus-delay distinction,
- ignores opportunity cost,
- or repeatedly relies on recipe lookup.

---

# 9. Decision criteria

Make the decision only after ME-1 through ME-3 are complete.

## CONTINUE

Choose CONTINUE if:

- before seeing the table, the player predicts the shared contact-entanglement role for at least three of THORN WALL, THORN SHIELD, THORN ARMOR, and THORN TRAP,
- the player can explain a meaningful broad distinction between THORN and FIRE,
- BALL exclusion does not produce persistent arbitrary-feeling friction,
- ME-2 produces modifier-sensitive reasoning based on immediate damage versus reactive delay rather than only effect magnitude,
- ME-3 preserves both semantic reasoning and consumed-word opportunity cost,
- no THORN mapping causes repeated rule surprise.

CONTINUE means modifier expansion is viable enough to justify a later experiment with broader vocabulary growth.

It does not prove large-vocabulary scalability.

## PIVOT

Choose PIVOT if the new modifier concept transfers overall but one narrow issue repeatedly interferes, such as:

- THORN is the wrong word for the intended semantic role,
- THORN BALL exclusion feels arbitrary,
- one supported form mapping is weak,
- FIRE and THORN are understandable but still too tactically redundant,
- presentation causes opportunity-cost errors.

Change only the failing word, mapping, support boundary, or presentation rule before retesting.

## KILL

Choose KILL for this modifier-expansion approach if:

- THORN requires recipe memorization,
- the shared modifier meaning does not transfer across forms,
- FIRE and THORN collapse into interchangeable tactical labels,
- tactical decisions ignore the intended immediate-damage versus reactive-delay distinction,
- or adding the modifier increases combinations without preserving understandable semantic structure.

KILL here means stop expanding the modifier vocabulary through the current compositional grammar.

It does not invalidate the validated nine-word baseline.

## 10. Scope boundary

Do not add another modifier during this experiment.

Do not add another form word.

Do not redesign FIRE, ICE, LIGHT, BREAK, or TRAP.

Do not introduce status effects, damage-over-time, knockback, healing, chain attacks, new resources, new targeting systems, or new enemy subsystems.

Do not rebalance the baseline.

Do not add progression, deckbuilding, loot, campaign structure, procedural generation, rarity, upgrades, or full-game content.

The next design step depends entirely on the ME-1 through ME-3 decision.
