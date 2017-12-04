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
	uint public totalTickets;
	uint public soldTickets;
	uint public ticketCost;
	uint public maxTickets;
	uint private profits;
	address[] buyers;

	struct Buyer {
	   uint ticketNumber;
	}

	mapping(address => Buyer) private buyerInfo;
	mapping(address => bool) private isGreeter;
	mapping(address => bool) private hasEntered;

	event TicketSold(address receiver, bool status);
	event EtherRefunded(address receiver, bool status);

	modifier isCreator() {
		require(msg.sender == creator);
		_;
	}

	modifier isGreeter() {
		require(isGreeter[msg.sender] == true);
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

	function admit(){

	}

	function Ticketsale(uint256 _totalSupply, uint256 _ticketCost, uint256 _maxTickets, uint256 _showDate) public{
		saleOpens = now;
		showDate = SafeMath.add(saleOpens, SafeMath.mul(_showDate, 1 minutes));
		creator = msg.sender;
		totalTickets = _totalSupply;
		ticketCost = _ticketCost;
		maxTickets = _maxTickets;
		showDate = _showDate;
		soldTickets = 0;
		isGreeter[msg.sender] = true;
	}


	function purchaseTicket() payable saleHasNotEnded() returns (bool) {
		if((soldTickets < totalTickets) && ( >= ticketCost)){
			buyers.push(msg.sender);
			newBuyer Buyer = Buyer(soldTickets);
			buyerInfo[msg.sender]=newBuyer;
			profits+=msg.value
			soldTickets+=1;
			return true;
		}
		return false;
	}

	function addGreeter(address _greeter) isCreator() {
		isGreeter[_greeter] = true;
	}

	function admit(address _atGate) isGreeter(){
		hasEntered[_atGate] = true;
	}

	function refund() saleHasNotEnded() public returns (bool) {
		bool good = true;
		if (good) {
			good = msg.sender.send(ticketCost);
		}
		EtherRefunded(msg.sender, good); // event
		return good;
	}

	function withdrawFunds() isCreator() public returns (uint) {
		return profits;
	}

	function withdrawFunds() saleHasEnded() isCreator() public returns (bool) {
		return creator.send(currentBalence);
		selfdestruct(creator);
	}

	function() payable {}

}
