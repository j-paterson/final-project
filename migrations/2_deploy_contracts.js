var Ticketsale = artifacts.require("./Ticketsale.sol");
var Ticket = artifacts.require("./Ticket.sol");

module.exports = function(deployer) {
	deployer.deploy(Ticketsale);
	deployer.deploy(Ticket);
};
