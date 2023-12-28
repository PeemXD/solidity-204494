// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Greeting {
    string public name;
    string public greetingPrefix = "Hello ";

    constructor(string memory initialName) {
        // init name as a memory
        name = initialName;
    }

    function setname(string memory newName) public {
        name = newName;
    }

    function getGreeting() public view returns(string memory) {
        // abi.encodePacked use for con-cat string
        return string(abi.encodePacked(greetingPrefix, name));
    }
}