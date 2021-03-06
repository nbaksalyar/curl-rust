#!/bin/sh

set -ex

cargo test --target $TARGET --no-run
if [ -z "$NO_RUN" ]; then
    cargo test --target $TARGET
    cargo run --manifest-path systest/Cargo.toml --target $TARGET
fi
cargo doc --no-deps
cargo doc --no-deps -p curl-sys
