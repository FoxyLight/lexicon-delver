# Lexicon Delver Semantic Scalability Experiment v0.1.1 — Results and Decision

Status: Authoritative
Date: 2026-09-24

## 1. Experiment scope

This experiment tested the smallest vocabulary expansion from the validated eight-word baseline by adding one new form word:

- TRAP

The baseline vocabulary and all prior validated combination rules remained unchanged.

The new supported combinations were:

- FIRE + TRAP
- ICE + TRAP
- LIGHT + TRAP

BREAK + TRAP remained unsupported.

The experiment used three diagnostic scenarios:

- SS-1: Blind Semantic Transfer
- SS-2: WALL versus TRAP
- SS-3: Mixed-Hand Transfer

SS-3 was rerun under v0.1.1 after the first run exposed a presentation-memory problem. In v0.1.1, consumed source words were explicitly removed from the visible available-word pool.

## 2. SS-1 evidence

Player predictions before seeing the new combination table:

- Expected TRAP partners: FIRE, ICE, LIGHT
- FIRE TRAP: expected to set the triggering enemy on fire
- ICE TRAP: expected cold damage
- LIGHT TRAP: expected some form of enemy exposure
- BREAK TRAP: no clear expectation
- TRAP versus WALL: expected TRAP to hold enemies, but the distinction was uncertain

Interpretation:

- FIRE transferred correctly at the broad semantic level.
- LIGHT transferred correctly at the broad semantic level.
- ICE did not transfer correctly on first contact; the player predicted damage rather than delay/control.
- BREAK + TRAP being unsupported did not create an obvious expectation conflict.
- TRAP's distinction from WALL was initially incomplete.

## 3. SS-2 evidence

State included:

- Runner in the left lane
- Brute in the right lane
- FIRE, ICE, WALL, TRAP available

Chosen move:

- FIRE WALL in the left lane

Alternative seriously considered:

- FIRE TRAP

Reason:

- The player wanted to block the Runner.

Expected distinction:

- FIRE TRAP was understood primarily as a damaging triggered effect.
- WALL was chosen for blocking.

Player reported that WALL and TRAP felt meaningfully different.

Interpretation:

The player distinguished a persistent/blocking lane form from a triggered lane form and used that distinction tactically.

## 4. SS-3 evidence

The corrected v0.1.1 rerun is authoritative for SS-3 mixed-hand evidence.

Initial visible word pool:

- FIRE
- ICE
- LIGHT
- BALL
- WALL
- TRAP

Chosen move:

- FIRE BALL targeting the visible Back-line Caster

Alternative considered:

- revealing the Hidden Scout

Reason:

- the Caster was going to deal ranged damage on the next enemy turn

Predicted result:

- neutralize the Caster

Resource intention:

- preserve ICE for slowing the Brute

Resolution:

- FIRE BALL dealt 4 damage
- Caster was neutralized
- FIRE and BALL were consumed and explicitly removed from the visible pool

Updated visible pool:

- ICE
- LIGHT
- WALL
- TRAP

Planned follow-up:

- ICE TRAP to deal with the Scout

Interpretation:

With consumed words visibly removed, the player did not repeat the prior illegal LIGHT BALL follow-up. The player continued reasoning from remaining semantic roles and opportunity cost.

## 5. Decision

Decision: CONTINUE

The experiment satisfies the precommitted CONTINUE criteria:

1. Broad semantic prediction succeeded for at least two of FIRE TRAP, ICE TRAP, and LIGHT TRAP before the table was shown.
   - FIRE: pass
   - LIGHT: pass
   - ICE: miss

2. TRAP became understandable as tactically distinct from WALL.
   - SS-2 showed a clear blocking-versus-trigger distinction in the player's reasoning.

3. WALL and TRAP produced meaningfully different tactical reasoning.
   - The player considered FIRE WALL and FIRE TRAP for the same lane threat and chose based on blocking versus triggered damage.

4. Mixed-hand reasoning continued to rely on word meaning and opportunity cost.
   - FIRE BALL was chosen to remove an immediate ranged threat.
   - ICE was intentionally preserved for later control.
   - After visible consumption, the follow-up used only legal remaining words.

5. No new combination caused repeated arbitrary-feeling surprise.
   - BREAK + TRAP did not create friction.
   - ICE TRAP remains a semantic watch item but did not produce repeated failure.

## 6. Material watch item

ICE + TRAP did not transfer cleanly during blind prediction.

The player predicted cold damage rather than delay/control.

This is not sufficient evidence for a pivot because:

- FIRE and LIGHT transferred successfully,
- ICE's baseline semantic role includes delay/blocking rather than cold damage,
- the miss occurred once,
- later tactical use of ICE remained coherent,
- no repeated arbitrary-feeling failure was observed.

Do not change ICE or ICE TRAP yet.

## 7. What this result establishes

This experiment supports the claim that the validated semantic grammar can survive at least one carefully chosen new form word without collapsing into recipe memorization.

It also supports the procedural lesson that consumed source words must remain visibly removed during paper testing so presentation-memory errors are not mistaken for mechanic failures.

## 8. What this result does not establish

This result does not establish:

- large-vocabulary scalability,
- successful addition of new modifier words,
- long-term balance,
- full-game depth,
- deckbuilding viability,
- progression structure,
- commercial viability.

## 9. Next authorized question

The next highest-value experiment is a separate modifier-expansion test.

That test should:

- preserve the nine-word baseline now consisting of the original eight words plus TRAP,
- add only one new modifier word,
- test whether the new modifier transfers consistently across established forms,
- avoid introducing new combat primitives where possible,
- precommit CONTINUE / PIVOT / KILL criteria before testing.

Do not add multiple new words at once.
