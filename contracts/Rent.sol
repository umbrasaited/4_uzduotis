pragma solidity ^0.5.0;

contract Rent {
	address[16] public renters;
	
	function rent(uint itemId) public returns (uint) {
		require(itemId >= 0 && itemId <= 15);

		renters[itemId] = msg.sender;

		return itemId;
	}
	
	
	function getRenters() public view returns (address[16] memory) {
		return renters;
	}
}