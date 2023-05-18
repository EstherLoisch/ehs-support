## Developing

In order to reproducibly build the site and set up the development environment for working on it, [install Nix](https://nixos.org/download).

### Editing

Site contents are in the [`docs`](./docs) directory.
(This cannot be chosen freely, as GitHub only allows the root directory or `docs`).
The main page is [`index.md`](./docs/index.md), and other pages will be linked from there.

### Deployment

To build the site as a complete artifact in `./result`, run

```console
nix-build
```

This will take a while for the first time and produce lots of output.

### Live updates

To update site content automatically when files are changed:

```console
nix-shell -A live
```

On Linux and macOS this will automatically open a browser window.

### Full rebuild

Incremental rebuilds cannot account for changes of [`_config.yml`](./docs/_config.yml).
To do a full rebuild:

```console
nix-shell -A rebuild
```

### Update dependencies

Whenever you change the version of Nixpkgs in [`pkgs.nix`](./pkgs.nix), update all dependencies with:

```console
nix-shell -A update
```

> **Note**
>
> You may have to re-implement workarounds for build failures in [`gemset.nix`](./gemset.nix).
