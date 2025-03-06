# Installing on a new Mac
Basic instructions for how to get a brand new mac running with this config.

## Step 1. Install Determinate Nix
[Install Nix](https://determinate.systems/nix-installer/). We want Determinate Nix so that it survives MacOS version updates.

## Step 2. Clone this repo
We need to make our nix-darwin directory and clone this repo into it.
```bash
sudo mkdir -p /etc/nix-darwin
sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
cd /etc/nix-darwin
git clonehttps://github.com/neonspectra/nix-darwin.git .
```

## Step 3. Installing `nix-darwin`
*from [nix-darwin readme](https://github.com/LnL7/nix-darwin/blob/master/README.md)*

Unlike NixOS, `nix-darwin` does not have an installer, you can just run `darwin-rebuild switch` to install nix-darwin. As `darwin-rebuild` won't be installed in your `PATH` yet, you can use the following command:

```bash
# To use Nixpkgs unstable:
nix run nix-darwin/master#darwin-rebuild -- switch
# To use Nixpkgs 24.11:
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch
```

