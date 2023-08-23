// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract LotterSystem {

    address payable public manager;
    address payable[] public participants;

     constructor() {
         manager=payable(msg.sender);
     }


     receive() payable external {
 
        participants.push(payable(msg.sender));
         
     }

     function Check_Balance() public view returns(uint){
         return address(this).balance; 
     }
    
}