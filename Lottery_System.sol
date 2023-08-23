// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract LotterSystem {

    address public manager;
    address payable[] public participants;

     constructor() {
         manager=msg.sender;
     }


     receive() payable external {
 
        require(msg.value== 2 ether , "Lotter Ticket Price is 2 Ethers");
        participants.push(payable(msg.sender));
         
     }

     function Check_Balance() public view returns(uint){
         require(msg.sender==manager, "Only Manager is Allowed to Access");
         return address(this).balance; 
     }


     function Get_Winner() public {

       require(participants.length>=3, "Participants Shoud be greater than 3");
       require(msg.sender==manager, "Only Manager Can Call");
       uint Index = uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,participants.length))) % participants.length;
       address payable winner = participants[Index];
       winner.transfer(Check_Balance());

     }
    
}