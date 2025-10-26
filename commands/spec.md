# Specification Creation Workflow

**Usage**: `/spec <problem description>`

**Example**: `/spec Fix the bulk update operations causing page reload and scroll reset`

You are helping the user create a comprehensive specification document for a bug fix, refactoring, or new feature using the Specification-First Development approach.

## Required Argument

This command REQUIRES a problem description as an argument. If no description is provided, show this error:

```
❌ Error: Problem description required

Usage: /spec <description>

Examples:
  /spec Fix the account balance not updating after deleting a transaction
  /spec Add dark mode toggle to application settings
  /spec Refactor transaction validation into domain layer

Please provide a description of the bug, feature, or refactoring needed.
```

## Your Task

### 0. Initialize Steering Documents (If Needed)

**BEFORE ANYTHING ELSE**, check if steering documents exist:

```bash
# Check for steering documents
ls .claude/workflows/spec-first/steering/*.md
```

**If steering documents exist:**

-   Announce: "✅ Using project steering documents"
-   List which documents were found
-   Proceed to step 1

**If steering documents DON'T exist:**

-   **Auto-create them intelligently**:

1. **Detect Project Stack**:

    - Read `package.json` (for JavaScript/TypeScript projects)
    - Read `pyproject.toml` or `requirements.txt` (for Python projects)
    - Read `go.mod` (for Go projects)
    - Check for language-specific config files

2. **Detect Project Standards**:

    - Read `CLAUDE.md` if it exists (extract quality standards and architecture principles)
    - Read `README.md` for project information
    - Check for TypeScript config (strict mode enabled?)
    - Check for ESLint/linting config
    - Check for test framework (Jest/Vitest/pytest/etc.)
    - Analyze existing code structure for architecture patterns

3. **Create Steering Documents**:

    - Copy templates from `.claude/workflows/spec-first/steering/*.template.md`
    - Customize based on detected stack and standards
    - Fill in project-specific values

4. **Announce Creation**:

    ```
    ⚙️ Setting up steering documents...

    I detected this is a [stack] project with:
    - [List detected features]

    I've created steering documents based on your project:
    ✅ quality-standards.md ([summary of standards])
    ✅ architecture-principles.md ([summary of principles])

    📝 These documents now control all quality gates and standards.

    Please review and customize:
      .claude/workflows/spec-first/steering/quality-standards.md
      .claude/workflows/spec-first/steering/architecture-principles.md

    Or run: /setup-steering for guided interactive setup

    Continuing with specification creation...
    ```

5. **Proceed to step 1**

### 1. Read Steering Documents

Read ALL steering documents in `.claude/workflows/spec-first/steering/`:

-   `quality-standards.md` - Quality gates and non-negotiable requirements
-   `architecture-principles.md` - Architecture patterns and constraints
-   `testing-strategy.md` - Testing requirements (if exists)
-   Any other `.md` files in steering directory

These documents define THIS PROJECT'S standards, not generic defaults. Apply them throughout the specification process.

### 2. Understand the Problem

-   Parse the problem description from the command argument
-   Ask clarifying questions if the description is unclear
-   Identify if this is a bug fix, refactoring, or new feature
-   Understand the steps to reproduce (for bugs) or desired functionality (for features)

### 3. Analyze the Codebase

-   Use Grep, Glob, and Read tools to examine relevant code
-   Identify root causes (for bugs) or implementation points (for features)
-   Understand current architecture and patterns
-   Find related code that might be affected
-   **Check compliance with steering documents**

### 4. Determine Task Type and Create Task ID

**Step 4a: Classify Task Type**

Based on the problem description and analysis, classify the task using these criteria:

**FIX** (Bug fixes and corrections):

-   Keywords: "bug", "error", "broken", "not working", "fails", "issue", "crash", "incorrect"
-   Corrects existing functionality that isn't working as intended
-   Fixes regressions or unexpected behavior

**FEAT** (New features and enhancements):

-   Keywords: "add", "implement", "create", "new feature", "enhancement", "functionality"
-   Adds new capabilities or functionality to the system
-   Extends existing features with new options/behavior

**CHORE** (Maintenance and housekeeping):

-   Keywords: "update", "upgrade", "configure", "setup", "maintenance", "dependencies", "tooling"
-   Configuration changes, dependency updates, build system changes
-   No direct impact on end-user functionality

**REFACTOR** (Code restructuring):

-   Keywords: "refactor", "restructure", "clean up", "improve architecture", "extract", "consolidate"
-   Changes internal structure without altering external behavior
-   Improves code quality, maintainability, or design

**PERF** (Performance optimizations):

-   Keywords: "performance", "optimize", "speed", "slow", "memory", "efficiency", "load time"
-   Improves system performance, response times, or resource usage
-   Database query optimization, caching, algorithmic improvements

**TEST** (Testing improvements):

-   Keywords: "test", "testing", "coverage", "unit test", "integration test", "e2e"
-   Adds, improves, or fixes tests
-   Increases test coverage or test reliability

**DOCS** (Documentation):

-   Keywords: "documentation", "readme", "docs", "comments", "guide", "API docs"
-   Updates documentation, comments, or guides
-   No code functionality changes

**Classification Rules:**

