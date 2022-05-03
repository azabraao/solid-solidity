// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Keyboards {

  enum KeyboardKind { 
    SixtyPercent, 
    SeventyFivePercent,
    EightyPercent, 
    Iso105 
  }

  struct Keyboard {
    KeyboardKind kind; 
    // ABS = false, PBT = true
    bool isPBT;
    // tailwind filters to layer over
    string filter;
    // user who created it! 
    address owner;
  }



  Keyboard[] public createdKeyboards;


  function getKeyboards() view public returns(Keyboard[] memory) {
    return createdKeyboards;
  }

  function create(
    KeyboardKind _kind,
    bool _isPBT,
    string calldata _filter
  ) external {
    Keyboard memory newKeyboard = Keyboard({
      kind: _kind,
      isPBT: _isPBT,
      filter: _filter,
      owner: msg.sender // In any Solidity function, msg.sender is always set to the address that called the function.
    });

    createdKeyboards.push(newKeyboard);
  }

  function tip(uint256 _index) external payable  {
    address payable owner = payable(createdKeyboards[_index].owner);
    owner.transfer(msg.value);
  }
}
