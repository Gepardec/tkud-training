# Projekt B: Route-Dokumentations-Workflow (Praxisbeispiel)

> **Anonymisiert.** Praxisbeispiel für den Brownfield-Einstieg im KI-Teil (Folien „Projekt B“). Der folgende Handoff stammt aus dem Projekt und ist dort bereits anonymisiert (Platzhalter wie `<INTEGRATION_SERVICE>`). Er bleibt im englischen Original, damit Regeln und Begriffe exakt erhalten bleiben.
>
> **Kurzfassung für das Training:** Aus Camel-Routen-Code entsteht pro Route ein standardisiertes Doku-Paket (Markdown, zwei Draw.io-Diagramme, Checkliste). Eine verbindliche Guideline ist die Quelle der Wahrheit, ein Skill verpackt den 8-Schritte-Ablauf, ein Orchestrator verteilt ganze Repos auf Sub-Agents. „Fertig“ ist eine Route erst, wenn manueller Compliance-Check **und** Validierungs-Skript bestehen. Lücken werden ehrlich als `<TBD>` markiert, erfundene Beispiele als `<GENERATED>`.

---

# Handoff: Route Documentation Workflow

> **Purpose of this handoff:** A self-contained, anonymized description of an agent-driven documentation workflow for message-based integration routes (Apache Camel / Quarkus style). It explains *what* is produced, *how* it is produced, *who/what* is involved, and *how completeness is enforced* — without reference to any specific company, product, project, or person.
>
> **Anonymization conventions used throughout:**
>
> | Placeholder | Meaning |
> |---|---|
> | `<INTEGRATION_SERVICE>` | The integration-layer service that hosts the routes |
> | `<SOURCE_SYSTEM>` | The upstream business system (e.g. an ERP) queried/enriched via OData/REST |
> | `<TARGET_SYSTEM>` | The downstream consumer system that receives outbound messages |
> | `<MESSAGE_BROKER>` | The AMQP-style broker delivering inbound triggers and outbound messages |
> | `<RouteName>` | The logical route being documented (one folder per route) |
> | `<REPO_URL>` | The base URL of the source repository |
> | `<sha>` | A commit hash used to pin code references |

---

## 1. Overview

The workflow turns route source code into a **standardized, verified documentation package** per route. It is designed to be executed by an AI agent (or a human following the same steps) and is built around four principles:

1. **A single binding guideline** is the source of truth; everything else derives from it.
2. **Every route is documented in isolation** — one route per run, never batched.
3. **Nothing is fabricated silently** — gaps are marked `<TBD>`, synthesized examples are marked `<GENERATED>`.
4. **Documentation is not "done" when written, but when written *and verified*** — via a manual compliance pass plus an automated script gate.

---

## 2. Building Blocks

```text
docu/
├── README.md                          ← entry point / system overview
├── workflow-handoff.md                ← this file
├── guidelines/
│   ├── docu-guideline.md              ← binding rules (the tie-breaker)
│   └── docu-checklist-template.md     ← master compliance checklist
├── templates/
│   └── docu-template.md               ← Markdown skeleton with {{PLACEHOLDERS}}
├── prompts/
│   ├── generate-route-documentation.md               ← single-route trigger prompt
│   └── generate-full-repo-documentation-subagents.md ← full-repo orchestrator prompt
└── route/
    └── <RouteName>/                   ← generated output (one folder per route)

.agents/skills/create-route-docu/SKILL.md  ← reusable agent skill wrapping the single-route workflow
scripts/render-drawio.ps1                  ← renders Draw.io XML → PNG (dependency-free)
scripts/validate-docu-checklist.sh         ← automated completion gate
```

