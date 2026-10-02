# Lexicon Delver Diagnostic Playtest Specification v0.1.1

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

Player:
- 7 health
- 0 starting armor

Brute:
- 6 health
- 2 armor
- right lane
- starts 3 steps from the player
- melee attack deals 3 damage

Hidden Archer:
- 3 health
- back line; not in either lane
- starts hidden
- ranged attack deals 2 damage
- attacks on enemy turns 1 and 3

Runner:
- 2 health
- left narrow lane
- starts 1 step from the player
- melee attack deals 2 damage

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

## Deterministic encounter procedure

The encounter has exactly three rounds.

Each round resolves in this order:

1. Player turn
2. Runner activation
3. Hidden Archer activation
4. Brute activation
5. End-of-round expiration

### Player turn

- The player may resolve exactly one supported combination.
- Both source words are consumed immediately.
- If no supported combination is available or the player chooses not to act, the player may pass.
- A combination resolves completely before any enemy activates.
- The player chooses all required targets or lanes when the combination is played.

### Health, armor, and damage

- Armor absorbs damage 1-for-1 before health.
- Enemy armor and player temporary armor use the same rule.
- Temporary armor persists until depleted or the scenario ends.
- An enemy at 0 health is defeated and takes no further activations.
- The player fails immediately if health reaches 0.

### Hidden targeting

- The Hidden Archer may attack while hidden and does not reveal itself by attacking.
- While hidden, it cannot be targeted by abilities unless that ability explicitly reveals a target or hidden enemy.
- LIGHT + BALL may target the Hidden Archer while hidden because the ability explicitly reveals its target.
- LIGHT + SHIELD reveals the Hidden Archer immediately.
- LIGHT + WALL does not reveal the Hidden Archer because the Archer does not cross a lane.

### Movement and reaching the player

- Runner and Brute each have a step count representing how many successful advances remain before reaching the player.
- On its activation, a non-engaged melee enemy advances 1 step unless its lane is blocked or it is delayed.
- When its step count reaches 0, it reaches the player and immediately makes its melee attack.
- After reaching the player, that enemy is engaged and makes its melee attack on every later activation.
- A lane wall affects only non-engaged enemies in that lane. It does not protect against an enemy that already reached the player.

### Walls

- FIRE + WALL or ICE + WALL must be assigned to either the left or right lane when played.
- A blocked lane prevents non-engaged enemies in that lane from advancing during each enemy activation covered by the wall.
- FIRE + WALL lasts through the immediately following enemy turn only. The first enemy whose advance it prevents takes 2 damage.
- ICE + WALL lasts through the next two enemy turns.
- LIGHT + WALL persists through the scenario for reveal purposes only; it does not block movement. It reveals a hidden enemy only if that enemy crosses the chosen lane.

### Delay

- ICE + BALL's 1-turn delay causes the target to skip its next scheduled activation that would otherwise advance or attack.
- Delay resolves before lane blocking. If a delayed enemy is also in a blocked lane, the delay is consumed and the wall does not count that skipped activation as a prevented advance.
- The delay is then consumed.

### Shields

- A SHIELD combination protects against the first attack that would deal damage during the immediately following enemy turn.
- Shield reduction applies before temporary armor or health.
- The shield reduces that one attack by its listed amount, then expires.
- Unused shield protection expires at the end of that enemy turn.
- FIRE + SHIELD deals its 1 retaliation damage to the attacker whose attack was reduced.
- LIGHT + SHIELD reveals hidden enemies immediately when played; its damage block follows the normal shield timing above.

### FIRE + ARMOR retaliation

- FIRE + ARMOR grants its listed temporary armor immediately.
- Each melee attacker that completes an attack against the player while that temporary armor remains deals its attack normally, then takes 1 damage.
- Once the granted temporary armor is depleted, this retaliation effect ends.

### Enemy activation details

Runner:
- Starts at 1 step.
- If not blocked or delayed on enemy turn 1, it reaches the player and attacks immediately.
- Once engaged, it attacks on every later Runner activation.

Hidden Archer:
- Attacks on enemy turns 1 and 3.
- It does nothing on enemy turn 2 unless a player effect changes that schedule.
- A 1-turn delay skips its next scheduled attack rather than moving that attack to a later turn.

Brute:
- Starts at 3 steps.
- If never blocked or delayed, it advances on enemy turns 1 and 2, then reaches the player and attacks on enemy turn 3.

### Neutralization and success timing

For this diagnostic scenario, a threat is neutralized if either:
- it is defeated, or
- a player effect prevents its otherwise scheduled advance or attack through the end of enemy turn 3, leaving it unable to damage the player again within the scenario.

Reveal by itself does not neutralize a threat.
Temporary armor or a shield by itself does not neutralize a threat.

After enemy turn 3 finishes:
- SUCCESS if the player has at least 1 health and at least two threats are neutralized.
- FAILURE otherwise.
- If player health reaches 0 earlier, FAILURE occurs immediately and the remaining activations do not need to resolve.

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
