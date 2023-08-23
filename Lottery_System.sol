// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract day6 {
  //  function average(int a,int b,int c) public pure returns(int){
    
  //    int av = a+b+c;
  //    av = av/3;
  //    return av;
  //  }


   function digitsum(int n) public pure returns(int){
      
      require(n >0 ,"value should be greater than zero");

      int sum = 0;
      
      while(n>0){
       sum += n % 10;
       n = n/10;

      }

      return sum;

    }

}