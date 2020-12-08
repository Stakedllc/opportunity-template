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

    /*************** MODIFIER DECLARATIONS **************/


  /// @notice  Checks the caller is our Governance Wallet
  ///
  /// @dev     To be removed once fallbacks are
  modifier onlyGovernance() {
      require(
          msg.sender == rayStorage.getGovernanceWallet(),
          "#MyOpportunity onlyGovernance Modifier: Only Governance can call this"
      );

      _;
  }


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
  /// @param   principalToken - address of the principal token
  function initialize(address storage_contract, address principalToken) public initializer {
    rayStorage = IStorage(storage_contract);
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
}
