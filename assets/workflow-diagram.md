# Workflow Diagrams

## Simple Workflow

```
┌─────────────────────────────────────────────────────────────┐
│                    Specification-First                       │
│                   Development Workflow                       │
└─────────────────────────────────────────────────────────────┘

    Developer               Claude Code              Output
        │                       │                       │
        │   /spec Problem      │                       │
        ├──────────────────────>                       │
        │                       │                       │
        │                  1. Analyze                   │
        │                  2. Research                  │
        │                  3. Design                    │
        │                       │                       │
        │   ← Specification ────┤                       │
        │                       │                       │
        │   "Looks good!"       │                       │
        ├──────────────────────>                       │
        │                       │                       │
        │              Phase 1: Implement               │
        │              ├─ Code changes                  │
        │              ├─ Run tests ✓                   │
        │              └─ Quality gates ✓               │
        │                       │                       │
        │              Phase 2: Implement               │
        │              ├─ Code changes                  │
        │              ├─ Run tests ✓                   │
        │              └─ Quality gates ✓               │
        │                       │                       │
        │              Phase N: Implement               │
        │              ├─ Code changes                  │
        │              ├─ Run tests ✓                   │
        │              └─ Quality gates ✓               │
        │                       │                       │
        │                       ├──────────────────────> TASK.md
        │                       ├──────────────────────> IMPLEMENTATION-SUMMARY.md
        │                       ├──────────────────────> PHASE-N-SUMMARY.md
        │                       └──────────────────────> Git commit
        │                       │                       │
        │   ✅ Complete!        │                       │
        │<──────────────────────┤                       │
        │                       │                       │
```

## Detailed Phase Workflow

```
╔════════════════════════════════════════════════════════════╗
║                     IMPLEMENTATION PHASE                    ║
╚════════════════════════════════════════════════════════════╝

                    ┌─────────────────┐
                    │  Phase N Start  │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │  Make Changes   │
                    └────────┬────────┘
                             │
                             ▼
                    ┌─────────────────┐
                    │   Run Tests     │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │  Tests Pass?    │
                    └────────┬────────┘
                             │
                ┌────────────┼────────────┐
                │ NO         │            │ YES
                ▼            │            ▼
         ┌──────────┐        │    ┌──────────────┐
         │Fix Errors│        │    │TypeCheck Pass?│
         └─────┬────┘        │    └──────┬───────┘
               │             │           │
               └─────────────┘      ┌────┼────┐
                                    │NO  │    │YES
                                    ▼    │    ▼
                              ┌─────────┐│ ┌──────────┐
                              │Fix Types││ │Lint Pass?│
                              └────┬────┘│ └────┬─────┘
                                   │     │      │
                                   └─────┘ ┌────┼────┐
                                          │NO  │    │YES
                                          ▼    │    ▼
                                    ┌─────────┐│ ┌──────────┐
                                    │Fix Lint ││ │Build Pass?│
                                    └────┬────┘│ └────┬─────┘
                                         │     │      │
                                         └─────┘ ┌────┼────┐
                                                │NO  │    │YES
                                                ▼    │    ▼
                                          ┌─────────┐│ ┌───────────┐
                                          │Fix Build││ │  SUCCESS! │
                                          └────┬────┘│ └─────┬─────┘
                                               │     │       │
                                               └─────┘       ▼
                                                      ┌─────────────┐
                                                      │Document Phase│
                                                      └──────┬──────┘
                                                             │
                                                             ▼
                                                      ┌─────────────┐
                                                      │ Next Phase? │
                                                      └─────────────┘
```

## Quality Gates Flow

```
╔═══════════════════════════════════════════════════════════╗
║               NON-NEGOTIABLE QUALITY GATES                 ║
╚═══════════════════════════════════════════════════════════╝

After EVERY phase, these MUST pass:

┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Tests     │────>│ TypeCheck   │────>│    Lint     │
│ 100% Pass   │     │  0 Errors   │     │ 0 Warnings  │
└─────────────┘     └─────────────┘     └─────────────┘
        │                   │                    │
        ▼                   ▼                    ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Build     │     │Architecture │     │  Security   │
│  Succeeds   │     │  Compliant  │     │   Checks    │
└─────────────┘     └─────────────┘     └─────────────┘
        │                   │                    │
        └───────────────────┴────────────────────┘
                            │
                            ▼
                    ┌───────────────┐
                    │ ALL GATES ✅  │
                    │  PHASE DONE   │
                    └───────────────┘
```

## File Structure Generated

```
your-project/
│
├── docs/
│   ├── PROGRESS.md ← Centralized tracking
│   └── tasks/
│       ├── TASK-20251025-FIX001/        # First bug fix
│       ├── TASK-20251027-FIX002/        # Second bug fix  
│       ├── TASK-20251025-FEAT001/       # First feature
│       └── TASK-20251027-CHORE001/      # First chore task
│           ├── TASK.md ← Specification
│           ├── IMPLEMENTATION-SUMMARY.md ← Overall summary
│           ├── PHASE-1-SUMMARY.md ← Phase details
│           ├── PHASE-2-SUMMARY.md
│           ├── PHASE-N-SUMMARY.md
│           └── _drafts/ ← Iteration history
│               ├── TASK-...-DRAFT-01.md
│               └── TASK-...-DRAFT-02.md
│
└── .claude/
    └── workflows/
        └── spec-first/
            ├── steering/ ← Your project standards
            │   ├── quality-standards.md
            │   ├── architecture-principles.md
            │   └── testing-strategy.md
            ├── commands/ ← Plugin commands
            ├── templates/ ← Document templates
            └── manifest.json
```
