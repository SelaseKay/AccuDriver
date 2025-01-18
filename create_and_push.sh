#!/bin/bash

branches=("branch1" "branch2" "branch3")

# Create and push branches
for branch in "${branches[@]}"; do
  git branch "$branch"
  git push origin "$branch"
done
