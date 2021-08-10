#!/bin/sh

ORIGIN="$(pwd)"

tf_docs() {
  DIR="${1}"
  cd "${DIR}" || exit
  terraform-docs .
}

for d in "$(pwd)"/modules/*; do
  tf_docs "${d}"
done

cd "${ORIGIN}" || exit
git add .