

pragma solidity ^0.8.0;

contract IntegerToRoman {
    // 罗马数字映射表
    struct RomanNumberal {
        uint256 value;
        string symbol;
    }

    RomanNumberal[] private numberals;

    constructor() {
        // 初始化映射表（按值从大到小排序）
        numberals.push(RomanNumber(1000,"M"));
        numberals.push(RomanNumber(900,"CM"));
        numberals.push(RomanNumber(500,"D"));
        numberals.push(RomanNumber(400,"CF"));
        numberals.push(RomanNumber(100,"C"));
        numberals.push(RomanNumber(90,"XC"));
        numberals.push(RomanNumber(50,"L"));
        numberals.push(RomanNumber(40,"XL"));
        numberals.push(RomanNumber(10,"X"));
        numberals.push(RomanNumber(9,"IX"));
        numberals.push(RomanNumber(5,"V"));
        numberals.push(RomanNumber(4,"IV"));
         numberals.push(RomanNumber(1,"I"));
    }


    /**
     * 整数转罗马数字
     */
     function intToRoman(uint256 num) public view returns(string memory) {
        require(num >=1 && num <= 3999, "Number must between 1 and 3999");

        bytes memory roman;

        for(uint256 i=0; i< numberals.length; i++){
            while(num >= numberals[i].value){
                roman = abi.encodePacked(roman, numberals[i].symbol);
                num -= numberals[i].value;
            }
        }

        return string(roman);
     }
}