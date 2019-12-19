pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Rent.sol";

contract TestRental {
	Rent renting = Rent(DeployedAddresses.Rent());
 
	function testUserRentsItem() public {
		uint returnedId = renting.rent(expectedItemId);

		Assert.equal(returnedId, expectedItemId, "Rent of the expected item should match what is returned.");
	}
	
	function testGetRenterAddressByItemId() public {
		address renter = renting.renters(expectedItemId);

		Assert.equal(renter, expectedRenter, "Owner of the expected item should be this contract");
	}
	
	function testGetRenterAddressByItemIdInArray() public {
 
		address[16] memory renters = renting.getRenters();

		Assert.equal(renters[expectedItemId], expectedRenter, "Owner of the expected item should be this contract");
	}

	uint expectedItemId = 8;

	address expectedRenter = address(this);

}