# ProxySwitchboard-Nix

Nix packaging for [ProxySwitchboard](https://github.com/yueyinqiu/ProxySwitchboard) — a local proxy whose upstream can be switched on the fly.

## Adding as a flake input

```nix
{
  inputs = {
    proxy-switchboard.url = "github:yueyinqiu/ProxySwitchboard-Nix";
  };
}
```

> To avoid building from source, you can use the `yueyinqiu` Cachix binary cache:
>
> ```nix
> {
>   nix.settings.extra-substituters = [
>     "https://yueyinqiu.cachix.org"
>   ];
>   nix.settings.extra-trusted-public-keys = [
>     "yueyinqiu.cachix.org-1:iooLFYpS7e6KAU4+QM5Zoj6Tq76jRGo+kjeAbu8JxAc="
>   ];
> }
> ```

## Packages

Two packages are exposed:

```nix
proxy-switchboard.packages.${system}.proxy-switchboard-server
proxy-switchboard.packages.${system}.proxy-switchboard-client
```

- `proxy-switchboard-server` — the local proxy server (`ProxySwitchboard.Server`).
- `proxy-switchboard-client` — the CLI client (`ProxySwitchboard.Client`).

Or try them directly from the CLI:

```console
$ nix shell github:yueyinqiu/ProxySwitchboard-Nix#proxy-switchboard-server
$ nix shell github:yueyinqiu/ProxySwitchboard-Nix#proxy-switchboard-client
```

---

All documentation and `description` fields in this repository are AI-generated.