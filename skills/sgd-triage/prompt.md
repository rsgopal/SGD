# Triage — Cynefin problem classification

Use this prompt with any AI assistant (Copilot, Cursor, Codex, etc.) by pasting it into your tool's custom instructions, system prompt, or chat window before describing your problem.

---

Apply the **Cynefin framework** to classify the problem and recommend the right response strategy.

## Step 1 — Understand the problem

If the user has provided a problem statement, use it. If not, ask them to describe the problem before proceeding.

Gather additional context by examining:
- The current working directory's codebase structure, recent git history, and any planning artifacts that describe the domain, technology, and constraints
- Any open questions, ambiguities, or unknowns in the problem statement itself
- The team's existing knowledge (inferred from code patterns, documentation, and architecture decisions)

## Step 2 — Classify the problem

Evaluate the problem against these diagnostic questions:

1. **Repeatability**: Has this exact type of problem been solved before, in this codebase or broadly in the industry?
2. **Knowability**: Can all the causes be known in advance with sufficient analysis?
3. **Expert consensus**: Would domain experts agree on the right approach, or would they diverge?
4. **Emergence**: Does the solution require discovering something new through experimentation?
5. **Urgency**: Is the system actively broken or failing right now?
6. **Unknowns**: How many "unknown unknowns" are present — things the team doesn't know they don't know?

Output the classification as two blocks, in this order:

First, the TL;DR verdict:

---

### TL;DR: [DOMAIN NAME] · Confidence: [High / Medium / Low]

[1–2 sentences. State the classification and the single most important reason why. Experienced readers can stop here.]

> **Almost:** [Adjacent domain] — [One sentence on the single thing that would push this problem across the boundary into that domain instead.]

---

Then immediately the full explanation:

---

### Why: [DOMAIN NAME]

[3–5 sentences. Explain the classification with specific evidence from the problem statement and codebase context. Reference specific unknowns, constraints, prior art, or system properties. Name the key factor that tips it into this domain rather than an adjacent one.]

**Confidence is [High / Medium / Low] because:** [One sentence explaining what is certain or uncertain about the classification. If Medium or Low, name the specific gap in information that would resolve it.]

---

## Step 3 — Recommended next steps

Based on the classified domain, output a concrete next-steps section. Steps must be specific to the actual problem — do not copy the generic template verbatim. Adapt each bullet to the real context.

**If Clear:**
- Identify the established best practice or existing pattern in this codebase that applies directly
- Apply it — no analysis phase needed
- Document what you did and why it was straightforward

**If Complicated:**
- Identify the experts or reference materials needed
- Define the analysis needed before acting (architecture review, spike, RFC) and timebox it
- Structure the work with a clear plan before implementation begins
- **Watch out for:** treating this as Complex and running open-ended experiments when the answer is knowable. Analysis paralysis is the Complicated failure mode — set a decision date and commit.

**If Complex:**
- Do NOT attempt to design the full solution upfront — the design will emerge from what you learn
- Generate 2–3 specific probe questions tailored to this problem that must be answered before any plan is formed (not generic — name the actual unknowns)
- For each probe, define a small safe-to-fail experiment and what "signal" looks like (what a result tells you, win or lose)
- **Watch out for:** mistaking this for Complicated and jumping straight into a plan. If the team's instinct is "let's get the seniors in a room and design it," that's the Complicated instinct — valid only if the answer is actually knowable upfront.

**If Chaotic:**
- Name the immediate stabilizing action — the one thing that stops further damage right now
- Act first, analyze second — do not wait for consensus or a perfect plan
- Once stable, explicitly re-classify: most problems leave Chaotic after the immediate crisis resolves
- Treat any solutions found in chaos as temporary; flag them for revisit
- **Watch out for:** staying in crisis mode after the system stabilizes. Chaotic responses (act without analysis) that persist into a stable state become technical debt at best, disasters at worst.

**If Confused / Disorder:**
- Decompose the problem into sub-problems small enough to classify independently
- Run this prompt on each sub-problem separately
- Identify which sub-problem to tackle first (usually: resolve the biggest unknown, or address the highest-risk piece)
- **Watch out for:** applying your default process (whatever the team is most comfortable with) to the whole problem. Disorder is the domain where that instinct is most dangerous.

**Team size / experience note:** If the classification would change depending on who is working it (e.g., Complicated for a senior but Complex for someone newer to this codebase), call that out explicitly. It changes how you staff and pair on the work.

---

## Step 4 — Suggested next action

Close with a one-sentence suggestion on how to proceed:

- If **Clear or Complicated**: move directly into structured analysis — the problem is well-understood enough to scope and execute.
- If **Complex**: answer the probe questions first before any planning
- If **Chaotic**: stabilize the immediate issue before any planning or analysis
- If **Confused**: run this prompt again on each decomposed sub-problem separately

---

## Appendix — Cynefin reference

Output this section at the end, after your suggested next action. It serves readers who are unfamiliar with the framework; experienced practitioners can ignore it.

---

### Cynefin framework reference

The Cynefin framework (pronounced "kuh-NEV-in", Welsh for "habitat" or "place of belonging") is a sense-making model developed by Dave Snowden at IBM in 1999. It helps decision-makers understand what kind of problem they are facing so they can choose the right approach — rather than applying a one-size-fits-all process.

| Domain | Nature of the problem | Best approach |
|---|---|---|
| **Clear** (formerly Simple) | Cause and effect are obvious. Best practices exist and are known. | Sense → Categorize → Respond. Apply the known best practice. |
| **Complicated** | Cause and effect require analysis or expertise to diagnose. Multiple valid solutions may exist. | Sense → Analyze → Respond. Bring in experts, do the analysis. |
| **Complex** | Cause and effect only become apparent in retrospect. There are no right answers, only emergent ones. | Probe → Sense → Respond. Run safe-to-fail experiments. |
| **Chaotic** | No cause-and-effect relationship is perceivable. Crisis mode. | Act → Sense → Respond. Stop the bleeding first, then analyze. |
| **Confused / Disorder** | It is unclear which domain applies. This is the danger zone — people default to their comfort zone rather than the right approach. | Break the problem apart. Classify each piece separately. |

The critical insight is that **the right process depends on the domain**. Applying complicated-domain solutions to a complex problem will fail — you cannot analyze your way out of emergence. Applying complex-domain thinking to a clear problem is wasteful — just use the best practice.

---
