// SPDX-License-Identifier: MIT

// Smart contract to hold data
pragma solidity ^0.8.0;
contract TargetContract {
    uint public data;  // variable to store a value

    function setData(uint _data) public {
        data = _data;  // Function to update data
    }
}

// Smart contract to interact with TargetContract
contract CallerContract {
    address public targetContractAddress;  // TargetContract Address

    // Constructor to set the TargetContract address
    constructor(address _targetContractAddress) {
        targetContractAddress = _targetContractAddress;
    }

    // Function to update data in TargetContract via delegate call
    function updateData(uint newData) public {
        (bool success, ) = targetContractAddress.delegatecall(
            abi.encodeWithSignature("setData(uint256)", newData)
        );
        // Ensure delegate call was successful
        require(success, "Delegate call failed");  
    }
}