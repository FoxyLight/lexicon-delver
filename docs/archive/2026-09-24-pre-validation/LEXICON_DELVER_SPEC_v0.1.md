# Lexicon Delver Specification v0.1

Status: Authoritative prototype specification
Date: 2026-09-24

## 1. Purpose

Lexicon Delver tests whether players can combine ordinary words into tactically meaningful abilities whose behavior is predictable from language.

The game is not currently a full deckbuilder, roguelite, RPG, or progression game.

This specification defines only the minimum concept needed for paper validation.

## 2. Core hypothesis

Reusable semantic components can create tactically different abilities whose effects are predictable enough from their words that players make strategic combinations rather than memorize recipes.

## 3. Core player decision

The player receives a fixed hand of word cards.

Each word may have several valid partners.

A word can be used only once.

Therefore every merge has opportunity cost.

Example:

FIRE can combine with:
- BALL
- WALL
- SHIELD
- ARMOR

Using FIRE + BALL prevents FIRE + WALL, FIRE + SHIELD, and FIRE + ARMOR for the remainder of the encounter.

## 4. Prototype vocabulary

The authoritative prototype vocabulary contains eight cards:

- FIRE
- ICE
- LIGHT
- BREAK
- BALL
- WALL
- SHIELD
- ARMOR

## 5. Semantic grammar

### Modifier / function words

FIRE
- damage
- burning
- retaliation

ICE
- delay
- blocking
- stronger protection

LIGHT
- reveal
- detection

BREAK
- removal of physical defense

### Form / target words

BALL
- projectile ability

WALL
- lane barrier

SHIELD
- personal defense

ARMOR
- durable defense or armor interaction

## 6. Supported prototype combinations

| Combination | Prototype effect |
|---|---|
| FIRE + BALL | Deal 4 damage |
| ICE + BALL | Deal 2 damage and delay the target 1 turn |
| LIGHT + BALL | Reveal the target and deal 2 damage |
| FIRE + WALL | Block one lane for 1 turn; first entrant takes 2 damage |
| ICE + WALL | Block one lane for 2 turns |
| LIGHT + WALL | Reveal hidden enemies crossing that lane |
| FIRE + SHIELD | Block 2 damage; attacker takes 1 damage |
| ICE + SHIELD | Block 3 damage |
| LIGHT + SHIELD | Reveal hidden enemies and block 2 damage |
| BREAK + ARMOR | Remove all armor from one enemy |
| ICE + ARMOR | Gain 4 temporary armor |
| FIRE + ARMOR | Gain 2 temporary armor; melee attackers take 1 damage |

Unsupported combinations cannot be played in the current prototype.

## 7. Consumption rule

When two words are combined:
- both source cards are consumed,
- the resulting ability resolves,
- those source cards are unavailable for the rest of the scenario.

There is no recycling, splitting, copying, or recovery in v0.1.

## 8. Prototype encounter language

Current scenarios may use:
- health
- armor
- hidden state
- lanes
- attack timing
- delays
- temporary armor

These exist only to create tactical consequences for the word combinations.

They must remain subordinate to the word-merging test.

## 9. Design requirements

A strong Lexicon Delver scenario should provide:
- at least two plausible combinations,
- materially different consequences,
- shared-word competition,
- enough information for the player to predict likely outcomes,
- no single forced answer unless the scenario is intentionally testing a failure mode.

## 10. Failure modes

The concept fails its current hypothesis if testing shows that:
- players must memorize recipes,
- word meanings do not reliably predict broad effects,
- one combination dominates most situations,
- tactical interest comes entirely from numbers rather than language,
- players treat source words as decorative labels,
- reasonable expected combinations are frequently rejected,
- most scenarios collapse to forced moves.

## 11. Important unresolved questions

### U-01: Semantic predictability at scale

A small vocabulary may be coherent while a larger vocabulary becomes inconsistent.

This cannot be resolved by the current paper test.

### U-02: Word-game identity

The prototype uses compositional phrases as well as conventional compounds.

Testing should record whether players naturally experience this as word merging.

### U-03: Content scalability

The project has not established how many useful, predictable combinations can exist without exceptions or recipe memorization.

Do not investigate this until the core mechanic passes.

## 12. Scope boundary

This specification does not define:
- campaign structure
- roguelite runs
- deck construction
- rewards
- progression
- enemies beyond diagnostic needs
- long-term balance
- implementation technology
- UI
- commercial scope

Those are intentionally deferred.
