# Lexicon Delver Semantic Scalability Experiment v0.1.1

Status: Authoritative experiment specification
Date: 2026-09-24

## 1. Purpose

Test the smallest possible vocabulary expansion that can reveal whether Lexicon Delver's validated semantic grammar transfers to unfamiliar combinations without requiring recipe memorization.

This experiment does not test full-game scalability, long-term balance, progression, deckbuilding, or commercial scope.

The validated eight-word prototype remains the baseline and is unchanged.

## 2. Baseline preserved

Authoritative baseline vocabulary:

- FIRE
- ICE
- LIGHT
- BREAK
- BALL
- WALL
- SHIELD
- ARMOR

All existing semantic roles, supported combinations, effects, and consumption rules remain unchanged.

No baseline combination is rebalanced or removed.

## 3. Expansion under test

Add exactly one new form word:

- TRAP

### TRAP semantic role

TRAP:
- lane-based
- waits for an enemy to trigger it
- resolves once, then is consumed
- does not inherently block movement

This is intentionally distinct from WALL:

WALL:
- immediately creates a lane barrier
- changes movement for a duration

TRAP:
- waits
- triggers once
- applies the modifier's effect to the triggering enemy

## 4. New supported combinations

Only these three new combinations are supported in this experiment:

| Combination | Prototype effect |
|---|---|
| FIRE + TRAP | Place in one lane. The first enemy that attempts to advance in that lane takes 4 damage. If it survives, the advance continues. The trap is then consumed. |
| ICE + TRAP | Place in one lane. The first enemy that attempts to advance in that lane loses that activation and does not advance. The trap is then consumed. |
| LIGHT + TRAP | Place in one lane. The first hidden enemy that attempts to advance in that lane is revealed before completing the advance. The trap is then consumed. |

BREAK + TRAP is unsupported.

No other new combinations are introduced.

## 5. Expansion hypothesis

A player who already understands the baseline semantic roles can infer the broad behavior of a new form word and its FIRE, ICE, and LIGHT combinations without memorizing a new recipe table.

The stronger form of the hypothesis is that the player also understands why TRAP creates different tactical choices from WALL despite sharing lane-based use.

## 6. Major failure modes

### F-01: Recipe dependence

The player cannot predict the new combinations from the words and must be taught or repeatedly consult the effect table.

### F-02: Form ambiguity

The player treats TRAP as functionally equivalent to WALL or cannot explain the practical distinction between them.

### F-03: Modifier drift

FIRE, ICE, or LIGHT produces a broad effect that conflicts with what the player learned from the baseline.

### F-04: Unsupported-combination friction

BREAK + TRAP feels obviously valid to the player, and rejecting it makes the grammar feel arbitrary.

### F-05: Tactical redundancy

The new combinations are understandable but do not create meaningful choices because an existing WALL or BALL option is plainly preferable in the tested situations.

### F-06: Label substitution

The player reasons from memorized effect text or numbers while the words themselves contribute little or nothing to the decision.

## 7. Common procedure

Use a player who has completed the baseline Lexicon Delver diagnostic playtest.

For each scenario record:

1. first answer or move,
2. alternatives seriously considered,
3. reason for the answer or move,
4. predicted consequence before resolution,
5. any rule surprise,
6. whether more than one reasonable interpretation or tactical choice existed,
7. what the player believes caused the result.

Classify stated reasoning after the fact as:

- semantic transfer,
- tactical effect,
- future resource preservation,
- numerical optimization,
- recipe recall,
- guess,
- other.

Do not coach the player toward the intended semantic mapping.

Do not show the new combination table before Scenario SS-1.

After SS-1, the player may see the authoritative effects for the remainder of the experiment.

Record all expectations of unsupported combinations as primary evidence.

---

# SS-1: Blind Semantic Transfer

## Presentation

Tell the player only:

A new word has been added:

- TRAP

TRAP represents a lane-based effect that waits for an enemy to trigger it.

Do not show the supported-combination table.

Ask the player:

1. Which of FIRE, ICE, LIGHT, and BREAK would you expect to combine with TRAP?
2. What should FIRE TRAP probably do?
3. What should ICE TRAP probably do?
4. What should LIGHT TRAP probably do?
5. What should BREAK TRAP probably do, if anything?
6. How would you expect a TRAP to differ from a WALL?

Exact numbers do not matter.

## Test question

Do baseline modifier meanings transfer into a new form without recipe instruction?

## Supporting evidence

The player:

- predicts damage for FIRE TRAP,
- predicts delay, stopping, freezing, or similar control for ICE TRAP,
- predicts reveal, detection, or similar information behavior for LIGHT TRAP,
- describes TRAP as waiting or triggering rather than continuously blocking,
- does not require exact numerical knowledge.

## Evidence against

The player:

- predicts incompatible effects,
- treats the pairings as arbitrary,
- cannot distinguish TRAP from WALL,
- or relies primarily on remembered recipe patterns rather than word meaning.

## Special evidence

Record the player's expectation for BREAK TRAP without correcting it until all predictions are complete.

A strong expectation that BREAK TRAP should work is not automatically failure. It becomes important if the unsupported result feels arbitrary after explanation.

---

# SS-2: WALL versus TRAP

## State

Left lane:
- Runner
- 3 health
- 1 step from the player
- attacks for 2 damage when it reaches the player

Right lane:
- Brute
- 6 health
- 2 steps from the player
- attacks for 3 damage when it reaches the player

Available words:

- FIRE
- ICE
- WALL
- TRAP

Each word may be used once.

Relevant effects:

