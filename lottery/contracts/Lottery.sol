pragma solidity ^0.4.17;

contract Lottery {
    //variables
    address public manager;
    address[] public players;
    
    //constructor
    function Lottery() public {
        //get the address of the person who creates the contract.
        // we will use a the 'msg' global variable which contains information about the account which creates the contract and some details about the transaction
        /* 
            msg Obj
            msg.data - present on any transaction
            msg.gas - gas available
            msg.sender - the address of the person who is invoking the transaction
            msg.value - amount of ether in wei that we sent
        */
        manager = msg.sender;
    }
}