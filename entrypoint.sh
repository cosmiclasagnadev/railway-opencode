#!/bin/bash
set -e

[[ ! -d "$HOME/.agents" ]] && cp -a /opt/skills-seed "$HOME/.agents"

eval "$(mise activate bash)"

[[ -n "$GIT_USER_NAME" ]] && git config --global user.name "$GIT_USER_NAME"
[[ -n "$GIT_USER_EMAIL" ]] && git config --global user.email "$GIT_USER_EMAIL"
[[ -n "$GITHUB_TOKEN" ]] && echo "$GITHUB_TOKEN" | gh auth login --with-token

exec opencode serve --hostname 0.0.0.0 --port "${PORT:-4096}"
