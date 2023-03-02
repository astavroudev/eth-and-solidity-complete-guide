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

    //enter lottery function
    function enter() public payable {
        require(msg.value > .01 ether);

        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        uint index = random() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier restricted() {
          require(msg.sender == manager);
          //it will take whatever is in the function calling it and use it here _
          _;
    }

    function getPlayers() public view returns (address[]) {
        return players;
    } 
}