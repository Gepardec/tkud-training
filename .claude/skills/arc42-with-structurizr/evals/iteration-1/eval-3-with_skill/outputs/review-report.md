## Review Report — Scope: Sections 5 + 7

**Detail level reviewed:** ESSENTIAL (both sections provide substantial detail with diagrams, tables, and cross-references)
**Review focus:** All dimensions (Completeness, Consistency, Quality)

---

### Summary

Sections 5 and 7 are well-structured and detailed. Both cover Ist- and Ziel-Zustand with diagrams and tables. Two Critical issues were found: Section 5 does not reference external IF-xx interface IDs from Section 3, and Section 7 is missing the Message Broker from the deployment mapping. Several Minor items relate to `<TBD>` placeholders that need stakeholder input.

---

### Strengths

- **Section 5 Level-1:** Covers both Ist- and Ziel-Zustand comprehensively. The target building block table lists 10 components with clear responsibilities.
- **Section 5 Level-2 & Level-3:** Provides deep white-box views of both the legacy monolith and the new domain services. Encashment component diagram (C3) is included as a representative example.
- **Section 7 "Zuordnung der Bausteine zur Infrastruktur":** Maps each building block to an infrastructure element with annotations — excellent traceability from Section 5.
- **Section 7 environment comparison table:** Thorough side-by-side comparison of today vs. target across 11 aspects.
- **Structurizr DSLs and SVGs:** All referenced diagrams exist at expected paths under `docs/architecture/diagrams/`.

---

### Issues Found

**Critical (Must Fix before using this documentation):**
- [ ] [Section 5] IF-xx interface IDs not referenced: Section 3 defines interfaces IF-01 through IF-08, but Section 5 Level-1 building block tables do not reference any IF-xx IDs. The "Schnittstellen" column uses technology names (REST-API, JPA/Hibernate → SQL Server) instead. Add an IF-xx column to each building block row showing which external interfaces it exposes or consumes. → Run `/arc42-section-05` to address this
- [ ] [Section 7] Message Broker missing from deployment mapping: Section 5 lists "Message Broker (künftig)" as a target building block, but Section 7's deployment mapping table does not include it. Either add a placeholder row (even with `<TBD>` infrastructure) or move it to future scope. → Run `/arc42-section-07` to address this

**Minor (Should Fix — impacts clarity or consistency):**
- [ ] [Section 5] "REST/JSON über HTTPS" interface table: The Vertrag column describes protocols generically. Consider referencing IF-02 and IF-08 explicitly to connect back to Section 3.
- [ ] [Section 7] Several `<TBD>` placeholders remain in the target section: VM dimensioning (vCPU/RAM), monitoring details, and multi-realm Keycloak behavior need resolution.
- [ ] [Section 7] Broker-WARs are listed in the deployment mapping as "weiterhin genutzt" but none of IF-03, IF-04, IF-05 from Section 3 are referenced by ID in the broker context.

**Suggestions (Nice to Have):**
- [Section 7] Add a "Future / optional" row to the deployment mapping table for components like the Message Broker that are planned but not yet deployed. This would avoid gaps without requiring concrete infrastructure.
- [Section 5] Consider adding source code locations (Gradle module paths) for each target building block, as recommended for ESSENTIAL level.

---

### Cross-Section Consistency

| Check | Status | Detail |
|-------|--------|--------|
| Section 3 interfaces ↔ Section 5 Level-1 | FAIL | IF-01 through IF-08 defined in Section 3 but not referenced by ID in Section 5 |
| Section 5 components ↔ Section 7 deployment | FAIL | Message Broker missing from Section 7 mapping |
| Section 1.2 quality goals ↔ Section 7 infrastructure | PASS | `#operable` (independent redeploy), `#efficient` (response time) and `#reliable` have infrastructure mechanisms described |
| Section 2 constraints ↔ Section 7 infrastructure | PASS | No violations detected (Tomcat maintained, no container orchestrator introduced) |

---

### Verdict

- [ ] **APPROVED** — Documentation is ready to use at the stated detail level
- [ ] **APPROVED WITH MINOR CHANGES** — Usable, but minor issues should be addressed soon
- [x] **NEEDS REVISION** — One or more Critical issues must be fixed before use
