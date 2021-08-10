#!/bin/sh

tf_docs() {
  DIR="${1}"
  cd "${DIR}" || exit
  terraform-docs .
  git add README.md
}

for d in "$(pwd)"/modules/*; do
  tf_docs "${d}"
done
