# nix catalina
## https://github.com/NixOS/nix

> Check if /nix exists.

>> If not, run echo 'nix' | sudo tee -a /etc/synthetic.conf then reboot.

>> Create an APFS volume for Nix:

>> sudo diskutil apfs addVolume disk1 APFSX Nix -mountpoint /nix
>> sudo diskutil enableOwnership /nix
>> sudo chflags hidden /nix  # Don't show the Nix volume on the desktop
>> echo "LABEL=Nix /nix apfs rw" | sudo tee -a /etc/fstab
>>>You might need to use a different diskX number. Check diskutil list for more.

> Install Nix:

>> a single-user installation
>>> $ curl -L https://nixos.org/nix/install | sh

>> multi-user installation
>>> sh <(curl https://nixos.org/nix/install) --daemon

# nix-env -qa
nix-env -i hello 
nix-shell -p hello (without package)

which hello
hello
nix-env -e hello


# haskell stack
> hie 882 version
>> stack new --resolver=lts-15.3

# vs code 
> export NIXPKGS_ALLOW_UNFREE=1
> nix-env -i vscode
