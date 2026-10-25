#!/bin/sh
# Linker wrapper for Apple targets. See .cargo/config.toml for why.
#
# Inside `devbox shell` the nix toolchain exports SDKROOT and DEVELOPER_DIR
# pointing at nixpkgs' own apple-sdk, and NIX_LDFLAGS pointing at the store's
# libiconv. Apple's /usr/bin/cc honours SDKROOT, so -liconv (which Rust's std
# links on Apple targets) resolves to a /nix/store/<hash>-libiconv-*/lib
# install name that is baked into the binary. The next `nix-collect-garbage`
# removes that store path and the binary dies at startup with
# `dyld: Library not loaded`.
#
# Dropping those variables makes cc fall back to `xcrun`, so -liconv resolves
# through the real macOS SDK and records /usr/lib/libiconv.2.dylib, which lives
# in the dyld shared cache and is always present.
exec /usr/bin/env -u SDKROOT -u DEVELOPER_DIR -u NIX_LDFLAGS -u NIX_CFLAGS_COMPILE \
    /usr/bin/cc "$@"