- FIRE + WALL: block one lane for 1 enemy turn; first entrant takes 2 damage
- ICE + WALL: block one lane for 2 enemy turns
- FIRE + TRAP: first enemy attempting to advance in the chosen lane takes 4 damage; a survivor continues the advance
- ICE + TRAP: first enemy attempting to advance in the chosen lane loses that activation and does not advance

The player may make one combination before the next enemy turn.

## Test question

Does the player understand TRAP as tactically distinct from WALL rather than as a renamed lane barrier?

## Supporting evidence

The player can identify multiple plausible choices and explain differences such as:

- killing versus delaying,
- one-shot trigger versus duration,
- immediate threat versus longer-term control,
- lane assignment,
- preserving FIRE or ICE for another form.

## Evidence against

The player:

- sees no meaningful distinction between WALL and TRAP,
- believes one form strictly dominates the other,
- or chooses solely from effect numbers without using the form meanings.

## Required questions

After the choice, ask:

1. What other move did you seriously consider?
2. Why did you choose this combination and lane?
3. What do you expect to happen?
4. Did WALL and TRAP feel meaningfully different?

No further combat simulation is required after the immediate predicted result is resolved.

---

# SS-3: Mixed-Hand Transfer

## State

Threats:

Hidden Scout:
- 2 health
- left lane
- 1 step from the player

Brute:
- 6 health
- right lane
- 2 steps from the player

Back-line Caster:
- 4 health
- visible
- will deal 3 damage on the next enemy turn

Available words:

- FIRE
- ICE
- LIGHT
- BALL
- WALL
- TRAP

Use each word once.

Relevant baseline and expansion effects:

- FIRE + BALL: deal 4 damage
- ICE + BALL: deal 2 damage and delay the target 1 turn
- LIGHT + BALL: reveal the target and deal 2 damage
- FIRE + WALL: block one lane for 1 turn; first entrant takes 2 damage
- ICE + WALL: block one lane for 2 turns
- LIGHT + WALL: reveal hidden enemies crossing that lane
- FIRE + TRAP: first enemy attempting to advance in the chosen lane takes 4 damage
- ICE + TRAP: first enemy attempting to advance in the chosen lane loses that activation
- LIGHT + TRAP: first hidden enemy attempting to advance in the chosen lane is revealed

## Procedure

Display the current available-word pool to the player before every decision.

At scenario start, the visible available-word pool is:

- FIRE
- ICE
- LIGHT
- BALL
- WALL
- TRAP

Ask the player to choose a first move.

Before resolving it, record:

- at least one alternative seriously considered,
- why the chosen move was preferred,
- the predicted consequence,
- whether any word is being intentionally preserved for a later purpose.

Resolve only the chosen ability's immediate effect.

Immediately after resolution:

1. remove both consumed source words from the visible available-word pool,
2. show the updated available-word pool to the player,
3. do not list, suggest, or describe any unavailable combination.

Then ask:

"Using only the words still visible in the available-word pool, if you had one more move afterward, what combination would you be trying to preserve or set up, and why?"

If the player names a combination that uses a word not present in the visible pool, record that as an opportunity-cost or presentation failure and do not silently substitute a legal move.

Do not require a full multi-round combat simulation.

## Test question

When the new word appears beside established forms, does the player continue to plan from semantic roles and opportunity cost rather than switch to recipe lookup?

## Supporting evidence

The player:

- considers more than one viable line,
- distinguishes BALL, WALL, and TRAP by form meaning,
- reserves a flexible modifier for a later purpose,
- explains choices using meanings such as damage, delay, reveal, projectile, barrier, or triggered lane effect.

## Evidence against

The player:

- repeatedly checks recipes,
- treats TRAP as an arbitrary special case,
- ignores source-word opportunity cost,
- or converges on a single obvious line because the new form adds no meaningful choice.

---

# 8. Decision criteria

Make the decision only after all three scenarios.

## CONTINUE

Choose CONTINUE if:

- broad semantic prediction succeeds for at least two of FIRE TRAP, ICE TRAP, and LIGHT TRAP before the table is shown,
- the player broadly understands TRAP as a one-shot triggered lane effect,
- WALL and TRAP produce meaningfully different tactical reasoning in SS-2,
- mixed-hand reasoning in SS-3 still relies substantially on word meaning and opportunity cost,
- no new combination causes repeated arbitrary-feeling surprise.

CONTINUE means the one-word expansion method is viable enough to justify a later, separate modifier-expansion test.

It does not mean large-vocabulary scalability is proven.

## PIVOT

Choose PIVOT if the baseline semantic system still transfers overall but one narrow problem repeatedly interferes, such as:

- TRAP is the wrong form word,
- LIGHT TRAP is semantically weak,
- WALL and TRAP are too difficult to distinguish,
- BREAK TRAP creates a strong and persistent expectation that makes the support grammar feel arbitrary.

A pivot should change only the failing word, mapping, or support rule before retesting.

## KILL

Choose KILL for this expansion approach if:

- the new combinations mostly require recipe instruction,
- modifier meanings fail to transfer,
- TRAP behaves as an arbitrary label,
- the tactical value comes primarily from memorized numbers,
- or the added word increases choice count without preserving understandable semantic structure.

KILL here means stop expanding the vocabulary through the current compositional grammar.

It does not retroactively invalidate the successful eight-word baseline.

## 9. Scope boundary

Do not add another word during this experiment.

Do not test a new modifier yet.

Do not redesign baseline combinations.

Do not add progression, deckbuilding, loot, campaign structure, procedural generation, rarity, upgrades, or additional enemy systems.

Do not optimize balance beyond what is necessary to keep the three diagnostic scenarios interpretable.

The next authorized design step depends entirely on the SS-1 through SS-3 decision.
