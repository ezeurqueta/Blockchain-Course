  //Using inheritance to divide code.

 pragma solidity ^0.4.24;

contract Herencia2{   //Add inheritance to the contract Herencia.
    address private owner;

    constructor() public {
        owner=msg.sender;
    }

    modifier isOwner(){
        require(owner == msg.sender);
        _;
    }
}