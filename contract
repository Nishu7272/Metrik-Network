// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Metrik is ERC20, ERC20Burnable, Ownable {

    constructor() ERC20("Metrik", "MTN") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

     // freeze the assets of account
  function freezeAccount (address target, bool freeze) public onlyOwner {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
  }
  // transfer and freeze the assets
  
  function transferAndFreeze (address recipient, uint256 amount) public onlyOwner {
    
    _transfer(_msgSender(), recipient, amount);
    frozenAccount[recipient] = true;
    emit FrozenFunds(recipient, true);
  }
  

}
