// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Votes} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import {Nonces} from "@openzeppelin/contracts/utils/Nonces.sol";

contract VoteToken is ERC20Votes {
    constructor() ERC20("VoteToken", "VT")  {}

    function _update(address from, address to, uint256 amount) internal override {
        super._update(from, to, amount);
    }

    function nonces(address owner) public view virtual override returns (uint256) {
        return super.nonces(owner);
    }
}