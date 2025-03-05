// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract uSDC is ERC20 {
    // If you want USDC to have 6 decimals (mimicking the real uSDC), override decimals()
    function decimals() public pure override returns (uint8) {
        return 6;
    }

    constructor(uint256 initialSupply) ERC20("USDC Test Token", "uSDC") {
        _mint(msg.sender, initialSupply);
    }
}