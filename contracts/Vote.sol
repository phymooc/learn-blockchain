// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Vote {

  // event voted
  event Voted(address indexed voter, uint8 proposal);
  // store voted address
  mapping(address => bool) public voted;
  // store vote expire time
  uint256 public endTime;
  // store vote proposal
  uint256 public proposalA;
  uint256 public proposalB;
  uint256 public proposalC;

  // create contract with expire time
  constructor(uint256 _endTime) {
    endTime = _endTime;
  }
  // vote method
  function vote(uint8 _proposal) public {

    require(block.timestamp < endTime, 'Vote expired');
    require(_proposal >= 1 && _proposal <= 3, 'Invalid proposal');
    require(!voted[msg.sender], 'Already voted');

    // store voted address
    voted[msg.sender] = true;
    if (_proposal == 1) {
      proposalA++;
    } else if (_proposal == 2) {
      proposalB++;
    } else if (_proposal == 3){
      proposalC++;
    }
    // emit Voted event
    emit Voted(msg.sender, _proposal);
  }

  function votes() public view returns (uint256, uint256, uint256) {
    // return proposalA, proposalB, proposalC vote account
    return (proposalA, proposalB, proposalC);
  }
}
