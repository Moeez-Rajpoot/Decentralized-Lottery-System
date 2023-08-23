// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract LotterSystem {

    address payable public manager;
    address payable[] public participants;

     constructor() {
         manager=payable(msg.sender);
     }


     receive() payable external {
 
        require(msg.value== 2 ether , "Entry Fee Must Be 2 Ethers");
        participants.push(payable(msg.sender));
         
     }

     function Check_Balance() public view returns(uint){
         require(msg.sender==manager, "Not Allowed");
         return address(this).balance; 
     }


     function GenerateRandom() public view returns(uint){


       return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participants.length)));

     }
    
}