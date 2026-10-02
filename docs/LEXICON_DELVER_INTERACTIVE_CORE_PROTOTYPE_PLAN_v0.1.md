Lexicon Delver Interactive Core Prototype Plan v0.1

Status: APPROVED / CP0 AUTHORIZED
Work class: EXPLORE
Governing process: Standard Project Bootstrap Template v1.1.1
Starting approved baseline: 4a8fcf863ea146bf7fdfa60be5243db44c89130f
Current gameplay authority: LEXICON_DELVER_SPEC_v0.2.md

1. Purpose
Build the smallest interactive prototype capable of testing whether the validated nine-word Lexicon Delver system retains its semantic clarity, tactical opportunity cost, and word-game identity when manipulated through an interface rather than paper prompts.

This checkpoint is evidence-seeking, not production development.

2. Primary evidence question
Can the validated nine-word semantic system remain understandable, tactically meaningful, and recognizably word-driven when the player selects, previews, combines, consumes, and resolves words through an actual interactive interface?

3. Secondary questions
- Does visible word consumption make opportunity cost immediately legible without explanation?
- Can the player predict the broad result of a merge before execution?
- Do form distinctions such as WALL versus TRAP remain clear in motion?
- Does the interaction feel like combining reusable words rather than selecting ordinary pre-authored ability cards?
- Does ICE + TRAP create repeated semantic surprise in interactive play?
- Can the player understand combat consequences without needing a recipe lookup loop?

4. Fixed baseline
The experiment must preserve the current nine-word authority exactly:

Modifiers / function words:
- FIRE
- ICE
- LIGHT
- BREAK

Forms:
- BALL
- WALL
- SHIELD
- ARMOR
- TRAP

No new word may be introduced.

The current supported combinations and effects from LEXICON_DELVER_SPEC_v0.2.md remain authoritative.

THORN remains PARKED / INCOMPLETE and is outside scope.

5. Proposed implementation environment
Use Godot 4.7.2 for the local interactive prototype.

The implementation should remain deliberately thin:
- one project,
- one primary playable scene unless a second scene is materially simpler,
- minimal state model,
- no reusable framework work beyond what the prototype directly needs,
- no save system,
- no content pipeline,
- no production architecture.

This tool choice is part of this proposed plan and becomes authorized only if the plan is approved.

6. Minimum interaction loop
The prototype must let the player:
1. see the currently available words,
2. select a first word,
3. select a compatible second word,
4. see a concise preview of the resulting ability before committing,
5. choose any required target or lane,
6. execute the merge,
7. see the effect resolve,
8. see both source words removed immediately from the available pool,
9. continue reasoning from only the remaining visible words,
10. reset the encounter.

Unsupported pairings must not silently execute.

The interface may indicate that a pairing is unsupported, but it must not introduce a large recipe encyclopedia or reveal future tactical recommendations.

7. Minimum combat presentation
The prototype needs only enough combat state to make the validated effects observable:
- player health,
- enemy health where relevant,
- enemy armor where relevant,
- left and right lanes where relevant,
- hidden/revealed state,
- enemy step or approach state where relevant,
- temporary armor,
- one-turn delay / skipped activation,
- lane wall duration,
- one-shot trap state,
- shield resolution.

Presentation may be utilitarian. Clarity is required; visual polish is not.

8. Curated encounter set
Use exactly three curated encounters unless implementation evidence shows one is redundant before testing.

Encounter A: Shared-resource readability
Purpose:
- test basic selection,
- preview,
- consumption,
- shared-word opportunity cost.

Required ingredients:
- one flexible modifier with multiple plausible forms,
- at least two reasonable first moves,
- visible consequence difference.

Encounter B: WALL versus TRAP
Purpose:
- test whether persistent barrier versus one-shot trigger remains understandable interactively.

Required ingredients:
- at least one lane threat,
- both WALL and TRAP available,
- a meaningful reason to choose either form.

Encounter C: Mixed-hand tactical allocation
Purpose:
- test multi-word planning, consumed-word visibility, semantic prediction, and preservation of a word for a later use.

Required ingredients:
- at least three meaningful threats or tactical pressures,
- enough words for several plausible allocations,
- at least one reveal-related consideration,
- at least one control/delay consideration,
- no single intentionally forced solution.

The encounter definitions must use only already-authorized combat primitives.

9. Explicit non-goals
Do not add:
- progression,
- deckbuilding,
- draw piles,
- card rarity,
- procedural generation,
- map structure,
- shops,
- rewards,
- unlocks,
- metagame,
- narrative,
- character classes,
- audiovisual polish beyond readability,
- new vocabulary,
- THORN,
- telemetry infrastructure,
- analytics,
- generalized content-authoring tools,
- save/load,
- online features,
- AI-generated encounters,
- production menus,
- balance redesign.

10. Evidence collection
This experiment should collect manual/experiential evidence, not automated player telemetry.

For each encounter record:
- first merge chosen,
- one other merge seriously considered,
- why the chosen merge was preferred,
- predicted result before execution,
- any mismatch between prediction and actual broad effect,
- whether the player understood which source words were consumed,
- whether the player lost track of unavailable words,
- whether more than one reasonable tactical line felt available,
- whether the player described the choice using word meaning, effect text/numbers, or both,
- any unsupported merge the player expected to work,
- any repeated confusion around WALL versus TRAP,
- any repeated confusion around ICE + TRAP.

