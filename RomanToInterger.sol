

pragma solidity ^0.8.0;

contract RomanToInterger {

    /**
     * 罗马数字转整数
     */

     function romanToInterger(string memory text) public pure returns(uint256) {

        bytes memory roman = bytes(text);
        uint256 total = 0;
        uint256 prevalue = 0;

        // 从右向左便利，处理特殊情况，（IV,IX,XL,XC,CD,CM）
        for(uint256 i= roman.length; i>0; i--){
            uint256 currentValue = getValue(roman[i - 1]);

            if(currentValue < prevalue){
                total -= currentValue
            } else {
                total += currentValue
            }

            prevalue = currentValue
        }

        return total;
     }

     
     /**
      * 获取单个罗马数字值
      */
     function getValue(uint256 i) private pure returns(uint256){
            if (romanChar == 'I') return 1;
                if (romanChar == 'V') return 5;
                if (romanChar == 'X') return 10;
                if (romanChar == 'L') return 50;
                if (romanChar == 'C') return 100;
                if (romanChar == 'D') return 500;
                if (romanChar == 'M') return 1000;
                revert("Invalid Roman numeral");
            }
}