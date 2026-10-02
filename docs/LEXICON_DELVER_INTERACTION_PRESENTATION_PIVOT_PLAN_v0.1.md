# Lexicon Delver Interaction Presentation Pivot Plan v0.1

Status: APPROVED; P0 AUTHORIZED / ACTIVE
Work class: EXPLORE
Governing process: Standard Project Bootstrap Template v1.1.1
Starting approved baseline: 77403fe1efd805493e9cba758c69bcf137ac332d
Branch: feature/interactive-core-v0.1
Triggering decision: D-023 - Interactive Core CP4 TARGETED PIVOT

## 1. Purpose

Test whether the validated nine-word semantic system can feel materially more like combining words, rather than selecting pre-authored abilities/cards, through a bounded interaction-presentation redesign.

This pivot does not reopen the semantic grammar or combat design. The problem to solve is presentation and interaction identity.

## 2. Evidence that triggers the pivot

CP4 produced the following stable evidence:

- broad semantic prediction succeeded in all three curated encounters
- consumed words remained clear
- unavailable words were never lost track of
- more than one reasonable tactical line was perceived in each encounter
- WALL versus TRAP became distinguishable
- no merge felt meaningfully arbitrary
- final identity judgment: the prototype felt more like choosing abilities/cards than combining words
- repeated presentation judgment: the interface looked ugly/jumbled
- repeated wording issue: ICE + TRAP language around "activation" was not naturally understandable

## 3. Fixed authority

Preserve exactly:

- FIRE
- ICE
- LIGHT
- BREAK
- BALL
- WALL
- SHIELD
- ARMOR
- TRAP

Preserve all supported and unsupported pairings from LEXICON_DELVER_SPEC_v0.2.md.

Preserve:

- source-word consumption
- deterministic combat effects
- three curated encounter definitions
- encounter reset behavior
- current tactical rules
- WALL versus TRAP mechanical distinction
- ICE + TRAP mechanical effect

THORN remains PARKED / INCOMPLETE.

## 4. Pivot hypothesis

A presentation centered on visibly constructing a two-word expression, rather than clicking two ability-like buttons and reading a large result card, may make the same semantic system feel more like combining words.

## 5. Bounded interaction direction

Replace the current flat ability-button feel with a phrase-builder presentation using the same underlying selection model.

Minimum direction:

- visually separate modifier/function words from form words
- show a dedicated two-slot merge area
- make the selected words visibly combine into one constructed expression
- keep the ability preview subordinate to the constructed words rather than visually dominant
- retain immediate visible consumption after execution
- keep unsupported pair feedback concise
- separate encounter/threat information from the merge interaction
- improve spacing and hierarchy so the player can scan the interface without reading one large text block

No drag-and-drop is required unless later evidence shows click selection cannot create the intended identity.

## 6. ICE + TRAP wording correction

Do not change the mechanical effect.

Replace wording such as:

- "activation lost"
- "delayed activations"

with plain-language presentation that communicates the observable result directly.

Preferred semantic direction:

- "The next advancing enemy is stopped and skips this move."
- "Enemy move skipped."

Exact wording may be tuned during the checkpoint, but it must not introduce a new rule.

## 7. Visual hierarchy target

The playable screen should read in this order:

1. current encounter and immediate threats
2. available word tiles
3. the two-word construction area
4. concise predicted effect
5. execute/cancel
6. resolved combat state and lane controls

The encounter diagnostic purpose text should not compete visually with the playable interaction.

## 8. Explicit non-goals

Do not add:

- new vocabulary
- new pairings
- balance changes
- new enemies
- new encounters
- progression
- deckbuilding
- card rarity
- rewards
- map structure
- animation systems
- art production
- sound
- drag-and-drop framework work unless strictly necessary
- recipe encyclopedia
- new combat rules
- AI behavior
- save/load
- telemetry
- production menus
- THORN

## 9. Checkpoint sequence

### P0 - Authority and pivot baseline freeze

Purpose:

- confirm exact starting SHA 77403fe1efd805493e9cba758c69bcf137ac332d
- mirror this plan into repository documentation
- record the pivot branch state
- make no gameplay changes

PASS:

- exact SHA confirmed
- branch confirmed
- clean working tree
- plan mirrored
- no implementation change

### P1 - Visual hierarchy cleanup

Implement only:

- reorganized screen hierarchy
- cleaner spacing
- encounter/threat summary separated from merge controls
- combat-state information grouped coherently
- fullscreen-friendly layout

Do not yet change the fundamental click-to-combine interaction.

Primary question:

Is the screen materially easier to scan and understand without changing mechanics?

### P2 - Word-construction interaction

Implement only:

- modifier/function-word group
- form-word group
- dedicated first-word and second-word construction slots
- visible merged expression
- effect preview visually subordinate to the words
- current consumption behavior
- unsupported-pair feedback

Primary question:

Does creating a merge now feel more like assembling a word expression than selecting an ability/card?

### P3 - Wording correction and regression

Implement:

- plain-language ICE + TRAP presentation
- any directly related combat-state label change
- deterministic regressions for wording-sensitive presentation where practical
- no mechanical change

Primary question:

Can the ICE + TRAP consequence be understood without the term "activation"?

### P4 - Focused experiential retest

Run the same three curated encounters.

Record:

- first merge
- one alternative considered
- prediction
- result
- consumption clarity
- whether more than one line remains plausible
- whether the interaction now feels more like combining words or choosing abilities/cards
- any remaining visual confusion
- any ICE + TRAP wording confusion

Decision:

CONTINUE, second targeted PIVOT, or KILL the interactive-core presentation direction.

## 10. Automated verification

Keep existing:

- CP1 word-model tests
- CP2 combat-model tests
- CP3 encounter-catalog tests

Add only cheap deterministic checks required by presentation refactoring.

Do not build a generalized UI testing framework.

## 11. Human validation

Human approval is required after P1, P2, and P3 because those checkpoints alter the playable presentation.

P4 evidence is experiential and cannot be replaced by automated PASS.

## 12. Success criteria

The pivot succeeds only if:

- readability improves
- semantic prediction remains intact
- source-word consumption remains clear
- multiple tactical lines remain visible
- no new semantic confusion is introduced
- ICE + TRAP wording becomes understandable
- the final identity judgment shifts materially toward "combining words"

## 13. Integration rule

Because this remains EXPLORE:

- each evidence-bearing candidate must have an immutable Git identity
- failed candidates may remain preserved in branch history
- the accepted continuing prototype should only be integrated after required verification and human approval

## 14. Next action

After P0 is PASS / CLOSED, P1 may be considered for explicit authorization.

Do not begin P1 implementation until P0 is PASS / CLOSED.
