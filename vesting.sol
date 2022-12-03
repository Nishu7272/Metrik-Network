//METRIK VESTING SMART CONTRACT

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";


contract Vesting {
        
    using SafeERC20 for IERC20;
    IERC20 public token;
    address public receiver;
    uint256 public expiry;
    bool public locked = false;
    bool public claimed = false;
    

    constructor (address _token) {
        token = IERC20(_token);
        receiver = msg.sender;
        expiry = block.timestamp+300;
    }

    function balance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }
 

     function lock() external {
         require(!locked, "We have already locked tokens.");
         token.balanceOf(address(this));

          locked = true;
     }

    function withdraw() external {
        require(locked, "Funds have not been locked");
        require(block.timestamp > expiry, "Tokens have not been unlocked");
        require(!claimed, "Tokens have already been claimed");
        claimed = true;
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    function getTime() external view returns (uint256) {
        return block.timestamp;
    }
}
