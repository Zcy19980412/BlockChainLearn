// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "solmate\src\tokens\ERC1155.sol";

contract MyToken is ERC1155 {
    // Token ID constants
    uint256 public constant GOLD = 1;
    uint256 public constant SILVER = 2;
    uint256 public constant DIAMOND = 3;

    constructor() ERC1155("https://example.com/metadata/{id}.json") {
        // Mint initial tokens to the deployer
        _mint(msg.sender, GOLD, 1000, "");  // 1000 GOLD tokens
        _mint(msg.sender, SILVER, 5000, "");  // 5000 SILVER tokens
        _mint(msg.sender, DIAMOND, 1, "");  // 1 unique DIAMOND token
    }

    // Function to mint new tokens
    function mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public onlyOwner {
        _mint(account, id, amount, data);
    }

    // Function to batch mint multiple tokens
    function mintBatch(
        address account,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) public onlyOwner {
        _mintBatch(account, ids, amounts, data);
    }
}
