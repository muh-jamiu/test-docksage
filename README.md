test-docksage — minimal repo for testing DockSage

Goal

This repository is a minimal playground you can push to GitHub and then install the DockSage GitHub App on. To test DockSage:

1. Push this folder to a new GitHub repository named `test-docksage` (or any name you prefer).
2. Install the DockSage GitHub App into that repository.
3. Open a pull request that changes `Dockerfile` (for example modify or add a new layer).
4. DockSage should comment on the PR with Hadolint findings (raw output is fine).

Quick push (example using git + gh):

```bash
git init
git add .
git commit -m "initial test-docksage"
gh repo create YOUR_GITHUB_USERNAME/test-docksage --public --source=. --remote=origin --push
```

Create a test PR that changes the Dockerfile:

```bash
git checkout -b fix-dockerfile
# edit Dockerfile (for example change RUN or add a layer)
git commit -am "tweak Dockerfile for testing"
git push --set-upstream origin fix-dockerfile
# open PR
gh pr create --title "Test DockSage hadolint" --body "Trigger DockSage comment"
```

If DockSage is installed with proper permissions and a webhook, it should comment on the PR with hadolint output.

Notes

- This repo intentionally contains Dockerfile anti-patterns so Hadolint will produce findings.
- If you use a self-hosted DockSage or local testing environment, ensure the webhook URL/installation is configured to receive events from this repository.
- See `.github/docksage-manifest.yml` for a sample manifest that can be used as a starting point when creating a GitHub App via the UI.
