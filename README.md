# Solidity Playground

## Setup

1. `git clone <url>`
2. [Download Binaries](#binary-download)
3. `git clone <url>`
4. `mkdir bin`
5. [Setup Binaries](#binary-setup)

## Useful Commands

```sh
# Main
./anvil

./forge script script/NFT.s.sol:NFTScript --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast

./cast send --rpc-url http://localhost:8545 0x5fbdb2315678afecb367f032d93f642f64180aa3 "mintTo(address)" 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 --value $(./cast --to-wei 0.08 eth) --private-key 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d

./cast call --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0x5fbdb2315678afecb367f032d93f642f64180aa3 "ownerOf(uint256)" 1

./forge test

./forge test --gas-report

# Symlinks
ln -sf ./bin/forge forge
ln -sf ./bin/cast cast
ln -sf ./bin/anvil anvil
```

## Useful Resources

- https://getfoundry.sh
- https://book.getfoundry.sh
- https://github.com/foundry-rs/foundry

## Binary Download

1. Download Binaries from the [GitHub Releases page](https://github.com/foundry-rs/foundry/releases)
2. `tar -xf foundry_<release-info>.tar.gz`
3. `mv forge ~/Desktop/`
4. `mv cast ~/Desktop/`
5. `mv anvil ~/Desktop/`

## Binary Setup

1. `cd ~/Desktop`
2. `mv ./forge <path-to-project-root-directory>/bin`
3. `mv ./cast <path-to-project-root-directory>/bin`
4. `mv ./anvil <path-to-project-root-directory>/bin`
5. `ln -sf ./bin/forge forge`
6. `ln -sf ./bin/cast cast`
7. `ln -sf ./bin/anvil anvil`
8. `./protostar test`
