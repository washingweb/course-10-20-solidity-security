pragma solidity ^0.4.23;

contract Rsp {
    
    address player1;
    address player2;
    
    string choice1;
    string choice2;
    
    address public winner;
    
    mapping(string => mapping(string => uint)) payoffMatrix;
    
    constructor() public {
        payoffMatrix["r"]["p"] = 2;
        payoffMatrix["p"]["s"] = 2;
        payoffMatrix["s"]["r"] = 2;
        
        payoffMatrix["p"]["s"] = 1;
        payoffMatrix["s"]["p"] = 1;
        payoffMatrix["r"]["s"] = 1;
        
        payoffMatrix["r"]["r"] = 0;
        payoffMatrix["s"]["s"] = 0;
        payoffMatrix["p"]["p"] = 0;
    }
    
    function _payoff(string _choice1, string _choice2) private view returns(uint) {
        return payoffMatrix[_choice1][_choice2];
    }

    function play(string choice) {
        if (player1 == 0x0) {
            player1 = msg.sender;
            choice1 = choice;
        } else {
            player2 = msg.sender;
            choice2 = choice;
            uint result = _payoff(choice1, choice2);
            if (result == 1) {
                winner = player1;
            } else if (result == 2) {
                winner = player2;
            }
            // transfer ether...
        }
    }
    
}
