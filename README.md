Real Estate Transaction
Problem: Alice wants to buy a house from Bob. They agree on a price, but they want to make sure the transaction is secure and transparent. How can they use a smart contract to facilitate this transaction. 
Solution: Alice and Bob can use a smart contract to handle the transaction. The smart contract could be set up to transfer the ownership of the house from Bob to Alice once Alice sends the agreed amount to the smart contract. This ensures that both parties fulfill their obligations, and the transaction is transparent and verifiable on the blockchain 
*
*
*
*
pragma solidity >=0.4.22 <0.9.0;: This line specifies the compiler version to be used for compiling this smart contract. It says that the contract can be compiled with a Solidity compiler version greater than or equal to 0.4.22 but less than 0.9.0.
contract RealEstate {: This line declares a new contract named RealEstate. A contract in Solidity is similar to a class in object-oriented programming languages.






address payable public seller;: This line declares a public state variable seller of type address payable. This variable will hold the Ethereum address of the seller. The payable keyword means that this address can receive Ether (the Ethereum cryptocurrency).
address public buyer;: This line declares a public state variable buyer of type address. This variable will hold the Ethereum address of the buyer.
uint public price;: This line declares a public state variable price of type uint (unsigned integer). This variable will hold the price of the house.
constructor(uint _price) public {: This is the constructor of the contract, which is called once when the contract is deployed. It takes one argument, _price, which is the price of the house.
seller = msg.sender;: This line sets the seller to the address that deploys the contract (i.e., the sender of the transaction that creates the contract).
price = _price;: This line sets the price to the value passed to the constructor.
function buyHouse() public payable {: This is a public function that allows someone to buy the house. The payable keyword means that this function can receive Ether.
require(msg.value == price, "Please pay the full price");: This line checks that the amount of Ether sent with the transaction (msg.value) is equal to the price. If not, it reverts the transaction and the error message "Please pay the full price" is returned.
require(buyer == address(0), "This house has already been sold");: This line checks that the buyer is still the zero address (i.e., no one has bought the house yet). If not, it reverts the transaction and the error message "This house has already been sold" is returned.
buyer = msg.sender;: This line sets the buyer to the address that called the buyHouse function (i.e., the sender of the transaction).
seller.transfer(msg.value);: This line sends the Ether received with the transaction to the seller.
