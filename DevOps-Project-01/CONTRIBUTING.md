# Contributing to DevOps-Projects 🚀

Thank you for your interest in contributing to **DevOps-Projects**! This repository contains hands-on projects designed to help learners understand AWS, DevOps tools, cloud infrastructure, CI/CD pipelines, automation, monitoring, and deployment practices.

We welcome contributions that improve code quality, documentation, security, reliability, and learning outcomes.

## 🧰 How to Contribute

### 📖 Improve Documentation

- Improve README files, setup guides, deployment instructions, and troubleshooting guides.
- Correct spelling, grammar, and unclear explanations.
- Add architecture diagrams, screenshots, or examples where helpful.
- Verify that commands and configuration examples are accurate.

### 🐛 Report Bugs or Issues

- Open a GitHub issue describing the problem.
- Include the relevant project name, steps to reproduce, expected behavior, and actual behavior.
- Remove passwords, access keys, tokens, personal information, and other sensitive data from logs and screenshots.

### ✨ Suggest Improvements

- Suggest improvements to existing projects, scripts, infrastructure, or CI/CD workflows.
- Explain the problem your proposal solves.
- Consider maintainability, cost, security, and educational value.

### ☁️ Contribute DevOps Projects

- Add useful AWS, Linux, Docker, Kubernetes, Terraform, CI/CD, or monitoring projects.
- Include clear prerequisites, setup steps, architecture details, and cleanup instructions.
- Identify the project difficulty as beginner, intermediate, or advanced.
- Avoid committing cloud credentials, private keys, passwords, or real production secrets.

## 🚀 Getting Started

### Step 1: Fork the Repository

Open the [DevOps-Projects repository](https://github.com/shreepriyankav/DevOps-Projects) and click **Fork** to create your own copy.

### Step 2: Clone Your Fork

Replace `<your-username>` with your GitHub username.

```bash
git clone https://github.com/<your-username>/DevOps-Projects.git
cd DevOps-Projects
```

### Step 3: Create a Branch

Use a descriptive branch name for your changes.

```bash
git checkout -b docs/update-project-readme
```

Examples:

- `feat/add-terraform-project`
- `fix/java-login-validation`
- `docs/update-deployment-guide`
- `security/improve-secret-handling`

### Step 4: Make Your Changes

- Keep changes focused on one task.
- Follow the existing project structure.
- Update relevant documentation and configuration examples.
- Never include real credentials or sensitive information.

### Step 5: Test Your Changes

Test the affected project whenever possible.

For the Nexora Java Login Application, for example:

```powershell
cd DevOps-Project-01/Project-01-Java-Login-App
.\mvnw.cmd clean package
```

Run project-specific checks as appropriate. Documentation-only changes should be checked for correct commands, valid links, and clear instructions.

### Step 6: Commit Your Changes

Use clear commit messages.

```bash
git add .
git commit -m "docs: improve project documentation"
```

Recommended prefixes:

- `feat:` — new functionality
- `fix:` — bug fixes
- `docs:` — documentation updates
- `test:` — tests
- `refactor:` — code improvements without intended behavior changes
- `security:` — security improvements
- `chore:` — maintenance tasks

### Step 7: Push Your Branch

```bash
git push origin docs/update-project-readme
```

Replace the branch name with the branch you created.

### Step 8: Open a Pull Request

Open a pull request from your fork to the repository's target branch. Describe what changed, why it is needed, and how you tested it.

## 📝 Code Style Guidelines

- Use consistent indentation: two spaces for YAML and the conventions of the relevant programming language.
- Use descriptive file and directory names.
- Keep scripts readable and avoid unnecessary complexity.
- Add comments when they help explain non-obvious logic.
- Ensure files end with a newline.
- Update documentation when commands, architecture, or application behavior changes.
- Avoid committing generated build files, local IDE settings, or unnecessary temporary files.

## 🔐 Security Guidelines

Security is important for all projects in this repository.

- Never commit AWS access keys, passwords, private keys, database credentials, tokens, or populated `.env` files.
- Use environment variables or an appropriate secrets-management solution for sensitive configuration.
- Use least-privilege IAM policies and restrictive security group rules.
- Keep databases and internal application services private where practical.
- Do not expose sensitive logs, customer information, or infrastructure details unnecessarily.
- Review the repository's [Security Policy](SECURITY.md) before reporting a vulnerability.

If a credential is accidentally exposed, revoke or rotate it immediately and investigate the exposure. Removing it from a later commit alone may not be sufficient.

## 🏗️ Project-Specific Guidelines

### For New Projects

Include, where applicable:

- Project purpose and learning objectives.
- Architecture diagram and component descriptions.
- Prerequisites and technologies used.
- Installation, configuration, and deployment steps.
- Testing and verification instructions.
- Troubleshooting guidance.
- Security considerations and estimated cloud costs.
- Resource cleanup and teardown instructions.

### For the Nexora Java Login Application

When contributing to `Project-01-Java-Login-App`:

- Preserve the separation between the web, application, and database tiers.
- Keep database credentials outside the source code.
- Use parameterized SQL queries for database operations.
- Document the Nginx reverse proxy, Java application service, and RDS configuration accurately.
- Verify application behavior after relevant changes.
- Do not document unimplemented AWS services as completed features.

### For AWS Infrastructure Changes

- Clearly identify the AWS Region and resources involved.
- Explain any changes to networking, IAM, security groups, or database access.
- Include deployment validation and cleanup steps.
- Consider ongoing AWS charges before creating resources.
- Never publish credentials or sensitive infrastructure configuration.

## ✅ Pull Request Checklist

Before submitting a pull request, confirm the following:

- [ ] My changes address a clear problem or improvement.
- [ ] I followed the repository's structure and style.
- [ ] I tested the relevant code or validated the documentation.
- [ ] I updated related documentation.
- [ ] I reviewed the security implications.
- [ ] I removed credentials and other sensitive information.
- [ ] I explained the changes and testing performed.
- [ ] I checked for merge conflicts.

### Pull Request Template

```markdown
## Description
Describe the changes and the problem they solve.

## Type of Change
- [ ] Bug fix
- [ ] New feature or project
- [ ] Documentation update
- [ ] Security improvement
- [ ] Refactoring or maintenance

## Testing
Describe the tests or validation performed.

## Checklist
- [ ] Relevant documentation is updated.
- [ ] No secrets or credentials are included.
- [ ] Security implications have been considered.
- [ ] Changes follow project guidelines.
```

## 💬 Support and Feedback

- **Issues:** Report bugs or suggest improvements through GitHub Issues, if enabled.
- **Pull Requests:** Submit changes for review and discussion.
- **Security:** Follow the repository's Security Policy for vulnerability reports.

Please keep discussions constructive, respectful, and focused on improving the projects. All contributors are expected to follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## 🌟 Recognition

We appreciate contributions of all sizes, including code, documentation, testing, troubleshooting guides, architecture improvements, and security enhancements.

Contributions merged into the repository may appear in GitHub's contributor information and project history.

## 📜 Licensing

By submitting a contribution, you confirm that you have the right to submit it and that you agree to the licensing terms applicable to the repository.

Review the repository's existing license before contributing. Do not submit code or other materials that you do not have permission to share.

---

Thank you for helping improve **DevOps-Projects** and making practical DevOps learning more accessible. 🚀