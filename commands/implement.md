# Implementation from Specification Workflow

**Usage**: `/implement <task-id>`

**Example**: `/implement TASK-20251018-BULKOPS001`

You are implementing a task based on an existing specification document following the Specification-First Development approach.

## Your Task

### 0. Initialize Steering Documents (If Needed)

**BEFORE ANYTHING ELSE**, check if steering documents exist:

```bash
# Check for steering documents
ls .claude/workflows/spec-first/steering/*.md
```

**If steering documents exist:**
- Announce: "✅ Using project steering documents: [list documents]"
- Proceed to step 1

**If steering documents DON'T exist:**
- Follow the auto-creation process from the `/spec` command:
  1. Detect project stack and standards
  2. Create steering documents from templates
  3. Announce what was created
  4. Proceed to step 1

See `/spec` command for detailed auto-creation steps.

### 1. Read Steering Documents

Read ALL steering documents in `.claude/workflows/spec-first/steering/`:

- `quality-standards.md` - Quality gates and non-negotiable requirements
- `architecture-principles.md` - Architecture patterns and constraints
- `testing-strategy.md` - Testing requirements (if exists)
- Any other `.md` files in steering directory

### 2. Read the Specification

- The user will provide a task ID (e.g., TASK-20251018-BULKOPS001)
- Read `docs/tasks/[TASK-ID]/TASK.md`
- Understand all phases, success criteria, and quality requirements
- Note the Solution Design section for high-level approach

### 3. Implement Phase by Phase

Implement ONE phase at a time:

```
1. Announce: "Starting Phase N: [Title]"
2. Update TodoWrite: Mark phase as "in_progress"
3. Implement the changes
4. Run quality checks (from steering docs):
   - npm run typecheck (must pass - 0 errors)
   - npm run lint (must pass - 0 errors, 0 warnings)
   - npm test (must pass - 100% passing)
5. Fix any errors immediately
6. Update TodoWrite: Mark phase as "completed"
7. If significant: Create PHASE-N-SUMMARY.md
8. Move to next phase
```

### 4. Pipeline Green Checkpoint

After ALL phases complete and pipeline is green:

**STOP and announce to user**:

```
✅ All phases complete! Pipeline is green:
- TypeScript: 0 errors
- ESLint: 0 errors, 0 warnings
- Tests: XXXX/XXXX passing (100%)

📋 Task ready for testing!

Please test the following to validate the implementation:

1. [Specific test scenario 1]
2. [Specific test scenario 2]
3. [Specific test scenario 3]

Once you've tested and confirmed everything works as expected, let me know and I'll:
- Update the task status to "complete"
- Create the final commit
- Update progress documentation
```

**DO NOT mark task as complete until user confirms testing.**

### 5. User Validation Loop

Wait for user feedback:

**If user reports issues**:
- Fix the issues
- Re-run quality checks
- Return to "Pipeline Green Checkpoint" step

**If user approves**:
- Proceed to step 6

### 6. Create Documentation

After user approval:

- Create `docs/tasks/[TASK-ID]/IMPLEMENTATION-SUMMARY.md`
- Use the implementation-summary template
- Include all files changed, test results, quality metrics
- Mark task status as "Complete" in the summary

### 7. Create Initial Commit

Create commit WITHOUT progress documentation:

```bash
git add <all implementation files>
git commit -m "$(cat <<'EOF'
<type>: <description> - <TASK-ID>

[Full commit message from template]
EOF
)"
```

Get the commit hash.

### 8. Update Progress Documentation

Create or update `docs/PROGRESS.md`:

```markdown
## [Date] - TASK-[ID]: [Title]

**Status**: ✅ Complete
**Type**: [Bug Fix / Feature / Refactoring]
**Commit**: [commit-hash]

### Summary
[Brief summary from implementation]

### Impact
- [Key impact 1]
- [Key impact 2]

### Quality Metrics
- Tests: XXXX/XXXX passing
- TypeScript: 0 errors
- ESLint: 0 warnings

### Files Changed
- [Number] source files
- [Number] test files
- [Number] documentation files

[Link to full documentation](./tasks/TASK-ID/IMPLEMENTATION-SUMMARY.md)
```

### 9. Amend Commit with Progress Update

```bash
git add docs/PROGRESS.md
git commit --amend --no-edit
```

This ensures the commit includes the progress documentation.

### 10. Final Announcement

```
🎉 Task complete!

✅ Implementation finished
✅ User tested and approved
✅ Documentation created
✅ Commit made: [commit-hash]
✅ Progress updated

Task TASK-[ID] is now complete and ready for review/merge.
```

## Quality Gates (From Steering Docs)

Read quality gates from `.claude/workflows/spec-first/steering/quality-standards.md`.

These are PROJECT-SPECIFIC, not generic defaults.

After EVERY phase, ALL quality gates must pass. No exceptions.

If any quality gate fails, STOP and fix before proceeding.

## Testing Validation Requirements

When announcing "ready for testing," provide SPECIFIC test scenarios:

### For Bug Fixes
```
Please test:
1. Reproduce the original bug scenario - confirm it's fixed
2. Test edge cases: [list specific edge cases]
3. Verify related functionality still works: [list related features]
```

### For New Features
```
Please test:
1. Happy path: [describe main user flow]
2. Error handling: [describe error scenarios to test]
3. Edge cases: [list edge cases]
4. Integration: [describe how it works with existing features]
```

### For Refactoring
```
Please test:
1. All existing functionality works as before
2. [Specific scenarios that might be affected]
3. Performance: [if performance was a goal]
```

## Task Status Workflow

```
User requests implementation
  ↓
Agent implements phases
  ↓
Pipeline green ✅
  ↓
Agent announces "Ready for testing" + provides test scenarios
  ↓
User tests
  ↓
Issues found? → Agent fixes → Return to "Pipeline green"
  ↓
User approves ✅
  ↓
Agent marks complete
  ↓
Agent creates commit
  ↓
Agent updates progress docs
  ↓
Agent amends commit
  ↓
Task complete 🎉
```

## Documentation Requirements

Create these documents AFTER user approval:

- `IMPLEMENTATION-SUMMARY.md` - Overall summary (required)
- `PHASE-N-SUMMARY.md` - Per-phase details (for significant phases)
- `docs/PROGRESS.md` entry - Progress tracking

## Important Guidelines

- **Read steering documents FIRST**: Apply project standards
- **One phase at a time**: Don't skip ahead
- **Run tests frequently**: After every significant change
- **Fix errors immediately**: Don't let them pile up
- **Wait for user validation**: Never mark complete without user confirmation
- **Provide specific test scenarios**: Make it easy for user to validate
- **Document as you go**: Don't wait until the end
- **Amend commit with progress**: Keep commit and documentation together

## If You Encounter Issues

If you discover:
- The spec is incorrect or incomplete
- A better approach
- Unexpected complexity
- Breaking changes needed

STOP and discuss with the user before proceeding. Don't make major decisions unilaterally.

## Steering Document Integration

Throughout implementation:

1. **Suggest improvements** based on steering documents
2. **Check architecture compliance** against principles
3. **Verify quality gates** match project standards
4. **Follow testing strategy** defined in steering docs
5. **Apply code style** from steering guidelines

## Error Handling

If task ID not found:
```
❌ Error: Task not found

Could not find specification at: docs/tasks/[TASK-ID]/TASK.md

Please ensure:
1. Task ID is correct
2. Specification was created with /spec command
3. Specification file exists

Available tasks:
[List tasks in docs/tasks/ directory]
```
