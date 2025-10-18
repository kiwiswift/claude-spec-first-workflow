# Setup Steering Documents (Interactive)

**Usage**: `/setup-steering`

This command guides you through creating or updating project-specific steering documents that control all quality gates, architecture standards, and testing requirements for the Specification-First workflow.

## What Are Steering Documents?

Steering documents define YOUR project's standards, not generic defaults. They tell the workflow system:
- What quality gates must pass
- What architecture principles to follow
- What testing requirements to enforce
- What patterns and practices to use

## When to Use This Command

Use `/setup-steering` when you want to:
- Set up steering documents for the first time (guided)
- Update existing steering documents
- Customize the workflow for your project
- Switch between different project standards

## Interactive Setup Process

The command will guide you through these steps:

### Step 1: Detect Current Project

Agent will analyze your project:

```
🔍 Analyzing your project...

Detected:
- Language/Stack: TypeScript + React + Next.js
- Package Manager: npm
- Test Framework: Jest
- Linting: ESLint
- Type Checking: TypeScript (strict mode)
- Existing Docs: CLAUDE.md found

Would you like to use these detected settings? (yes/no/customize)
```

### Step 2: Quality Standards

Agent asks about quality requirements:

```
📋 Quality Standards Setup

1. Type Checking:
   Current: TypeScript with strict mode

   Require 0 errors? (yes/no):
   Require 0 warnings? (yes/no):
   Prohibit 'any' types? (yes/no):

2. Linting:
   Current: ESLint

   Require 0 errors? (yes/no):
   Require 0 warnings? (yes/no):

3. Testing:
   Current: Jest

   Require 100% tests passing? (yes/no):
   Minimum coverage %: [enter number or 'none']

4. Build:
   Require successful build? (yes/no):
```

### Step 3: Architecture Principles

Agent asks about architecture:

```
🏗️ Architecture Principles Setup

1. Architecture Style:
   - Clean Architecture
   - Layered Architecture
   - Microservices
   - Modular Monolith
   - Custom (describe)

   Your choice:

2. Layer Structure:
   Do you have distinct layers? (yes/no):

   If yes, list your layers:
   Example: Domain, Application, Infrastructure, Presentation

   Your layers:

3. SOLID Principles:
   Enforce all SOLID principles? (yes/no):

4. Design Patterns:
   Required patterns (comma-separated):
   Example: Repository, Dependency Injection, Factory

   Your patterns:

5. Anti-Patterns to Avoid:
   List patterns to prohibit:
   Example: God objects, Business logic in UI

   Your anti-patterns:
```

### Step 4: Testing Strategy (Optional)

```
🧪 Testing Strategy Setup

Do you want to create a testing strategy document? (yes/no):

If yes:

1. Required Test Types:
   - Unit tests? (yes/no)
   - Integration tests? (yes/no)
   - E2E tests? (yes/no)

2. Coverage Requirements:
   Overall minimum: [%]
   Per-layer requirements:
   - Domain: [%]
   - Application: [%]
   - Infrastructure: [%]
   - UI: [%]

3. Test Naming Convention:
   Example: "should [behavior] when [condition]"
   Your convention:
```

### Step 5: Review and Confirm

Agent shows what will be created:

```
📝 Review Steering Documents

I will create:

1. quality-standards.md
   - TypeScript: 0 errors, 0 warnings, no 'any'
   - ESLint: 0 errors, 0 warnings
   - Jest: 100% passing, 80% coverage
   - Build: Must succeed

2. architecture-principles.md
   - Style: Clean Architecture
   - Layers: Domain, Application, Infrastructure, Presentation
   - SOLID: All principles enforced
   - Patterns: Repository, DI
   - Anti-patterns: God objects, Business logic in UI

3. testing-strategy.md
   - Unit tests: Required
   - Integration tests: Required
   - E2E tests: For critical paths
   - Coverage: 80% overall

Create these documents? (yes/no/edit):
```

