// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
// library
library ManageArray{
    // sort function
    function sort(uint[] memory arr) public pure returns (uint[] memory) {
        uint arrayLength = arr.length;
        for (uint i = 0; i < arrayLength - 1; i++) {
            for (uint j = 0; j < arrayLength - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
                }
            }
        }
        return arr;
    }

    //function to remove duplicates
    function removeDuplicates(uint[] memory arr) internal pure returns (uint[] memory) {
        if (arr.length <= 1) {
            return arr;
        }

        uint[] memory uniqueArr = new uint[](arr.length);
        uint index = 0;

        for (uint i = 0; i < arr.length; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < index; j++) {
                if (arr[i] == uniqueArr[j]) {
                    isDuplicate = true;
                    break;
                }
            }

            if (!isDuplicate) {
                uniqueArr[index] = arr[i];
                index++;
            }
        }

        uint[] memory result = new uint[](index);
        for (uint i = 0; i < index; i++) {
            result[i] = uniqueArr[i];
        }

        return result;
    }

}

contract ArrayManipulate{
    using ManageArray for uint[];

    uint[] public arr;

    // Function to sort the array
    function sort() public {
        arr = arr.sort();
    }

    // Function to remove duplicates from the array
    function removeDuplicates() public {
        arr = arr.removeDuplicates();
    }
}