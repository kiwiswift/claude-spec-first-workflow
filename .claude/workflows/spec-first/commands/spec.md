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
- Announce: "✅ Using project steering documents"
- List which documents were found
- Proceed to step 1

**If steering documents DON'T exist:**
- **Auto-create them intelligently**:

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

- `quality-standards.md` - Quality gates and non-negotiable requirements
- `architecture-principles.md` - Architecture patterns and constraints
- `testing-strategy.md` - Testing requirements (if exists)
- Any other `.md` files in steering directory

These documents define THIS PROJECT'S standards, not generic defaults. Apply them throughout the specification process.

### 2. Understand the Problem

- Parse the problem description from the command argument
- Ask clarifying questions if the description is unclear
- Identify if this is a bug fix, refactoring, or new feature
- Understand the steps to reproduce (for bugs) or desired functionality (for features)

### 3. Analyze the Codebase

- Use Grep, Glob, and Read tools to examine relevant code
- Identify root causes (for bugs) or implementation points (for features)
- Understand current architecture and patterns
- Find related code that might be affected
- **Check compliance with steering documents**

### 4. Create Task ID

Generate task ID in format: `TASK-YYYYMMDD-CODE###`

- **YYYYMMDD** = today's date (from `<env>` context)
- **CODE** = descriptive code (e.g., BULKOPS, AUTH, UI, PERF, TEST)
- **###** = sequence number (001, 002, etc.)

Examples:
- `TASK-20251019-BULKOPS001` - Bulk operations feature
- `TASK-20251019-AUTH002` - Authentication fix
- `TASK-20251019-REFACTOR003` - Refactoring task

### 5. Create Specification Document

Create directory and file:
- Directory: `docs/tasks/TASK-YYYYMMDD-CODE###/`
- File: `docs/tasks/TASK-YYYYMMDD-CODE###/TASK.md`

Use the task-specification template from `.claude/workflows/spec-first/templates/task-specification.md`

**IMPORTANT**: Include a **Solution Design** section (see template) that describes:
- High-level architecture of the solution
- Key design decisions and trade-offs
- How the solution fits into existing architecture
- Diagrams or pseudocode if helpful

### 6. Apply Steering Document Standards

Ensure the specification adheres to ALL requirements from steering documents:

- **Quality gates**: Use project-specific quality standards, not generic ones
- **Architecture**: Follow project's architecture principles
- **Testing**: Apply project's testing strategy
- **Non-negotiables**: Explicitly check all non-negotiable requirements

### 7. Suggest Improvements

Based on steering documents, suggest improvements to:
- Code quality
- Architecture compliance
- Testing coverage
- Performance
- Security
- Accessibility

### 8. Wait for User Review

- Present the specification to the user
- Ask: "Please review this specification. Let me know if you'd like any changes or if I should proceed with implementation."
- Be ready to iterate based on feedback
- Save refinements as drafts in `_drafts/` folder with version suffixes:
  - `TASK-...-DRAFT-01.md`
  - `TASK-...-DRAFT-02.md`
  - etc.

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

- **Read steering documents FIRST**: Apply project standards, not generic defaults
- **Be thorough**: Analyze the codebase deeply before writing the spec
- **Be specific**: Include file paths, function names, line numbers (e.g., `src/file.ts:123`)
- **Phase the work**: Break complex changes into logical, testable phases
- **Consider impact**: Think about what else might break
- **Solution design**: Always include high-level design thinking
- **Quality first**: Every spec must include project-specific quality checklist
- **Suggest improvements**: Based on steering document guidance
- **Iterative**: Expect to refine the spec based on user feedback

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
