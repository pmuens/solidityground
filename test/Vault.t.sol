// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import {Vault} from "../src/Vault.sol";
import {MockERC20} from "./utils/MockERC20.sol";

contract VaultTest is Test {
    MockERC20 token;
    Vault vault;

    uint256 constant TO_MINT = 10 ether;
    address constant ALICE = address(0x0123);
    address constant BOB = address(0x4567);

    function setUp() public {
        token = new MockERC20("Token", "TKN", 18);
        vault = new Vault(IERC20(address(token)));

        token.mint(ALICE, 100 ether);
        token.mint(BOB, 100 ether);
    }

    function testEndToEnd() public {
        // Alice deposits 10 TKN
        vm.startPrank(ALICE);
        token.approve(address(vault), 10 ether);
        vault.deposit(10 ether);
        vm.stopPrank();

        assertEq(vault.balanceOf(ALICE), 10 ether);
        assertEq(token.balanceOf(ALICE), 100 ether - 10 ether);

        assertEq(token.balanceOf(address(vault)), 10 ether);

        // Bob deposits 20 TKN
        vm.startPrank(BOB);
        token.approve(address(vault), 20 ether);
        vault.deposit(20 ether);
        vm.stopPrank();

        assertEq(vault.balanceOf(BOB), 20 ether);
        assertEq(token.balanceOf(BOB), 100 ether - 20 ether);

        assertEq(token.balanceOf(address(vault)), 30 ether);

        // Fees accumulate
        token.mint(address(vault), 30 ether);

        assertEq(token.balanceOf(address(vault)), 60 ether);

        // Alice withdraws
        vm.startPrank(ALICE);
        vault.approve(address(vault), 10 ether);
        vault.withdraw(10 ether);
        vm.stopPrank();

        assertEq(vault.balanceOf(ALICE), 0 ether);
        assertEq(token.balanceOf(ALICE), 100 ether - 10 ether + 20 ether); // + 20 because of the vault accumulating fees

        assertEq(token.balanceOf(address(vault)), 40 ether);

        // Bob withdraws
        vm.startPrank(BOB);
        vault.approve(address(vault), 20 ether);
        vault.withdraw(20 ether);
        vm.stopPrank();

        assertEq(vault.balanceOf(BOB), 0 ether);
        assertEq(token.balanceOf(BOB), 100 ether - 20 ether + 40 ether); // + 40 because of the vault accumulating fees

        assertEq(token.balanceOf(address(vault)), 0 ether);
    }
}
