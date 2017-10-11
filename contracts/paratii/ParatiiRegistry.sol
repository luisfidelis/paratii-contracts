pragma solidity ^0.4.13;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @dev the ParatiiRegistry contains settings and addresses of contracts for the Partii Ecosystem
 *
 **/
contract ParatiiRegistry is Ownable  {

  mapping (bytes32=>address) public contracts;
  mapping (bytes32=>uint) public numbers;
  mapping (bytes32=>string) public strings;

  event LogRegisterContract(string _name, address _address);
  event LogUnregisterContract(string _name);
  event LogRegisterUint(string _name, uint _number);
  event LogUnregisterUint(string _name);
  event LogRegisterString(string _name, string _string);
  event LogUnregisterString(string _name);

  function ParatiiRegistry() {
      owner = msg.sender;
  }

  function registerContract(string _name, address _address) public onlyOwner {
    contracts[sha3(_name)] = _address;
    LogRegisterContract(_name, _address);
  }

  function unregisterContract(string _name) public onlyOwner {
    delete contracts[sha3(_name)];
    LogUnregisterContract(_name);
  }

  function getContract(string _name) public constant returns(address) {
    return contracts[sha3(_name)];
  }

  function registerUint(string _name, uint _number) public onlyOwner {
    numbers[sha3(_name)] = _number;
    LogRegisterUint(_name, _number);
  }

  function unregisterUint(string _name) public onlyOwner {
    delete numbers[sha3(_name)];
    LogUnregisterUint(_name);
  }

  function getUint(string _name) public constant returns(uint) {
    return numbers[sha3(_name)];
  }

  function registerString(string _name, string _string) public onlyOwner {
    strings[sha3(_name)] = _string;
    LogRegisterString(_name, _string);
  }

  function unregisterString(string _name) public onlyOwner {
    delete strings[sha3(_name)];
    LogUnregisterString(_name);
  }

  function getString(string _name) public constant returns(string) {
    return strings[sha3(_name)];
  }
}