| Artifact | Role | Changes when… |
|---|---|---|
| Guideline | Defines folder layout, diagram rules, color palette, decision-tree format, mandatory content order, security rules, compliance workflow | The documentation *standard* changes |
| Template | Fill-in skeleton mirroring the guideline's content order | The guideline's structure changes |
| Checklist template | One checkbox per guideline rule; copied per route as `CHECKLIST.md` | A rule is added/changed |
| Single-route prompt | Step-by-step instructions for documenting one route | Workflow steps change |
| Orchestrator prompt | Discovers all routes, delegates each to an isolated sub-agent, aggregates results | Per-route cycle or orchestration logic changes |
| Skill | Agent-invocable packaging of the single-route workflow (input: route name or list) | Workflow steps change |
| Render script | Produces real PNG exports from Draw.io XML | Rarely |
| Validation script | Fails if any checklist item is unchecked | Rarely |

**Consistency rule:** if any of these disagree, the **guideline wins** and the others are corrected.

---

## 3. Output Per Route

```text
docu/route/<RouteName>/
├── <RouteName>.md                    ← the documentation
├── CHECKLIST.md                      ← working copy of the master checklist, ticked per route
└── diagrams/
    ├── business-flow.drawio.xml      ← editable high-level diagram
    ├── business-flow.drawio.png      ← rendered export (never a 0-byte placeholder)
    ├── engineer-detail.drawio.xml    ← editable technical diagram
    └── engineer-detail.drawio.png    ← rendered export
```

Both PNGs are embedded inline in the Markdown so the visuals are readable in any wiki without opening Draw.io. Invariant: **every committed `.drawio.xml` has an up-to-date, non-empty `.png` sibling.**

---

## 4. Entry Points

| Scenario | Use | Result |
|---|---|---|
| Document one route | Single-route prompt (fill in route name, entry class, known sub-routes) **or** invoke the skill with the route name | One route package + compliance report |
| Document a list of routes | Skill with a list of names | Routes processed sequentially, each fully, then a combined summary table |
| Document the whole repository | Orchestrator prompt | Discovery → worklist → one sub-agent per route → aggregated report |

---

## 5. Single-Route Workflow (8 Steps)

Before step 1, the agent **must read in full**: the guideline, the template, and the checklist template. If these files don't exist, the workflow stops — no improvised structure.

### Step 1 — Analyze the source
- Locate the route definition(s) by route ID (exact match first, then fuzzy — folder names and route IDs may differ).
- Read the full route builder, every sub-route reached via `to()` / `enrich()`, every Processor and query-builder class.
- **Separate** inline route-local logic (lambdas, grouped header/property sets) from **named Processor classes**.
- Identify **state checkpoints** that change behavior (status derivation, trigger normalization, delete-vs-publish mode, routing properties, schema-validation state).
- Locate the mapper / data-extractor that builds the outbound model, and any test fixtures for inbound/outbound payloads.
- **Never reuse assumptions from a prior session** — always re-read current code.

### Step 2 — Build both diagrams (Draw.io only, no Mermaid anywhere)

**a) Business Process Flow (high-level, left-to-right)**
- Domain chain: `<MESSAGE_BROKER> (in) → <INTEGRATION_SERVICE> (inbound processing) → <SOURCE_SYSTEM> (query/enrichment) → <INTEGRATION_SERVICE> (outbound processing) → <MESSAGE_BROKER> (out) → <TARGET_SYSTEM>`. Hops are merged only if the route genuinely skips one — never invent domains.
- Draw.io diagram must contain: title, dashed integration-layer container, numbered steps with 1–3 lines of plain English, trigger summary box, external system nodes, labeled edges, dashed enrichment edges (with protocol), lifecycle/state checkpoints, legend.
- **Plus** a plain-text domain-box summary in the Markdown, wrapped in `<pre>` (not a fenced block), naming concrete queues/entities/message types, with at least one labeled error/validation branch ending in a terminal label (e.g. `(dropped / logged)`).
- Followed by a `Validation & Error Cases:` bullet list — one bullet per branch, prefixed with the hop where it occurs.

