#!/bin/bash
#
# dirty iterate on live desktop with git push and ansible-pull

set -euxo pipefail

cd "$(dirname "$0")"

git add .
git commit -m "iterate" --allow-empty
git push

ansible-pull -U https://github.com/anconrad/desktop-env/ -e "user=$USER" --clean --ask-become-pass
