# USDC Smart Contract

This repo consists in a test USDC coin, to be used as an ERC-20 token.

## Installing

To install dependencies, you need to execute the following commands:

```shell
forge install foundry-rs/forge-std
forge install OpenZeppelin/openzeppelin-contracts
```

Since the `remappings.txt` file is already present, there is no need to 
adjust the dependencies in Solidity code.

## Running

For building the smart-contract, you can run:
```shell
forge build
```

For executing tests:
```shell
forge test -vv
```

## Deploying

To deploy this smart-contract to Sepolia network, you can execute the following command:
```shell
forge script script/DeployUSDCToken.s.sol --rpc-url $SEPOLIA_RPC --private-key $PRIVATE_KEY --broadcast
```

Remember to set the `SEPOLIA_RPC`, and `PRIVATE_KEY` environment variables.

## Generating ABI

After building the smart-contract, you can generate the ABI with that command:
```shell
 jq '.abi' out/uSDC.sol/uSDC.json > uSDC.abi
```

If you are using a tool like `abigen`, for interacting with the smart-contract in your
Go code, you can execute this following command, after generating the ABI:
```shell
 abigen --abi uSDC.abi --pkg usdc --out usdc.go
```

For the same ABI generator in Rust, you could use: [ethers-contract-abigen](https://crates.io/crates/ethers-contract-abigen)
