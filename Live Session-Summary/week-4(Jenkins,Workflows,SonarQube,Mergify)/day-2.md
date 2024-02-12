## GitHub Actions 

### GitHub Actions - GitHub Token

- GitHub Actions uses a token to authenticate with GitHub. This token is automatically created by GitHub and is available to all GitHub Actions workflows. The token is available in the `GITHUB_TOKEN` environment variable.
**Example:**
```yaml
name: Greetings

on: [pull_request_target, issues]

jobs:
  greeting:
    runs-on: ubuntu-latest
    permissions:
      issues: write
      pull-requests: write
    steps:
    - uses: actions/first-interaction@v1
      with:
        repo-token: ${{ secrets.GITHUB_TOKEN }}
        issue-message: "Hello, Thanks for opening your first Issue. I will review it soon, Thanks"
        pr-message: "Hello, Thanks for opening your first Pull request. I will review it soon, Thanks"
```
- In this above example, we are using the `GITHUB_TOKEN` to interact with the issues and pull requests. This token is automatically created by GitHub and is available to all GitHub Actions workflows.