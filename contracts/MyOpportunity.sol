//SPDX-License-Identifier: Unlicense
pragma solidity 0.5.11;

import "./interfaces/IOpportunity.sol";
import "./libraries/Initializable.sol";
import "./interfaces/IStorage.sol";


// Remove hardhat/console.sol for production
import "hardhat/console.sol";


contract MyOpportunity is IOpportunity, Initializable {

  bytes32 internal constant ADMIN_CONTRACT = keccak256("AdminContract");
  bytes32 internal constant OPPORTUNITY_MANAGER_CONTRACT = keccak256("RAYv3Contract");
  
  IStorage public rayStorage;

  // map principal tokens to contracts to call
  //  -> not in storage since this unique to MyOpportunity
  mapping(address => address) public markets;

  // NOTE: Mapping can be changed to a struct or any other data structure needed
  // Ex:
  // 
  // struct MyOpportunityMarket {
  //   address otherAddress;
  //   uint32 usefulValue;
  //   int8 decimals;
  // }
  // mapping(address => MyOpportunityMarket) public markets;

    /*************** MODIFIER DECLARATIONS **************/


  /// @notice  Checks the caller is our Admin contract
  modifier onlyAdmin() {
      require(
          msg.sender == rayStorage.getContractAddress(ADMIN_CONTRACT),
          "#MyOpportunity onlyAdmin Modifier: Only Admin can call this"
      );

      _;
  }


  /// @notice  Checks the caller is our OpportunityManager contract
  modifier onlyOpportunityManager() {
      require(
          msg.sender == rayStorage.getContractAddress(OPPORTUNITY_MANAGER_CONTRACT),
          "#MyOpportunity onlyOpportunityManager Modifier: Only OpportunityManager can call this"
      );

      _;
  }

  /// @notice  Initialize Opportunity
  ///
  /// @param   storage_contract - address of the storage contract
  /// @param   principalToken - address array of the principal token
  /// @param   otherToken - address array of the other token
  function initialize(
    address storage_contract, 
    address[] principalToken, 
    address[] otherToken
    // <add any parameters neeeded>
  ) public initializer {
    rayStorage = IStorage(storage_contract);
    _addPrincipalTokens(principalToken, otherToken);
  }

  /// @notice  Fallback function to receive Ether
  ///
  /// @dev     Required to receive Ether from MyOpportunity upon withdrawal
  function() external payable {  }

  /// @notice  Supply assets to the underlying Opportunity
  ///
  /// @param   token - address of the token to supply
  ///                           case of ETH
  /// @param   amount - amount in the smallest unit of the token to supply
  /// @param   isERC20 - boolean if the token follows the ERC20 standard
  function supply(address token, uint amount, bool isERC20) external onlyOpportunityManager payable {

  }


  /// @notice  Withdraw assets to the underlying Opportunity
  ///
  /// @param   token - address of the token to withdraw
  ///                           case of ETH
  /// @param   beneficiary - address to send the token too
  /// @param   amount - amount in the smallest unit of the token to supply
  /// @param   isERC20 - boolean if the token follows the ERC20 standard
  function withdraw(address token, address beneficiary, uint amount, bool isERC20) external onlyOpportunityManager {

  }


  /// @notice  The amount supplied + yield generated in the underlyng Opporutnity
  ///
  /// @param   token - address of the token to get the balance of
  function getBalance(address token) external returns (uint){
    
  }


  /** ----------------- ONLY ADMIN MUTATORS ----------------- **/
  /// @notice  Add support for a coin
  ///
  /// @dev     This is configured in-contract since it's not common across Opportunities
  ///
  /// @param   principalTokens - The coin contract addresses
  /// @param   otherContracts - The other contracts that map to each coin
  function addPrincipalTokens(
    address[] memory principalTokens,
    address[] memory otherContracts
    // <add any parameters neeeded>
  )
    public // not using external b/c use memory to pass in array
    onlyAdmin
  {

    _addPrincipalTokens(principalTokens, otherContracts);

  }

  /*************** INTERNAL FUNCTIONS **************/

  /// @notice  Used to add coins support to this Opportunities configuration
  ///
  /// @dev     Internal version so we can call from the constructor and Admin Contract
  ///
  /// @param   principalTokens - The coin contract addresses
  /// @param   otherContracts - The other contracts that map to each coin
  function _addPrincipalTokens(
    address[] memory principalTokens,
    address[] memory otherContracts
    // <add any parameters neeeded>
  )
    internal
  {

    for (uint i = 0; i < principalTokens.length; i++) {

      markets[principalTokens[i]] = otherContracts[i];

    }

  }
}
