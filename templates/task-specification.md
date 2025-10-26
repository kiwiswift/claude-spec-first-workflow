# TASK-YYYYMMDD-TYPE###: [Brief Descriptive Title]

> **Type**: [FIX | FEAT | CHORE | REFACTOR | PERF | TEST | DOCS]
> **Created**: YYYY-MM-DD
> **Status**: [Draft | Approved | In Progress | Complete]

## Problem Statement

[Clear, concise description of the problem or feature request. Should be understandable by non-technical stakeholders.]

**For bugs**: Describe what is currently broken or not working as expected.
**For features**: Describe what new functionality is needed and why.
**For refactoring**: Describe what technical debt or architectural issues need addressing.

## Current Behavior

[What currently happens. Include:]
- Steps to reproduce (for bugs)
- Current implementation details (for refactoring)
- Current limitations (for features)
- Screenshots, error messages, or logs if applicable

## Expected Behavior

[What should happen instead. Include:]
- Desired outcome
- Success criteria from user perspective
- Performance expectations if relevant

## Root Cause Analysis

[Technical analysis of WHY the problem exists or what needs to change]

### Technical Investigation

**Files Examined:**
- `path/to/file1.ts:123` - [what was found]
- `path/to/file2.ts:456` - [what was found]

**Key Findings:**
1. [Finding 1 with explanation]
2. [Finding 2 with explanation]

**Root Causes:**
1. [Root cause 1]
2. [Root cause 2]

## Solution Design

⭐ **This section contains the high-level architecture and design thinking for the solution.**

### Overview

[High-level description of the solution approach. Explain the key idea in 2-3 sentences.]

### Architecture Diagram

```
[Optional: ASCII diagram or description of component interactions]

Example:
┌─────────────┐
│ UI Component│
└──────┬──────┘
       │ uses
       ▼
┌─────────────┐
│   Service   │
└──────┬──────┘
       │ calls
       ▼
┌─────────────┐
│ Repository  │
└─────────────┘
```

### Key Design Decisions

1. **Decision 1**: [What was decided]
   - **Rationale**: [Why this decision was made]
   - **Trade-offs**: [What we gain vs. what we lose]
   - **Alternatives considered**: [Other options and why not chosen]

2. **Decision 2**: [What was decided]
   - **Rationale**: [Why this decision was made]
   - **Trade-offs**: [What we gain vs. what we lose]

### Design Patterns Used

- **Pattern 1**: [e.g., Repository Pattern]
  - **Purpose**: [Why this pattern is appropriate]
  - **Implementation**: [How it will be applied]

- **Pattern 2**: [e.g., Optimistic Updates]
  - **Purpose**: [Why this pattern is appropriate]
  - **Implementation**: [How it will be applied]

### Data Flow

[Describe how data flows through the system for this solution]

Example:
```
1. User action triggers event in UI
2. Event handler calls application service
3. Service validates and transforms data
4. Service updates domain entities
5. Repository persists changes
6. UI updates optimistically (before DB confirmation)
```

### Error Handling Strategy

[How errors will be handled at each layer]

- **UI Layer**: [Error presentation to user]
- **Application Layer**: [Business logic errors]
- **Domain Layer**: [Validation errors]
- **Infrastructure Layer**: [External service errors]

### Performance Considerations

[How the solution addresses performance requirements]

- **Optimization 1**: [Description and expected impact]
- **Optimization 2**: [Description and expected impact]

### Security Considerations

[How the solution addresses security requirements]

- **Consideration 1**: [Description]
- **Consideration 2**: [Description]

### Pseudocode / Key Algorithms

[Optional: Pseudocode for complex logic]

```typescript
// Example: Optimistic update flow
function handleBulkUpdate(ids: string[], data: UpdateData) {
  // Update UI immediately (optimistic)
  updateLocalState(ids, data);
  clearSelection();

  // Execute DB update in background (fire-and-forget)
  executeDBUpdate(ids, data);
}
```

## Proposed Solution

### Architecture Impact

[How does this change affect the overall system architecture?]
- Clean Architecture layer affected: [Domain | Application | Infrastructure]
- SOLID principles considerations
- Design patterns used or affected

### Implementation Phases

#### Phase 1: [Phase Title]

**Goal**: [What this phase accomplishes]

**Changes Required:**
- File: `path/to/file.ts`
  - Change 1: [Description]
  - Change 2: [Description]

**Rationale**: [Why this phase is first/necessary]

