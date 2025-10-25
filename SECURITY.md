# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Which versions are eligible for receiving such patches depends on the severity of the vulnerability.

| Version | Supported          |
| ------- | ------------------ |
| 1.3.x   | :white_check_mark: |
| 1.2.x   | :white_check_mark: |
| 1.1.x   | :x:                |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability, please do the following:

1. **Do NOT** open a public issue
2. Email the details to: [Your security email or create a private security advisory]
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Any suggested fixes

## What to Expect

- **Response Time**: We aim to respond within 48 hours
- **Fix Timeline**: Critical vulnerabilities will be patched within 7 days
- **Disclosure**: We'll coordinate disclosure timing with you

## Security Best Practices

When using this plugin:

1. **Review Generated Code**: Always review specifications and implementations
2. **Protect Secrets**: Don't commit sensitive data in task documentation
3. **Validate Inputs**: Be careful with descriptions that might contain malicious commands
4. **Update Regularly**: Keep the plugin updated to the latest version

## Scope

Security vulnerabilities in:
- Plugin code execution
- Template injection
- Command injection
- Information disclosure

Are in scope for this policy.

## Out of Scope

- Issues in user-provided code or configurations
- Third-party dependencies (report to respective projects)
- Social engineering attacks

Thank you for helping keep this plugin secure!