**b) Engineer Detail (technical, top-to-bottom / columnar)**
- Modified UML-activity notation adapted to Camel concepts.
- Must contain: title, section headers, one node per inbound queue (with routing filters + route ID), annotated processors (what they *do*, not just the class name), distinct node types for inline logic vs. named processors, explicit state checkpoints, OData/REST nodes with entity + query-builder method + key `$expand`/`$select`, full outbound chain (routing properties → schema validation → shared outbound route → producer), YES/NO decision edges, semantic edge colors, full legend.
- Optional: property get/set traceability on nodes or dashed grey connectors — only if it doesn't clutter.

**c) Render** both PNGs from the XML via the render script (or Draw.io desktop export).

### Step 3 — Assess branching complexity → Decision Tree
**Triggers** (any one is enough):
- ≥ 3 nested `choice/when/otherwise` levels,
- branches spanning multiple sub-routes,
- a named Processor whose own `process()` contains outcome-changing conditions, early returns, or per-item loop logic.

**If triggered**, write a plain-text tree:
- Wrapped in `<pre>` (fenced blocks break box-drawing characters in some wiki renderers).
- Connectors `├─`, `└─`, `│`; root = route ID; branches as `choice: <condition>?` with `YES` / `NO`; terminals marked `(End)`.
- **Mandatory property annotations** on every processor / inline step / enrich node: `(gets "A", "B") (sets "C")` — using the **exact string keys** from code. For enrich nodes whose query builder reads properties: `enrich X (buildQueryX gets "Y")`.
- **Mandatory sub-processor unfolding:** a Processor's internal branching is expanded as nested children under its node — never collapsed into one opaque step. Built from the actual source, not inferred from property names.
- No prose inside the tree; explanations go in surrounding text.

**If not triggered**, a one-line justification, still inside `<pre>`.

Anonymized example:

<pre>
Example-RouteId
└─ from(INBOUND_QUEUE)
   └─ ExampleProcessor (gets "MemberCollection") (sets "SelectedIds")
      ├─ for each member in MemberCollection:
      │  └─ choice: member.status >= Released?
      │     ├─ YES -> add member.id to SelectedIds
      │     └─ NO  -> skip member
      └─ choice: SelectedIds empty?
         ├─ YES -> to(direct:Abort) (End)
         └─ NO  -> enrich Headers (buildQueryHeaders gets "SelectedIds")
                   └─ to(direct:Outbound) (End)
</pre>

### Step 4 — Write `<RouteName>.md` from the template
Fill every `{{PLACEHOLDER}}` in this **fixed order**, each section as short as possible:

| # | Section | Key rules |
|---|---|---|
| 0 | System Context | One paragraph on the systems bridged; naming-mismatch note if folder ≠ package; reviewer tag **only** if a real person reviewed it |
| 1 | Purpose of the Route | 1–2 sentences |
| 2 | Trigger | Queues + routing-key / filter criteria table |
| 3 | Exchange Headers & Message Properties | "Inbound Expected Headers" + table titled exactly `Internal Properties and Headers 🛠 *(for devs)*` |
| 4 | Used Entities or Endpoints | Entities/services read or written + `Postman Collection: <TBD>` |
| 5 | Logic with Examples | Opening paragraph, then in order: **Decision Logic → Frequency/Volume & Performance → Source-System Information → Resilience & Error Handling → Filters → Mapping** |
| 6 | Business Process Flow | `<pre>` domain summary + Validation & Error Cases + embedded PNG + XML edit hint |
| 7 | Technical Sequence Diagram | Embedded PNG + XML edit hint |
| 8 | Example Inbound / Outbound Message | Each in a `<details><summary>` foldout; prefer links to test fixtures |

