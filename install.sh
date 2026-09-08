#!/usr/bin/env zsh

set -e

echo "This will install mdBook and its Graphviz preprocessor via Cargo."

if read -q "Continue? [y/N] "; then
  print
else
  echo "\nAborting."
  exit 1
fi

cargo install mdbook --locked
cargo install mdbook-graphviz --locked
