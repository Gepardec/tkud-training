## arc42 Consistency Lint Report

**Docs path:** `docs/architecture/sections/`
**Language:** de (German)
**Method:** Manual check (no automated script found)

---

### Rule Results

| Rule | Sections | Status | Details |
|------|----------|--------|---------|
| 1 | Section 3 ↔ Section 5 IF-xx | FAIL | IF-01 through IF-08 defined in Section 3 but not referenced by ID in Section 5 Level-1 |
| 2 | Section 5 ↔ Section 7 Building blocks | FAIL | "Message Broker (künftig)" from Section 5 target table not mapped in Section 7 deployment |
| 3 | Section 1 ↔ Section 10 Q42 tags | PASS | All Q42 tags from Section 1.2 (`#operable`, `#flexible`, `#reliable`, `#efficient`) have matching scenarios in Section 10 |
| 4 | Section 9 ↔ Section 11 RISK-xx | SKIP | Not in scope (Sections 9 and 11 not part of this task) |
| 5 | Section 10 ↔ Section 11 Aspirational | SKIP | Not in scope (Section 11 not part of this task) |

---

### Issues

**Errors (must fix — IDs are inconsistent):**
- [ ] [Rule 1] Section 5: IF-01 through IF-08 are defined in Section 3's interface table but are never referenced by their IF-xx ID in Section 5 Level-1 building block tables. The "Schnittstellen" columns describe technology (REST-API, JPA) rather than the external interface IDs. This makes it impossible to trace which external interfaces each building block exposes or consumes.
- [ ] [Rule 2] Section 7: "Message Broker (künftig)" listed as a target building block in Section 5 does not appear in Section 7's deployment mapping table ("Zuordnung der Bausteine zur Infrastruktur"). It is mentioned as a planned future component but has no infrastructure assignment.

**Warnings (advisory):**
- (none)

---

### Verdict

- [ ] **CLEAN** — All applicable rules pass
- [x] **ISSUES FOUND** — 2 error(s), 0 warning(s) — see Issues above