1. If multiple types apply, choose the PRIMARY purpose
2. When in doubt between FIX and FEAT: choose FIX if correcting broken behavior
3. When in doubt between REFACTOR and PERF: choose PERF if performance is the main goal

**Step 4b: Generate Task ID**

Generate task ID in format: `TASK-YYYYMMDD-TYPE###`

-   **YYYYMMDD** = today's date (from `<env>` context)
-   **TYPE** = standardized task type (FIX, FEAT, CHORE, REFACTOR, PERF, TEST, DOCS)
-   **###** = sequential number (001, 002, etc.) - **must check existing tasks to determine next number**

**Task Types:**

-   **FIX** - Bug fixes and corrections
-   **FEAT** - New features and enhancements
-   **CHORE** - Maintenance, updates, configuration changes
-   **REFACTOR** - Code restructuring without changing functionality
-   **PERF** - Performance optimizations
-   **TEST** - Test additions or improvements
-   **DOCS** - Documentation updates

**Sequence Number Logic:**

1. Search existing `docs/tasks/` directory for tasks with same TYPE
2. Find highest sequence number for that TYPE across ALL dates
3. Increment by 1 for new task

**Implementation:**

```bash
# Find existing tasks of same type
find docs/tasks -name "TASK-*-${TYPE}*" -type d | \
  grep -E "TASK-[0-9]{8}-${TYPE}[0-9]{3}" | \
  sed -E "s/.*TASK-[0-9]{8}-${TYPE}([0-9]{3}).*/\1/" | \
  sort -n | tail -1
```

**Examples of sequence progression:**

-   First FIX task: `TASK-20251021-FIX001`
-   Second FIX task (different date): `TASK-20251025-FIX002`
-   Third FIX task (same or different date): `TASK-20251027-FIX003`
-   First FEAT task: `TASK-20251027-FEAT001` (independent sequence)

Examples:

-   `TASK-20251021-FIX001` - First bug fix
-   `TASK-20251023-FIX002` - Second bug fix
-   `TASK-20251027-FEAT001` - First feature
-   `TASK-20251027-CHORE001` - First chore task

### 5. Create Specification Document

Create directory and file:

-   Directory: `docs/tasks/TASK-YYYYMMDD-CODE###/`
-   File: `docs/tasks/TASK-YYYYMMDD-CODE###/TASK.md`

Use the task-specification template from `.claude/workflows/spec-first/templates/task-specification.md`

**IMPORTANT**: Include a **Solution Design** section (see template) that describes:

-   High-level architecture of the solution
-   Key design decisions and trade-offs
-   How the solution fits into existing architecture
-   Diagrams or pseudocode if helpful

### 6. Apply Steering Document Standards

Ensure the specification adheres to ALL requirements from steering documents:

-   **Quality gates**: Use project-specific quality standards, not generic ones
-   **Architecture**: Follow project's architecture principles
-   **Testing**: Apply project's testing strategy
-   **Non-negotiables**: Explicitly check all non-negotiable requirements

### 7. Suggest Improvements

Based on steering documents, suggest improvements to:

-   Code quality
-   Architecture compliance
-   Testing coverage
-   Performance
-   Security
-   Accessibility

### 8. Wait for User Review

-   Present the specification to the user
-   Ask: "Please review this specification. Let me know if you'd like any changes or if I should proceed with implementation."
-   Be ready to iterate based on feedback
-   Save refinements as drafts in `_drafts/` folder with version suffixes:
    -   `TASK-...-DRAFT-01.md`
    -   `TASK-...-DRAFT-02.md`
    -   etc.

## Specification Structure

The specification must include these sections (see full template for details):

1. **Problem Statement** - Clear, concise description
2. **Current Behavior** - What happens now
3. **Expected Behavior** - What should happen
4. **Root Cause Analysis** - Technical investigation and findings
5. **Solution Design** ⭐ - High-level architecture and approach
6. **Proposed Solution** - Phased implementation plan
7. **Files to Modify** - Specific files and changes
8. **Impact Analysis** - Breaking changes, performance, security
9. **Alternatives Considered** - Other approaches and why not chosen
10. **Success Criteria** - Measurable outcomes
11. **Quality Checklist** - Project-specific quality gates from steering docs

## Important Guidelines

-   **Read steering documents FIRST**: Apply project standards, not generic defaults
-   **Be thorough**: Analyze the codebase deeply before writing the spec
-   **Be specific**: Include file paths, function names, line numbers (e.g., `src/file.ts:123`)
-   **Phase the work**: Break complex changes into logical, testable phases
-   **Consider impact**: Think about what else might break
-   **Solution design**: Always include high-level design thinking
-   **Quality first**: Every spec must include project-specific quality checklist
-   **Suggest improvements**: Based on steering document guidance
-   **Iterative**: Expect to refine the spec based on user feedback

## After Creating the Spec

**DO NOT proceed with implementation** until the user approves the specification.

This is crucial - the spec-first approach requires user sign-off before coding begins.

Present the spec and explicitly ask for approval or changes.

## Error Handling

If the command is invoked without a description:

1. Show the error message template above
2. Provide examples
3. Wait for user to provide description
4. Do NOT proceed without a valid description
