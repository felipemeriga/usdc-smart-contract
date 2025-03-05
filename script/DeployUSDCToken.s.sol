// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/uSDC.sol";

contract DeployUSDCToken is Script {
    function run() external {
        // Retrieve the deployer's private key from the environment variable
        // When using vm.envInit, you need to prepend 0x to the private key
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Begin broadcasting transactions using the private key
        vm.startBroadcast(deployerPrivateKey);

        // Set the initial supply.
        // For example, deploying 1,000,000 uSDC tokens (with 6 decimals) means:
        uint256 initialSupply = 1000000 * (10 ** 6);

        // Deploy the uSDC token contract
        uSDC token = new uSDC(initialSupply);

        // Log the deployed token address to the console
        console.log("uSDC deployed at:", address(token));

        vm.stopBroadcast();
    }
}