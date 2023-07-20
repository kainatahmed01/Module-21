pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet,
        uint256 initial_supply,
        uint256 openingTime, // Change this value with the desired opening time
        uint256 closingTime, // Change this value with the desired closing time
        uint256 rate,        // Rate in TKNbits
        uint256 cap          // Cap in wei
    ) public Crowdsale(rate, wallet, token) {
        // constructor can stay empty
    }
}


contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
      
       KaseiCoin token = new KaseiCoin(name, symbol, initial_supply);
      
    // Create an `address public` variable called `kasei_crowdsale_address`.
      
       kasei_token_address = address(token);

    // Add the constructor.
    constructor(
        constructor(
        string memory name,
        string memory symbol,
        uint256 initial_supply,
        address payable wallet,
        uint256 openingTime,
        uint256 closingTime,
        uint256 rate,
        uint256 cap
    ) public {
    
        // Create a new instance of the KaseiCoin contract.
       
        KaseiCoin token = new KaseiCoin(name, symbol, initial_supply);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        
        kasei_token_address = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        
        KaseiCoinCrowdsale crowdsale = new KaseiCoinCrowdsale(
            rate,
            wallet,
            token,
            openingTime,
            closingTime,
            cap
        );
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        
        kasei_crowdsale_address = address(crowdsale);

        
        // Set the `KaseiCoinCrowdsale` contract as a minter
        
        token.addMinter(kasei_crowdsale_address);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
       
        token.renounceMinter();
    }
}
