// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Vault is ERC20 {
    IERC20 public immutable token;

    constructor(IERC20 token_) ERC20("Liquidity Provider Token", "LP-TKN") {
        token = token_;
    }

    function deposit(uint256 amount) external {
        require(amount > 0);

        uint256 amountToken = amount;
        uint256 supplyLPToken = this.totalSupply();
        uint256 balanceToken = token.balanceOf(address(this));

        uint256 amountLPToken;
        if (supplyLPToken == 0) {
            amountLPToken = amountToken;
        } else {
            amountLPToken = (amountToken * supplyLPToken) / balanceToken;
        }

        _mint(msg.sender, amountLPToken);
        token.transferFrom(msg.sender, address(this), amountToken);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0);

        uint256 amountLPToken = amount;
        uint256 supplyLPToken = this.totalSupply();
        uint256 balanceToken = token.balanceOf(address(this));

        uint256 amountToken = (amountLPToken * balanceToken) / supplyLPToken;

        _burn(msg.sender, amountLPToken);
        token.transfer(msg.sender, amountToken);
    }
}
