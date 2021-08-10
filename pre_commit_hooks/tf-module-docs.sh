#!/bin/sh

ORIGIN="$(pwd)"

tf_docs() {
  terraform-docs -c "${ORIGIN}/.terraform-docs.yml" .
}

tf_module() {
  DIR="${1}"
  cd "${DIR}" || exit
  tf_docs
}

for d in "$(pwd)"/modules/*; do
  [ -f "README.md" ] && tf_module "${d}"
done

cd "${ORIGIN}" || exit
tf_docs
git add .