### Step 6: Creation

Agent creates the documents:

```
✅ Steering documents created!

Created:
  .claude/workflows/spec-first/steering/quality-standards.md
  .claude/workflows/spec-first/steering/architecture-principles.md
  .claude/workflows/spec-first/steering/testing-strategy.md

These documents now control all quality gates and standards.

You can edit them anytime in:
  .claude/workflows/spec-first/steering/

Try the workflow:
  /spec <your problem description>
```

## Updating Existing Steering Documents

If steering documents already exist:

```
⚠️ Existing steering documents found:
  - quality-standards.md (last updated: 2025-10-19)
  - architecture-principles.md (last updated: 2025-10-19)

What would you like to do?
1. Update existing documents (guided)
2. Reset to defaults (will backup current)
3. Cancel

Your choice:
```

## Quick Mode (Non-Interactive)

For advanced users who want defaults:

```
/setup-steering --quick
```

Agent will:
1. Detect project stack
2. Create sensible defaults
3. Inform user of what was created
4. No questions asked

## Extract from CLAUDE.md

If you have a `CLAUDE.md` file with project standards:

```
/setup-steering --from-claude-md
```

Agent will:
1. Read CLAUDE.md
2. Extract quality standards and architecture principles
3. Create steering documents from extracted info
4. Show what was found and created

## Backup Current Documents

Before making changes, agent ALWAYS creates backups:

```
Creating backup:
  .claude/workflows/spec-first/steering/_backup-2025-10-19/
  - quality-standards.md
  - architecture-principles.md
```

## After Setup

Once steering documents are created, they are automatically used by:
- `/spec` - Specification creation
- `/implement` - Implementation
- `/spec-and-implement` - Full workflow

All quality gates and standards come from YOUR steering documents, not generic defaults.

## Examples

### Example 1: TypeScript/React Project

```
Stack: TypeScript + React + Next.js
Quality Gates:
  - TypeScript: 0 errors (strict)
  - ESLint: 0 errors
  - Jest: 100% passing
Architecture: Clean Architecture (4 layers)
Testing: Unit + Integration + E2E
```

### Example 2: Python/FastAPI Project

```
Stack: Python + FastAPI + SQLAlchemy
Quality Gates:
  - mypy: 0 errors (strict)
  - ruff: 0 errors
  - pytest: 100% passing, 90% coverage
Architecture: Layered (3 layers)
Testing: Unit + Integration
```

### Example 3: Go Microservices

```
Stack: Go + gRPC + PostgreSQL
Quality Gates:
  - go vet: 0 errors
  - golangci-lint: 0 errors
  - go test: 100% passing, 85% coverage
Architecture: Microservices
Testing: Unit + Integration + Contract
```

## Tips

1. **Start simple**: Begin with just quality-standards.md and architecture-principles.md
2. **Be realistic**: Set gates you actually enforce
3. **Use CLAUDE.md extraction**: If you have existing docs, extract from them
4. **Review after creation**: Always review and customize the generated documents
5. **Update as needed**: Steering docs should evolve with your project

## Troubleshooting

### "I want different standards for different environments"

Create multiple steering document sets:
- `steering/` - Production standards
- `steering-dev/` - Development standards
- Switch between them as needed

### "My project has multiple languages"

Create language-specific steering docs:
- `quality-standards-frontend.md` - Frontend (TypeScript)
- `quality-standards-backend.md` - Backend (Python)
- Agent will read all `.md` files

### "I want to share steering docs across projects"

Store steering docs in a separate repo and symlink:
```bash
ln -s ~/shared-steering-docs/* .claude/workflows/spec-first/steering/
```

## Related Commands

- `/spec` - Create specification (uses steering docs)
- `/implement` - Implement task (uses steering docs)
- `/spec-and-implement` - Full workflow (uses steering docs)

---

**Ready to set up your project standards?** Run `/setup-steering`!
