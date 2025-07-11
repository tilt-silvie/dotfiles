## General Requests
- Think in English.

## Git
- Always divide work into small work units.
- Perform `git commit` in as small units as possible.
- Follow Semantic Commit Messages for commit messages.
- DO NOT explicitly mention in commit messages that the code was written by Claude or that the commit was created by Claude.

## Implementation Guidelines by Language/Framework

### GitHub Actions

#### Precautions
- Avoid using dind (docker in docker) as much as possible. GitHub Actions `ubuntu-latest` Runner has `docker` and `docker compose` commands available, so use these instead. Note that `docker-compose` is not available, only `docker compose` can be used.
- Access to AWS should be done via OIDC federation using the `configure-aws-credentials` action. This allows GitHub Actions Runner to assume AWS IAM roles, improving security. Avoid using access keys and secret access keys.
- Access to GCP should be done via OIDC federation using the `google-github-actions/auth` action. This allows GitHub Actions Runner to assume GCP IAM roles, improving security. Avoid using service account keys.

#### GitHub Actions Good Practices
Please follow the following Good Practices as much as possible.

- Always specify job timeouts. The default value should be 5 minutes.
- Specify Bash as the default shell and ensure pipe errors are caught.
- For security improvement, minimize GITHUB_TOKEN permissions. Disable permissions at the workflow level and define necessary permissions at the job level.
- Specify action versions using hash values rather than tags. If the hash value is unknown, use GitHub's MCP server to find and apply the correct hash value.
- In `run` directives, always add `set -x` at the beginning to enable tracing options.
- Use `actionlint` to validate code and ensure zero errors and warnings.

##### actionlint
You can validate GitHub Actions code by running the following command at the repository root:

```bash
actionlint
```
