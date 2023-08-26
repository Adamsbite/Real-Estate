pragma solidity >=0.4.22 <0.9.0;

contract RealEstate {
    address payable public seller;
    address public buyer;
    uint public price;

    constructor(uint _price) public {
        seller = msg.sender;
        price = _price;
    }

    function buyHouse() public payable {
        require(msg.value == price, "Please pay the full price");
        require(buyer == address(0), "This house has already been sold");

        buyer = msg.sender;
        seller.transfer(msg.value);
    }
}
