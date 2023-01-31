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

//this: refers to the contract itself.
//msg: this refers to how the contract execution begun, who forced the contract to start executing.
//block: this refers to the information about the block that the transaction being sent to this smart contract is included in.
//tx: this stands for transaction and gives us information about the transaction.

//msg.value: this is going to reference how much ethereum was sent to the function or to the smart contract from the transaction that came in.

//https://www.tutorialspoint.com/solidity/solidity_variables.htm

//https://www.evernote.com/shard/s417/sh/b7b255fb-4fca-7799-208e-d5272643115e/fef12b6d36fa6319cc2ee68b3464ce38
