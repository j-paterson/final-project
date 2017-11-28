# Etiquette - Blockchain for Developers Final Project

## Overview
Etiquette's entomology begins in 1740, from the French word étiquette, meaning a little piece of paper, attached to something in order to mark it - a ticket.

This DApp ticket system will provide a way to mark certain users for admittance into an event. This system will cut out the middle man fees (looking at you, Ticketmaster) and permits only a certain number of tickets per person to prevent scalping.

## Functionality and Architecture
* Reserve a spot for the buyer from a limited number of seats in different categories designated by the seller
* Prevent buyers from purchasing an immense amount of tickets  for scapling through identity verification
* Provide a method of ticket verification at the door - based on wallet ID
* Deposit all sales into the seller's account after the show date and refund period are past.

This app uses Solidity for coding contracts, Truffle for test driven development, web3.js, IPFS and React.

A React Site and IPFS based database (Orbit-DB) will allow people to list their show publicly along with all other shows stored in Etiquette.

## Benefits

Anyone who regularly attends live music has probably run into the absurb fees of the online ticketing platforms before. Obscure and unjustified 'service', 'facility', 'processing' and laughably, 'convenience' charges can add up to an additional %30 on top of the original ticket price.

This DApp will make it possible for venues and bands to handle their own ticket sales with the true price directly listed.
