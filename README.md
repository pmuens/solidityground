# Contracts

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
ln -sf /Users/philipp/Desktop/tinker.nosync/alphahunt/contracts/bin/forge forge

ln -sf /Users/philipp/Desktop/tinker.nosync/alphahunt/contracts/bin/cast cast

ln -sf /Users/philipp/Desktop/tinker.nosync/alphahunt/contracts/bin/anvil anvil
```

## Useful Resources

- https://getfoundry.sh
- https://book.getfoundry.sh
- https://github.com/foundry-rs/foundry
