pragma solidity ^0.4.25;

// auction
contract Target {
    address highestBidder;
    uint highestBid;

    function bid() public payable {
        require(msg.value >= highestBid);

        if (highestBidder != address(0)) {
            highestBidder.transfer(highestBid); // <--
        }

       highestBidder = msg.sender;
       highestBid = msg.value;
    }
}
