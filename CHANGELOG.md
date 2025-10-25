# Changelog

All notable changes to the Specification-First Workflow will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2025-10-19

### Added
- `/validate-steering` command for checking if steering documents are current
- **Dependency Map** section in task specifications
- **Rollback Strategy** section for each implementation phase
- Auto-detection of project changes since steering docs last updated
- Consistency validation between steering docs and project config
- Phase dependency chain documentation
- Risk level assessment for each phase

### Changed
- Manifest version bumped to 1.3.0
- Task specification template enhanced with dependency analysis
- Phase template includes explicit rollback instructions

### Improved
- Better safety with rollback strategies
- Clearer impact assessment with dependency mapping
- Proactive validation of steering documents

## [1.2.0] - 2025-10-19

### Added
- Intelligent auto-creation of steering documents
- `/setup-steering` command for interactive configuration
- Auto-detection of project stack and standards
- Extraction from CLAUDE.md if exists
- Support for TypeScript, Python, Go projects
- Quick modes: `--quick`, `--from-claude-md`

### Changed
- `/spec` and `/implement` now auto-create steering docs if missing
- Workflow is now truly zero-config
- Manifest version bumped to 1.2.0

### Improved
- First-time user experience (no manual setup required)
- Cross-project compatibility
- Plugin-ready structure

## [1.1.0] - 2025-10-19

### Added
- Steering documents system for project-specific configuration
- `steering/quality-standards.md` - Quality gates
- `steering/architecture-principles.md` - Architecture principles
- `steering/testing-strategy.template.md` - Testing requirements
- Solution Design section in task specifications
- User validation workflow (agent waits for approval)
- Progress tracking with `docs/PROGRESS.md`
- Commit amendment with progress updates

### Changed
- Templates now reference steering docs for quality gates
- `/spec` requires description argument
- Quality checklists are project-specific, not generic
- Manifest version bumped to 1.1.0

### Improved
- Project adaptability (works with any stack)
- User collaboration (validation before completion)
- Traceability (progress tracking with commit links)
- Design thinking (Solution Design section)

## [1.0.0] - 2025-10-19

### Added
- Initial release
- `/spec` command for creating specifications
- `/implement` command for phased implementation
- `/spec-and-implement` command for full workflow
- Task specification template
- Implementation summary template
- Phase summary template
- Commit message template
- Complete documentation (README, QUICK-START)
- Plugin-ready structure

### Features
- Specification-first development approach
- Phased implementation with quality gates
- Complete documentation generation
- Task ID tracking (TASK-YYYYMMDD-CODE###)
- Quality gates enforcement
- Clean Architecture compliance

### Validation
- Proven in production environments
- Delivers consistent quality improvements
- 100% test coverage enforcement
- Complete documentation generation

---

## Upgrade Guide

### From 1.2.0 to 1.3.0

No breaking changes. New features:
1. Run `/validate-steering` to check your steering docs
2. Specifications now include dependency maps automatically
3. Each phase includes rollback strategy

### From 1.1.0 to 1.2.0

No breaking changes. New features:
1. Steering docs auto-created on first use
2. Use `/setup-steering` for guided setup
3. No manual setup required for new projects

### From 1.0.0 to 1.1.0

**Action required:**
1. Create steering documents:
   ```bash
   /setup-steering
   ```
2. Or copy templates and customize:
   ```bash
   cp steering/quality-standards.template.md steering/quality-standards.md
   cp steering/architecture-principles.template.md steering/architecture-principles.md
   ```

---

## Future Roadmap

### Planned for 1.4.0
- Visual dependency graph generation
- Automated rollback execution
- Integration with CI/CD pipelines
- Enhanced validation rules

### Under Consideration
- Support for monorepos
- Multi-language project support
- Team collaboration features
- Template marketplace

---

**Current Version**: 1.3.0
**Release Date**: 2025-10-19
**Stability**: Stable (Battle-tested)
