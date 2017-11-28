pragma solidity ^0.4.15;

/**
 * @title Ticket
 * @dev Contract that marks a ticket existing for an owner
 */

contract Ticket {
   address owner;
   function Ticket(address _owner) public {
      owner = _owner;
   }
   function shred() public {
      if(msg.sender == owner)
         selfdestruct(owner);
   }
}
