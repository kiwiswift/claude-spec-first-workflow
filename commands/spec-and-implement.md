# Specification-First Development (Full Workflow)

You are helping the user with a complete specification-first development workflow: create spec, get approval, then implement.

## Workflow Overview

This combines two workflows:
1. **Specification Creation** (from spec.md)
2. **Implementation** (from implement.md)

## Step 1: Create Specification

Follow the specification creation workflow:

1. Understand the problem
2. Analyze the codebase
3. Create task ID (TASK-YYYYMMDD-CODE###)
4. Create specification document
5. **WAIT FOR USER APPROVAL** ⚠️

## Critical Checkpoint: User Approval Required

After creating the specification:

1. Present the spec to the user
2. Explicitly ask: "Please review this specification. Would you like me to proceed with implementation, or would you like to refine the spec first?"
3. **DO NOT PROCEED** until user gives explicit approval

The user might want to:
- Review and approve immediately
- Request changes to the spec
- Add/remove phases
- Clarify requirements
- Suggest alternative approaches

Be patient and collaborative during this phase.

## Step 2: Implement (After Approval Only)

Once the user approves, follow the implementation workflow:

1. Implement phase by phase
2. Run quality checks after each phase
3. Create phase summaries
4. Create implementation summary
5. Create commit

## Important Guidelines

- **Don't rush**: This is a collaborative process
- **Welcome feedback**: Spec refinement is expected and valuable
- **Stay flexible**: User might want to skip implementation and just keep the spec
- **Document everything**: Both spec and implementation should be well-documented
- **Maintain quality**: All quality gates must pass

## When to Use This Command

Use `/spec-and-implement` when:
- You want the complete workflow from problem to solution
- You're confident the problem is well-understood
- You want to review the spec before implementation begins

Use `/spec` alone when:
- You just want to plan without implementing yet
- You want to create documentation for future work
- You're exploring different solution approaches

Use `/implement` alone when:
- You already have an approved spec
- You're resuming work on a paused task
- Someone else created the spec and you're implementing it
