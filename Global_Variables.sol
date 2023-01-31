//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GetBalance {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function viewMessage() public view returns (address) {
        return msg.sender;
        //This will give us the address of the one who invoked this smart contract.
    }

    function viewBlock() public view returns (uint, uint) {
        return (block.timestamp, block.number);
    }

    function txOrigin() public view returns (address) {
        return tx.origin;
    }

    function viewGas() public view returns (uint) {
        return gasleft();
    }

}
