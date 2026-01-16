
pragma solidity ^0.8.0;

contract ReverseString {

    /**
     * 反转字符串
     */
    function reverseString(string memory str) public pure returns (string memory) {
        // 将字符串转为字节数组
        bytes memory strBytes = bytes(str);
        bytes memory reversed = new bytes(strBytes.length);

        // 反转操作
        for(uint256 i=0; i<strBytes.length;i++){
            reversed[i] = strBytes[strBytes.length - 1 - i];
        }

        // 讲字节数组转回字符串

        return string(reversed);
    }
}