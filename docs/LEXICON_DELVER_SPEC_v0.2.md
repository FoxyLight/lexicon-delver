# Lexicon Delver Specification v0.2

Status: CURRENT / AUTHORITATIVE
Governing process: Standard Project Bootstrap Template v1.1.1
Supersedes: `LEXICON_DELVER_SPEC_v0.1.md`

## 1. Purpose
Lexicon Delver tests whether players can combine ordinary words into tactically meaningful abilities whose behavior is predictable from language.

The current project is still an EXPLORE-stage game concept. This specification defines the validated semantic-combination baseline that future interactive testing must preserve. It does not define a complete deckbuilder, roguelite, RPG, progression system, campaign, or production game.

## 2. Core hypothesis
Reusable semantic components can create tactically different abilities whose effects are predictable enough from their words that players make strategic combinations rather than memorize recipes.

## 3. Core player decision
The player receives a fixed hand of word cards.
Each word may have several valid partners.
A word can be used only once.
Every merge therefore carries opportunity cost.

When two words are combined:
- both source words are consumed,
- the resulting ability resolves,
- those source words are unavailable for the rest of the scenario.

There is no recycling, splitting, copying, or recovery in the validated baseline.

Presentation requirement:
Consumed words must be visibly removed from the available-word pool during mixed-hand and future interactive testing.

## 4. Validated vocabulary
Modifier / function words:
- FIRE
- ICE
- LIGHT
- BREAK

Form / target words:
- BALL
- WALL
- SHIELD
- ARMOR
- TRAP

THORN is not part of the current authoritative vocabulary. Its modifier experiment is parked and incomplete.

## 5. Semantic grammar
FIRE:
- damage
- burning
- retaliation

ICE:
- delay
- blocking
- stronger protection

LIGHT:
- reveal
- detection

BREAK:
- removal of physical defense

BALL:
- projectile ability

WALL:
- lane barrier

SHIELD:
- personal defense

ARMOR:
- durable defense or armor interaction

TRAP:
- lane-based
- waits for an enemy to trigger it
- resolves once, then is consumed
- does not inherently block movement

WALL and TRAP are intentionally distinct:
WALL creates a lane barrier and changes movement for a duration.
TRAP waits, triggers once, applies the modifier effect, then is consumed.

## 6. Supported combinations
Baseline combinations:
- FIRE + BALL: deal 4 damage.
- ICE + BALL: deal 2 damage and delay target 1 turn.
- LIGHT + BALL: reveal target and deal 2 damage.
- FIRE + WALL: block one lane for 1 turn; first entrant takes 2 damage.
- ICE + WALL: block one lane for 2 turns.
- LIGHT + WALL: reveal hidden enemies crossing that lane.
- FIRE + SHIELD: block 2 damage; attacker takes 1 damage.
- ICE + SHIELD: block 3 damage.
- LIGHT + SHIELD: reveal hidden enemies and block 2 damage.
- BREAK + ARMOR: remove all armor from one enemy.
- ICE + ARMOR: gain 4 temporary armor.
- FIRE + ARMOR: gain 2 temporary armor; melee attackers take 1 damage.

Validated TRAP expansion:
- FIRE + TRAP: place in one lane. The first enemy that attempts to advance in that lane takes 4 damage. If it survives, the advance continues. The trap is consumed.
- ICE + TRAP: place in one lane. The first enemy that attempts to advance in that lane loses that activation and does not advance. The trap is consumed.
- LIGHT + TRAP: place in one lane. The first hidden enemy that attempts to advance in that lane is revealed before completing the advance. The trap is consumed.

BREAK + TRAP remains unsupported.

All other unsupported combinations cannot be played in the current baseline.

## 7. Prototype encounter language
Diagnostic and interactive experiments may use:
- health
- armor
- hidden state
- lanes
- attack timing
- delays
- temporary armor
- lane-triggered effects

These exist only to create tactical consequences for the word combinations and must remain subordinate to the word-merging test.

## 8. Validated evidence
### Core diagnostic
Decision: CONTINUE.

Meaningful tactical choices repeatedly occurred, broad semantic prediction was reliable enough, and no dominant combination invalidated the diagnostic set.

### Semantic scalability / TRAP
Decision: CONTINUE.

FIRE and LIGHT transferred correctly at a broad semantic level. ICE + TRAP was initially predicted as damage rather than delay, so ICE + TRAP semantic predictability remains a watch item.

WALL and TRAP became tactically distinguishable.

Visible removal of consumed words corrected a mixed-hand opportunity-cost presentation failure.

### Modifier expansion / THORN
Status: PARKED / INCOMPLETE.

ME-1 produced partial evidence only.
ME-2 and ME-3 were not completed.
No CONTINUE / PIVOT / KILL decision exists.

THORN therefore creates no durable gameplay authority.

## 9. Design requirements
A strong Lexicon Delver encounter should provide:
- at least two plausible combinations,
- materially different consequences,
- shared-word competition,
- enough information for likely outcomes to be predicted,
- no single forced answer unless intentionally testing a failure mode.

## 10. Current unresolved questions
### U-01: Interactive readability and feel
Can players manipulate, combine, consume, and understand the validated words through an interface without losing semantic clarity or opportunity-cost awareness?

### U-02: Word-game identity
Does interactive play feel meaningfully driven by word composition, rather than like an ordinary card battler whose cards happen to contain words?

### U-03: Semantic predictability beyond the validated nine-word baseline
The system has passed one form-word expansion. Broader vocabulary scaling remains unresolved.

### U-04: ICE + TRAP semantic predictability
The current mapping is validated enough to retain, but initial player prediction leaned toward cold damage rather than delay/control. Future interactive evidence should watch this mapping.

## 11. Scope boundary
This specification does not authorize:
- additional vocabulary,
- resumption of THORN,
- campaign structure,
- roguelite runs,
- deck construction,
- rewards,
- progression,
- shops,
- unlocks,
- character classes,
- rarity,
- procedural generation,
- long-term balance,
- narrative,
- commercial scope,
- production implementation.

The next priority is a separately authorized interactive-core experiment after SPBT-O1 onboarding closes.
