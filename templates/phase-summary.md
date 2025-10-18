# Phase N Summary: [Phase Title]

> **Task**: TASK-YYYYMMDD-CODE###
> **Phase**: N of M
> **Completed**: YYYY-MM-DD

## Phase Goal

[Clear statement of what this phase accomplishes and why it's a separate phase]

## Changes Made

### High-Level Overview

[2-3 sentences describing what was done in this phase]

### Detailed Changes

#### Change 1: [Change Description]

**File**: `path/to/file.ts`

**What Changed:**
```typescript
// Before (if applicable)
old code here

// After
new code here
```

**Why**: [Explanation of why this change was needed]

**Impact**: [What this affects in the system]

#### Change 2: [Change Description]

[Same structure as Change 1]

## Files Modified

### Source Code
- `src/path/to/file1.ts` (+XX, -YY lines)
  - [Specific changes made]
- `src/path/to/file2.ts` (+XX, -YY lines)
  - [Specific changes made]

### Tests
- `src/__tests__/file1.test.ts` (+XX, -YY lines)
  - [Test changes/additions]

### Documentation
- `docs/path/to/doc.md` (+XX, -YY lines)
  - [Documentation updates]

## Quality Checks

### TypeScript
```bash
$ npm run typecheck
✓ 0 errors
✓ 0 warnings
```

### ESLint
```bash
$ npm run lint
✓ 0 errors
✓ 0 warnings
```

### Tests
```bash
$ npm test
Test Suites: X passed, X total
Tests:       X passed, X total
Time:        Xs
```

**Test Changes:**
- Added X new tests
- Updated X existing tests
- All tests passing ✅

## Architecture Compliance

- ✅ Clean Architecture: [Specific compliance notes]
- ✅ SOLID Principles: [Specific compliance notes]
- ✅ Dependency Injection: [Usage notes if applicable]
- ✅ Layer Separation: [Notes on layer boundaries]

## Before/After Comparison

### Before This Phase
[Describe the state before this phase]

### After This Phase
[Describe the new state]

### Key Improvements
1. [Improvement 1]
2. [Improvement 2]

## Issues Encountered

[List any issues encountered during this phase, or state "No issues encountered"]

### Issue 1: [Issue Description]
**Resolution**: [How it was resolved]
**Time Impact**: [How much extra time it took]

## Performance Impact (if applicable)

**Measured Metrics:**
- [Metric 1]: [Before] → [After] ([Change %])
- [Metric 2]: [Before] → [After] ([Change %])

## Next Steps

[What needs to happen next - either the next phase or final steps]

### Immediate Next Phase: Phase N+1
[Brief description of next phase if applicable]

### Dependencies for Next Phase
[Any dependencies that must be resolved before next phase]

## Code Review Notes

[Any notes for reviewers about specific decisions or trade-offs made]

- [Note 1]
- [Note 2]

## References

- Main Specification: [TASK.md](./TASK.md)
- Previous Phase: [PHASE-N-1-SUMMARY.md](./PHASE-N-1-SUMMARY.md) [if applicable]
- Next Phase: [PHASE-N+1-SUMMARY.md](./PHASE-N+1-SUMMARY.md) [if applicable]
