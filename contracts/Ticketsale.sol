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
	address[] players;
	struct Buyer {
	   uint amountBet;
	   uint ticketNumber;
	}
	mapping(address => Player) playerInfo;

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

	function Ticketsale(
		uint256 _totalSupply, uint256 _ticketCost, uint256 _maxTickets)
	{
		saleOpens = now;
		showDate = SafeMath.add(saleOpens, SafeMath.mul(_timeInMinutesForFundraising, 1 minutes));
		//showDate = saleOpens + (_timeInMinutesForFundraising * 1 minutes);
		creator = msg.sender;
		remainingTickets = _totalSupply;
		ticketCost = _ticketCost;
		maxTickets = _maxTickets;
	}

	function deliver() payable saleHasNotEnded() returns (bool) {
		return true;
	}


	function refund(uint256 amount) returns (bool) {
		bool good = ticket.refund(msg.sender, amount);
		if (good) {
			uint256 refundAmount = tokenToWei(amount);
			good = msg.sender.send(refundAmount);
		}
		EtherRefunded(msg.sender, good); // event
		return good;
	}

	function withdrawFunds() saleHasEnded() isCreator() returns (bool) {
		return creator.send(currentBalence);
		selfdestruct(owner);
	}

}
