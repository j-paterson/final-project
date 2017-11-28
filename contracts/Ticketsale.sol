pragma solidity ^0.4.15;

import './Ticket.sol';
import './utils/SafeMath.sol';

/**
 * @title Ticketsale
 * @dev Contract that creates new sales for a particular show
 */

contract Ticketsale {
	address public creator;
	uint public currentBalence;
	uint public saleOpens;
	uint public showDate;
	uint public refundWindow;
	uint public remainingTickets;
	uint public ticketCost;
	uint public maxTickets;
	address[] buyers;

	struct Buyer {
	   uint ticketNumber;
	}

	mapping(address => Buyer) buyerInfo;

	event TicketSold(address receiver, bool status);
	event EtherRefunded(address receiver, bool status);

	modifier isCreator() {
		require(msg.sender == creator);
		_;
	}

	modifier saleHasEnded() {
		require(now > showDate);
		_;
	}

	modifier saleHasNotEnded() {
		require(saleOpens <= now && now <= showDate);
		_;
	}

	function Ticketsale(uint256 _totalSupply, uint256 _ticketCost, uint256 _maxTickets, uint256 _showDate) public{
		saleOpens = now;
		showDate = SafeMath.add(saleOpens, SafeMath.mul(_showDate, 1 minutes));
		creator = msg.sender;
		remainingTickets = _totalSupply;
		ticketCost = _ticketCost;
		maxTickets = _maxTickets;
		showDate = _showDate;
	}

	/*
	function purchaseTicket() saleHasNotEnded() public returns (bool)  {
		return true;
	}
	*/

	function refund() public returns (bool) {
		bool good = true;
		if (good) {
			good = msg.sender.send(ticketCost);
		}
		EtherRefunded(msg.sender, good); // event
		return good;
	}

	function withdrawFunds() saleHasEnded() isCreator() public returns (bool) {
		return creator.send(currentBalence);
		selfdestruct(creator);
	}

}