Additional rules:
- **Mapping table is re-derived from the current mapper source on every run**, row by row — never carried forward.
- **No standalone "Configuration Keys" chapter** — resilience details live under section 5.
- Inline JSON payloads are **pretty-printed** (2-space indent, nested structures expanded); minified only if the payload has 1–2 scalar fields. Synthesized payloads are marked `<GENERATED>` in the `<summary>`.
- **Code references** use `<REPO_URL>/-/blob/<sha>/<path>#L<start>-L<end>` with link text `File.java:L<start>-L<end>`. Prefer commit SHAs; branch names are a moving target. Never local paths only.
- **`Last Updated`** header field is a link to the pinned commit — this is the single source of truth for pinning (no per-link "commit-pinned" notes).
- **Security:** no credentials/tokens (use `${env:VAR}` or `<REDACTED>`); sample data anonymized; English only.

### Step 5 — Create all files
At the exact paths listed in Section 3. The `CHECKLIST.md` is a fresh copy of the master checklist template.

### Step 6 — Compliance check (manual)
1. **Re-open** the generated files — never rely on memory of what was written.
2. Walk `CHECKLIST.md` top to bottom; tick `- [x]` for each verified item.
3. Fix anything fixable; flag the rest honestly as `<TBD>` / `<GENERATED>` with a reason.
4. Report in the fixed format:

```text
Compliance check: <RouteName>
✅ X/Y checks passed
⚠️  TBD: <item> (§ref) — <reason>
❌ FAIL: <item> (§ref)
```

`TBD` is an honest pass; `FAIL` blocks completion.

### Step 7 — Automated guardrail
```bash
./scripts/validate-docu-checklist.sh <RouteName>   # one route
./scripts/validate-docu-checklist.sh               # all routes
```
- Counts `- [x]` (pass), `- [ ]` (fail), `- N/A` (allowed).
- **Exit 0** = complete. **Exit 1** = any unchecked item remains → fix or convert to `- [x]` with an appended `<TBD>` reason, then re-run.
- The script's stdout must be shown in the final message as proof.
- Recommended: run it in CI for any change touching `docu/route/**`.

### Step 8 — Report
Final per-route summary (Step 6 format + script output). A route is **only done when both** the compliance report and the script pass.

---

## 6. Full-Repository Orchestration (Sub-Agents)

Used when many/all routes need (re)documentation. The orchestrator **does not write docs itself**.

```text
┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐
│ 1. Discover  │──▶│ 2. Partition │──▶│ 3. Dispatch  │──▶│ 4. Collect   │──▶│ 5. Final     │
│ route        │   │ 1 route =    │   │ isolated     │   │ per-route    │   │ combined     │
│ inventory    │   │ 1 sub-agent  │   │ sub-agents   │   │ reports      │   │ report       │
└──────────────┘   └──────────────┘   └──────────────┘   └──────────────┘   └──────────────┘
```

1. **Discover** — find all route builder classes and their route IDs; group IDs into logical `<RouteName>`s (existing doc folders are the canonical grouping). Classify each:
   - **NEW** — no doc exists
   - **STALE** — source newer than the doc's pinned commit, or checklist has unchecked items
   - **SKIP** — current (unless "regenerate all")

   Show the worklist to the user before dispatching (unless told "just go").
2. **Partition** — exactly one logical route per sub-agent; never two routes in one task, never one route split across two.
3. **Dispatch** — each sub-agent gets a fresh context, reads the three binding files *itself* (no summarized substitutes), runs the full 8-step cycle, and returns **only** its compliance report + script output.
   - Default: sequential. Parallel only if requested and supported; cap at ~3–4 concurrent.
   - Sub-agents may only write to their own `docu/route/<RouteName>/`; guidelines, templates, and scripts are read-only.
   - Without a real sub-agent mechanism: finish one route completely, explicitly reset context, re-read the binding files, then start the next.
   - If a sub-agent finds it needs to touch another route (shared sub-route), it stops and reports back — the orchestrator decides.
