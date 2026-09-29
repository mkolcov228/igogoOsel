#!/bin/sh
echo 'Running linter (flake8)...'
python -m flake8 src/
if [ $? -ne 0 ]; then
    echo 'ERROR: Linter found issues. Commit aborted!'
    exit 1
fi
branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" = 'main' ]; then
    echo 'ERROR: Direct commits to main branch are forbidden!'
    exit 1
fi
