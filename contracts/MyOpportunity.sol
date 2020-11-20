//SPDX-License-Identifier: Unlicense
pragma solidity ^0.5.11;

import "./interfaces/IOpportunity.sol";
import "./libraries/Initializable.sol";


// Remove hardhat/console.sol for production
import "hardhat/console.sol";


contract MyOpportunity is IOpportunity, Initializable {
  /// @notice  Initialize Opportunity
  ///
  /// @param   principalToken - address of the token to supply, WETH in the
  function initialize(address principalToken) external {

  }

  /// @notice  Supply assets to the underlying Opportunity
  ///
  /// @param   tokenAddress - address of the token to supply, WETH in the
  ///                           case of ETH
  /// @param   amount - amount in the smallest unit of the token to supply
  /// @param   isERC20 - boolean if the token follows the ERC20 standard
  function supply(address tokenAddress, uint amount, bool isERC20) external payable {

  }


  /// @notice  Withdraw assets to the underlying Opportunity
  ///
  /// @param   tokenAddress - address of the token to withdraw, WETH in the
  ///                           case of ETH
  /// @param   beneficiary - address to send the token too
  /// @param   amount - amount in the smallest unit of the token to supply
  /// @param   isERC20 - boolean if the token follows the ERC20 standard
  function withdraw(address tokenAddress, address beneficiary, uint amount, bool isERC20) external{

  }


  /// @notice  The amount supplied + yield generated in the underlyng Opporutnity
  ///
  /// @param   tokenAddress - address of the token to get the balance of
  function getBalance(address tokenAddress) external returns (uint){
    
  }
}
