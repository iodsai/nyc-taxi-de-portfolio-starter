# docs/

Design notes, architecture decisions, and README-style explanations of what you've built.

## What goes here

- **schema_design_note.md** — Unit 7 capstone deliverable. One page defending your taxi OLTP schema (grain, PKs, FKs, historical snapshots).
- **normalization_note.md** — Unit 6 deliverable. Explains why each column of the flat taxi CSV moved to the table it did.
- **oltp_vs_olap_note.md** — Unit 8 deliverable. Compare the same taxi data as OLTP normalized vs Kimball star schema. Which query wins where.
- **architecture.md** — Later modules. High-level diagram of your full pipeline (source → ingestion → warehouse → BI).
- **passengers_bookings_note.md** — Unit 5 mini project deliverable.
- Any **ADR** (Architecture Decision Record) files for choices you'd want to defend in a code review.

## Format guidance

Keep design notes to **one page** (~500 words). Interviewers skim — they need to see your reasoning fast.

**Good structure:**
1. What am I designing? (1 sentence)
2. Key decisions and why (bullet list)
3. What I deliberately left out (honesty about tradeoffs)
4. What I'd add in production (shows senior thinking)
