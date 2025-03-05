// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/uSDC.sol";

contract uSDCTest is Test {
    uSDC token;
    address deployer = address(1);

    function setUp() public {
        // Use vm.prank to simulate the deployer address during contract deployment.
        vm.prank(deployer);
        // Deploy uSDC with an initial supply of 1,000,000 units (with 6 decimals).
        // For example, 1000 tokens means 1000 * 10**6 in the smallest unit.
        token = new uSDC(1000 * 10 ** 6);
    }

    function testName() public view {
        assertEq(token.name(), "USDC Test Token");
    }

    function testSymbol() public view {
        assertEq(token.symbol(), "uSDC");
    }

    function testDecimals() public view {
        assertEq(token.decimals(), 6);
    }

    function testInitialSupply() public view {
        uint256 expectedSupply = 1000 * 10 ** 6;
        assertEq(token.totalSupply(), expectedSupply);
        assertEq(token.balanceOf(deployer), expectedSupply);
    }
}
