#!/bin/bash

# Check Rust installation
if ! command -v rustup &> /dev/null; then
  echo "rustup is not installed"
  exit 1
fi

# Check Cargo installation
if ! command -v cargo &> /dev/null; then
  echo "cargo is not installed"
  exit 1
fi

echo "Dependencies satisfied"