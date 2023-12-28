// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract VendingMachine{
    address public owner;
    mapping(address => uint) donutBalance;

    // at deploy will create smart contract and set owner as who deployed
    constructor(){
        owner = msg.sender;
        // "this" is address of smart contract
        donutBalance[address(this)] = 100;
    }

    function getVendingMachineBalance() public view returns (uint) {
        return donutBalance[address(this)];
    }

    function restock(uint amount) public {
        require(owner == msg.sender, "You need to be an owner to refill stock");
        donutBalance[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(donutBalance[address(this)] >= amount, "Not enough donut in the machine");
        require(msg.value >= amount * 2 ether, "Not enough ether for requested donut");

        donutBalance[address(this)] -= amount;
        donutBalance[address(msg.sender)] += amount;
    }

    function getThis() public view returns (address thisAddress) {
        return address(this);
    }
}