**Dependencies**: [What must be complete before this phase can start]
- [ ] Dependency 1
- [ ] Dependency 2

**Rollback Strategy**: 🔄

*How to safely rollback this phase if something goes wrong:*

1. **Git Rollback** (if phase was committed):
   ```bash
   # Revert the phase commit
   git revert <commit-hash>

   # Or reset to before the phase
   git reset --hard <commit-before-phase>
   ```

2. **Manual Rollback** (if phase is in progress):
   ```bash
   # Discard changes
   git checkout -- src/path/to/file1.ts
   git checkout -- src/path/to/file2.ts

   # Or use git restore
   git restore src/path/to/file1.ts
   ```

3. **Database Rollback** (if applicable):
   ```sql
   -- Rollback migration
   -- [SQL commands or migration down script]
   ```
   Or:
   ```bash
   # Rollback database migration
   npm run migrate:down
   ```

4. **Non-Revertible Changes**:
   - ⚠️ [List any changes that CANNOT be easily rolled back]
   - [Example: Published npm package, deployed API changes]
   - [Mitigation: How to handle if rollback is needed]

5. **Verification After Rollback**:
   - [ ] Run `npm test` - All tests pass
   - [ ] Run `npm run typecheck` - 0 errors
   - [ ] Run `npm run lint` - 0 warnings
   - [ ] Verify app starts: `npm run dev`
   - [ ] Check feature X still works

**Risk Level**: [Low | Medium | High]
- Low: Easy to rollback, no breaking changes
- Medium: Some complexity, minor breaking changes
- High: Difficult to rollback, major breaking changes

#### Phase 2: [Phase Title]

**Goal**: [What this phase accomplishes]

**Changes Required:**
- File: `path/to/file.ts`
  - Change 1: [Description]
  - Change 2: [Description]

**Rationale**: [Why this phase comes second]

**Dependencies**: [What must be complete before this phase]
- [ ] Phase 1 complete
- [ ] Other dependency

**Rollback Strategy**: 🔄

1. **Git Rollback**:
   ```bash
   git revert <commit-hash>
   ```

2. **Manual Rollback**:
   ```bash
   git checkout -- [files modified in this phase]
   ```

3. **Dependent Phases**:
   - ⚠️ If Phase 3 is already complete, rolling back Phase 2 requires rolling back Phase 3 first
   - Rollback order: Phase 3 → Phase 2

4. **Non-Revertible Changes**: [List or N/A]

5. **Verification After Rollback**:
   - [ ] All quality gates pass
   - [ ] Phase 1 changes still work
   - [ ] No orphaned code

**Risk Level**: [Low | Medium | High]

#### Phase N: [Phase Title]

**Goal**: [What this phase accomplishes]

**Changes Required:**
- [Changes]

**Rationale**: [Why]

**Dependencies**:
- [ ] Previous phases complete

**Rollback Strategy**: 🔄
[Same structure as above phases]

**Risk Level**: [Low | Medium | High]

---

**Phase Dependency Chain:**
```
Phase 1 (Foundation)
  ↓
Phase 2 (Builds on Phase 1)
  ↓
Phase 3 (Builds on Phase 2)
  ↓
Phase N (Final integration)
```

**Rollback Considerations:**
- Phases must be rolled back in REVERSE order
- If Phase 3 fails → only rollback Phase 3
- If Phase 2 needs rollback → must rollback Phase 3 first (if complete)
- Always run full test suite after any rollback

## Files to Modify

### Source Files
- `src/path/to/file1.ts` - [What changes and why]
- `src/path/to/file2.ts` - [What changes and why]

### Test Files
- `src/path/__tests__/file1.test.ts` - [What test updates needed]
- `src/path/__tests__/file2.test.ts` - [What test updates needed]

### Documentation
- `docs/path/to/doc.md` - [What documentation updates]

## Impact Analysis

### Breaking Changes
[List any breaking changes or N/A]

### Performance Impact
[Expected performance changes: better/worse/neutral]

### Security Considerations
[Any security implications or N/A]

### Accessibility Impact
[Any accessibility considerations or N/A]

### Dependency Map

⚠️ **IMPORTANT**: Analyze which files/components depend on the code being modified.

**How to generate:**
1. For each file being modified, use `grep` to find imports/references
2. List all files that import or depend on modified code
3. Identify potential blast radius of changes

**Files Being Modified:**
- `src/path/to/file1.ts`
- `src/path/to/file2.ts`