After the full set, ask:
- Did this feel like combining words, or choosing abilities/cards?
- Was any merge confusing or arbitrary?

Do not use a numerical fun score as the primary decision criterion.

11. Automated verification
Automated checks should cover only deterministic integrity that is cheap to verify:
- project launches successfully,
- each curated encounter can reset to its initial state,
- source words are consumed exactly once,
- consumed words cannot be selected again,
- supported pair validation matches the v0.2 authority,
- unsupported pairs do not execute,
- deterministic effect resolution for the combinations used by the curated encounters,
- reset restores encounter and word availability state.

Do not build a generalized verification framework merely for this experiment.

12. Human validation
Human approval is required at the end of each implementation checkpoint that changes the playable interaction.

Manual evidence is authoritative for:
- readability,
- semantic prediction,
- interaction feel,
- word-game identity,
- tactical meaningfulness,
- whether visible consumption is understandable.

Automated PASS cannot substitute for these judgments.

13. Checkpoint sequence

CP0 - Authority and implementation baseline freeze
Purpose:
- branch from approved SHA 4a8fcf863ea146bf7fdfa60be5243db44c89130f,
- establish the experiment branch,
- add the approved plan to repository documentation,
- confirm scope and starting authority,
- make no gameplay implementation.

PASS requirements:
- correct starting SHA,
- branch identity recorded,
- plan mirrored locally,
- working tree understood,
- no gameplay code added.

Stop after CP0 until its state is verified.

CP1 - Word interaction shell
Implement only:
- visible nine-word pool,
- first/second word selection,
- compatibility check,
- concise result preview,
- cancel/reselect,
- execute placeholder or minimal effect hook,
- immediate visible consumption,
- reset.

No full combat encounter is required yet.

Primary human question:
Does selecting and consuming two words feel clear and legible?

CP1 PASS requires:
- interaction works without recipe-table navigation,
- consumed words disappear immediately,
- unsupported pairs cannot execute,
- reset restores all words,
- human readability approval.

CP2 - Deterministic combat effect layer
Implement only the combat primitives needed by the approved nine-word combinations and three curated encounters:
- damage,
- armor,
- reveal,
- delay,
- wall blocking/duration,
- shield blocking,
- trap triggering,
- retaliation where required.

Do not add new combat mechanics.

Primary human question:
Can the player understand the consequence of an executed merge from the interface and combat response?

CP2 PASS requires:
- deterministic effects match v0.2 authority for all combinations used in the prototype,
- reset integrity passes,
- no consumed-word regression,
- combat presentation readable,
- human approval.

CP3 - Three curated encounters
Implement Encounter A, Encounter B, and Encounter C using the approved interaction and combat layer.

Do not add progression between them. A simple encounter selector or sequential test flow is sufficient.

Primary human question:
Do the encounters create more than one understandable tactical line while preserving semantic reasoning and opportunity cost?

CP3 PASS requires:
- all three encounters executable and resettable,
- no unauthorized mechanics,
- earlier interaction/effect regressions pass,
- human encounter-readability approval.

CP4 - Experiential validation
Run the bounded interactive playtest using the evidence procedure in this plan.

No feature changes during the evidence run unless a blocking contradiction makes the experiment invalid. If that occurs, stop and classify the issue before changing the prototype.

Decision after evidence:
CONTINUE, targeted PIVOT, or KILL for the interactive-core hypothesis.

14. Decision criteria

CONTINUE
Choose CONTINUE if:
- players consistently understand which words remain available after merges,
- broad effect prediction is generally correct before execution,
- tactical choices use semantic roles and opportunity cost rather than only memorized recipes or numbers,
- WALL and TRAP remain meaningfully distinguishable,
- interactive manipulation still feels substantially like combining words,
- ICE + TRAP does not create repeated arbitrary-feeling failure,
- the interface does not become the dominant source of confusion.

PIVOT
Choose PIVOT if the core semantic system remains promising but one narrow interactive issue repeatedly interferes, such as:
- word-selection presentation,
- preview wording,
- consumed-word visibility,
- target/lane presentation,
- WALL versus TRAP feedback,
- one repeated semantic mapping problem such as ICE + TRAP.

Change only the failing interaction or mapping before retesting.

KILL
Choose KILL for this interactive-core direction if:
- the system becomes recipe-driven once interactive,
- the player mainly selects known abilities rather than reasons from words,
- consumed-word opportunity cost is persistently unclear despite simple presentation,
- tactical decisions are dominated by effect text/numbers while word meaning contributes little,
- repeated semantic surprise makes the nine-word grammar feel arbitrary,
- the interface can only make the system understandable by exposing a large recipe table.

15. Branch and integration rules
This experiment must begin from approved baseline:
4a8fcf863ea146bf7fdfa60be5243db44c89130f

Recommended experiment branch:
feature/interactive-core-v0.1

Because this checkpoint modifies prototype code, any candidate used as evidence for a CONTINUE/PIVOT/KILL decision must have an immutable Git identity.

Under EXPLORE:
- failed or discarded candidates may remain preserved by immutable Git history without integration,
- a candidate accepted as the continuing authoritative prototype should be integrated only after required verification and human approval.

No release artifact is required.

16. Closure condition
This plan is complete when:
- its scope is explicitly approved,
- implementation remains unstarted until approval,
- the next action is CP0 only.

Approval of this plan authorizes only the checkpoint sequence above. It does not authorize later production development or vocabulary expansion.


