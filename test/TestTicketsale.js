'use strict';

/* Add the dependencies you're testing */
const Ticketsale = artifacts.require("./Ticketsale.sol");
// YOUR CODE HERE

contract('TestTicketsale', function(accounts) {
	/* Define your constant variables and instantiate constantly changing
	 * ones
	 */

	const remainingTickets = 10;
	const ticketCost = 1;
	const maxTickets = 1;
	const showDate = 2017;
	const owner = accounts[0];

	let ticketsale;
	// YOUR CODE HERE

	/* Do something before every `describe` method */
	beforeEach(async function() {
		// YOUR CODE HERE
		let c = await Ticketsale.new(
			remainingTickets,
			ticketCost,
			maxTickets,
			showDate,
			{from: owner}
			);
		ticketsale = c;
	});

	describe('Initialization', function() {
		it("TestInit", async function() {
			// YOUR CODE HERE
			let _creator = await ticketsale.creator.call();
			let _remainingTickets = await ticketsale.remainingTickets.call();
			let _ticketCost = await ticketsale.ticketCost.call();
			let _maxTickets = await ticketsale.maxTickets.call();
			let _saleOpens = await ticketsale.saleOpens.call();
			let _showDate = await ticketsale.showDate.call();
			assert.equal(owner, _creator.valueOf(), "no creator");
			assert.equal(10, _remainingTickets.valueOf(), "initial raise should be 10");
			assert.equal(1, _ticketCost.valueOf(), "ticket cost should be 1")
			assert.equal(1, _maxTickets.valueOf(), "users should be able to buy at most 1 ticket each")
			//assert.isAtMost(_showDate.valueOf(), _saleOpens.valueOf(), "ending time should be more than startingTime")
		});
	});
});