**Dependency Analysis:**

#### file1.ts Dependencies
```
Files that import/use this file:
  - src/components/ComponentA.tsx (line 5)
  - src/components/ComponentB.tsx (line 12)
  - src/hooks/useCustomHook.ts (line 3)
  - src/__tests__/file1.test.ts (test file)

Potential Impact:
  - ComponentA: Moderate (uses main export)
  - ComponentB: Low (uses utility function only)
  - useCustomHook: High (core dependency)
```

#### file2.ts Dependencies
```
Files that import/use this file:
  - src/services/ServiceA.ts (line 8)
  - src/lib/utils.ts (line 15)

Potential Impact:
  - ServiceA: High (critical dependency)
  - utils.ts: Low (optional utility)
```

**Dependency Graph:**
```
file1.ts (MODIFIED)
  ├── ComponentA.tsx ← May need updates
  ├── ComponentB.tsx ← Check if affected
  └── useCustomHook.ts ← HIGH RISK

file2.ts (MODIFIED)
  ├── ServiceA.ts ← CRITICAL - test thoroughly
  └── utils.ts ← Low impact
```

**Risk Assessment:**
- **High Risk Dependencies**: 2 files (useCustomHook.ts, ServiceA.ts)
- **Medium Risk Dependencies**: 1 file (ComponentA.tsx)
- **Low Risk Dependencies**: 2 files (ComponentB.tsx, utils.ts)

**Action Items:**
- [ ] Test useCustomHook.ts thoroughly after changes
- [ ] Verify ServiceA.ts still works correctly
- [ ] Run full test suite for affected components
- [ ] Check for any indirect dependencies

## Alternatives Considered

### Alternative 1: [Alternative Approach]
**Pros:**
- [Pro 1]

**Cons:**
- [Con 1]

**Why not chosen**: [Explanation]

### Alternative 2: [Alternative Approach]
[If applicable]

## Success Criteria

- [ ] Success criterion 1 (specific, measurable)
- [ ] Success criterion 2
- [ ] Success criterion 3
- [ ] User acceptance: [How will we know users are satisfied?]
- [ ] Performance: [Specific performance targets if applicable]

## Quality Checklist

⚠️ **Use PROJECT-SPECIFIC quality standards from steering documents**:
- Read: `.claude/workflows/spec-first/steering/quality-standards.md`
- Read: `.claude/workflows/spec-first/steering/architecture-principles.md`
- Read: `.claude/workflows/spec-first/steering/testing-strategy.md` (if exists)

Apply the quality gates defined in those documents, NOT generic defaults.

### Code Quality (From quality-standards.md)
- [ ] All tests passing (from project standards)
- [ ] TypeScript: Project-specific requirements met
- [ ] Linting: Project-specific requirements met
- [ ] Build: Project-specific requirements met
- [ ] Code naming: Clear, meaningful, consistent names
- [ ] No prohibited patterns (e.g., 'any' types if prohibited)

### Architecture (From architecture-principles.md)
- [ ] Architecture compliance: Project-specific grade maintained
- [ ] Layer separation: Proper boundaries maintained
- [ ] Design patterns: Project-required patterns used
- [ ] Dependency injection: Project-specific DI approach used
- [ ] SOLID principles: All five principles followed

### Testing
- [ ] Unit tests added/updated
- [ ] Integration tests added/updated (if needed)
- [ ] Edge cases covered
- [ ] Error handling tested

### Documentation
- [ ] Code comments added where needed
- [ ] API documentation updated (if applicable)
- [ ] README updated (if applicable)
- [ ] This specification document complete

## Risks and Mitigation

### Risk 1: [Risk Description]
**Likelihood**: [Low | Medium | High]
**Impact**: [Low | Medium | High]
**Mitigation**: [How to mitigate]

### Risk 2: [Risk Description]
[Add more as needed]

## Implementation Timeline

**Estimated Effort**: [X hours/days]

**Phase Breakdown:**
- Phase 1: [X hours/days]
- Phase 2: [X hours/days]
- Phase N: [X hours/days]

## Notes

[Any additional notes, context, or references]

## References

- Related tasks: [TASK-IDs if applicable]
- GitHub issues: [Links if applicable]
- Design docs: [Links if applicable]
- External resources: [Links if applicable]

---

## Revision History

### Draft 1 (YYYY-MM-DD)
- Initial specification created

### Draft 2 (YYYY-MM-DD) [if applicable]
- [Changes made based on feedback]
