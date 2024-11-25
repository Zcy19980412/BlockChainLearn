//SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract Bank is Ownable{

    mapping(address => uint) public balanceOf;
    address public _tokenAddress;
    address public _govAddress;

    event Deposit(address user, uint256 amount);
    event Withdraw(address user, uint256 amount);

    constructor(address tokenAddress) Ownable (msg.sender) {
        _tokenAddress = tokenAddress;
    }

    modifier onlyGovAddress() {
        require(msg.sender == _govAddress, "Only GovAddress");
        _;
    }

    function setGovAddress(address govAddress) public onlyOwner {
        _govAddress = govAddress;
    }

    function deposit(uint amount) external {
        IERC20(_tokenAddress).transferFrom(msg.sender,address (this), amount);
        balanceOf[msg.sender] += amount;
        emit Deposit(msg.sender, amount);
    }

    function withdraw(uint amount) external {
        require(balanceOf(msg.sender >= amount),"amount must greater than balance");
        IERC20(_tokenAddress).transfer(msg.sender, amount);
        balanceOf[msg.sender] -= amount;
        emit Withdraw(msg.sender, amount);
    }

    function adminWithdraw() public onlyGovAddress {
        IERC20(_tokenAddress).transfer(_owner, IERC20(_tokenAddress).balanceOf(address (this)));
        emit Withdraw(msg.sender, IERC20(_tokenAddress).balanceOf(address (this)));
    }


}