pragma solidity ^0.5.0;

//Functions for retrieving min and Max in 51 length array (requestQ)
//Taken partly from: https://github.com/modular-network/ethereum-libraries-array-utils/blob/master/contracts/Array256Lib.sol

library Utilities {
    /**
    * @dev Returns the minimum value in an array.
    * The zero position here is ignored. It's because 
    * there's no null in solidity and we map each address 
    * to an index in this array. So when we get 51 parties, 
    * and one person is kicked out of the top 50, we 
    * assign them a 0, and when you get mined and pulled 
    * out of the top 50, also a 0. So then lot's of parties 
    * will have zero as the index so we made the array run 
    * from 1-51 with zero as nothing.
    */
    function getMax(uint256[51] memory data) internal pure returns (uint256 max, uint256 maxIndex) {
        max = data[1];
        for (uint256 i = 1; i < data.length; i++) {
            if (data[i] > max) {
                max = data[i];
                maxIndex = i;
            }
        }
    }

    /**
    * @dev Returns the minimum value in an array.
    */
    function getMin(uint256[51] memory data) internal pure returns (uint256 min, uint256 minIndex) {
        minIndex = data.length - 1;
        min = data[minIndex];
        for (uint256 i = data.length - 1; i > 0; i--) {
            if (data[i] < min) {
                min = data[i];
                minIndex = i;
            }
        }
    }

    function getMax5(uint256[51] memory data) internal pure returns (uint256[5] memory max, uint256[5] memory maxIndex) {
        max = [data[1],data[2],data[3],data[4],data[5]];
        maxIndex = [1,2,3,4,5];
        for (uint256 i = 1; i < data.length; i++) {
            for(uint256 j=0;j<5,j++){
                if (data[i] > max[j]) {
                    max[j] = data[i];
                    maxIndex[j] = i;
                }
            }
        }
    }
}