4. **Collect** — record pass count, TBDs, FAILs, and script exit code per route. Unresolved FAILs are surfaced to the user, not blindly retried; only transient issues (e.g. render failure) are auto-retried by re-running steps 6–7.
5. **Final report** — one table sorted FAIL → TBD → PASS, followed by every validation command with its exit code, and a clear statement whether the full run is complete.

```text
| Route         | Status  | Checks | Notes                                  |
|---------------|---------|--------|----------------------------------------|
| RouteC        | ❌ FAIL | 22/27  | Engineer-detail legend missing         |
| RouteB        | ⚠️ TBD  | 25/27  | Volume unknown; Postman TBD            |
| RouteA        | ✅ PASS | 27/27  | —                                      |
```

Practical tip: for large repositories, run in small batches (3–5 routes per orchestrator run) to keep reports reviewable. After code changes, re-run discovery first so only STALE routes are re-dispatched.

---

## 7. Visual Standard (Shared Palette)

Both diagrams use one fixed vocabulary — no invented colors/shapes.

| Component | Fill | Stroke | Shape / Text |
|---|---|---|---|
| Inbound Queue / Consumer | `#FFF9C4` | `#F9A825` | Rounded |
| Sub-Route (`direct:`) | `#C8E6C9` | `#2E7D32` | Rounded, bold |
| Inline Processor / Route-local Logic | `#E0F7FA` | `#00838F` | Rounded |
| Named Processor / Transformer | `#FCE4EC` | `#C2185B` | Rounded |
| OData / REST Call | `#E8EAF6` | `#283593` | Rounded |
| Decision | `#FFF3E0` | `#E65100` | Rhombus |
| State Handler / Mutation | `#ECEFF1` | `#546E7A` | Rounded |
| Auth / Utility Processor | `#F3E5F5` | `#7B1FA2` | Rounded |
| Abort / Filter Stop | `#FFCDD2` | `#C62828` | Ellipse, bold |
| Outbound Producer | `#FF6D00` | `#E65100` | Rounded, white bold |

**Edge colors:** green `#2E7D32` = happy path · red `#C62828` = abort/error · navy `#283593` = OData/REST return (dashed for enrichment) · orange `#E65100` = decision-branch exit.

**XML rules:** standard `mxfile → diagram → mxGraphModel → root` container; orthogonal rounded edges (`strokeWidth=1.5`); spacing 80 px horizontal / 60 px vertical; bold title at the top; legend as a container with child cells (top-right recommended); section labels in blue `#1565C0`; semantic edge labels as `edgeLabel` child cells (not the edge's `value`); groups as `container=1;collapsible=0`.

---

## 8. Quality Gates Summary

| Gate | When | Blocks completion? |
|---|---|---|
| Binding files read | Before any work | Yes — no files, no run |
| Fresh source read (no prior-session carry-over) | Step 1, every run | Yes |
| Mapping re-derived from source | Step 4 | Yes |
| PNGs rendered and non-empty | Step 2 / 5 | Yes |
| Manual checklist walk on re-opened files | Step 6 | Yes (on FAIL) |
| Validation script exit 0 | Step 7 | Yes |
| `<TBD>` / `<GENERATED>` markers | Anywhere | No — honest gaps pass, as long as they are real gaps |

---

## 9. Maintenance Notes for the Next Owner

- **Changing a rule:** edit the guideline → add/adjust the matching checklist item → update the template if structure changes → update prompts/skill if workflow steps change.
- **Changing the palette or diagram semantics:** update guideline, checklist, and the single-route prompt together.
- **Renaming a template placeholder:** verify the guideline section and the prompt's "write the Markdown" step still match.
- **Known housekeeping item:** the system README refers to the orchestrator prompt under a different file name than the one actually present in `docu/prompts/` — align the reference when next touching the README.
- **Re-run trigger:** any change to a route's source code invalidates its previous PASS; regenerate and re-check that route.
- **Common open TBDs to expect:** Postman collections, frequency/volume/performance figures, and source-system environment notes are typically not derivable from code and need manual input from domain owners.
