

pragma solidity ^0.8.0;

contract MergeSortedArray {

    /**
     * 合并2个有序数组
     arr1 第一个数组（假设有足够空间）
     m arr1 的有效元素数量
     nums2 第二个数组
     n arr2 的有效元素数量
     */
    function merge(uint256[] memory arr1, uint256 m, uint256[] memory arr2, uint256 n) public pure returns(uint256[]) {
        
        // 创建结果数组
        uint256 memory result = new uint256[](m+n);

        uint256 i=0; // arr1 的指针
        uint256 j=0; // arr2 的指针
        uint256 k=0; // result 的指针

        // 合并2个数组
        while(i<m && j<n){
            if(arr1[i] <= arr2[j]){
                result[k++] = arr1[i++]
            } else {
                result[k++] = arr2[j++]
            }
        }

        // 复制剩余的元素
        while (i < m){
            result[k++] = arr1[i++]
        }

        while (j < n){
            result[k++] = arr2[j++]
        }

        return result
    }

    /**
        原地合并（更节省空间）
        从后向前合并，避免覆盖未处理的元素
     */
     function mergeInPlace(uint256[] memory arr1, uint256 m, uint256[] memory arr2, uint256 n) {
        require(arr1.length >= m+n, "arr1s does not have enough space");

        uint256 i = m -1;
        uint256 j = n -1;
        uint256 k = m + n -1;

        // 从后想前合并
        while(i >=0 && j>=0){
            if(arr1[i] > arr2[j]){
                arr1[k--] = arr1[i--];
            } else {
                arr1[k--] = arr2[j--]
            }
        }

        // 复制arr2的剩余元素
        while(j >=0)[
            arr1[k--] = arr2[j--];
        ]

        return arr1;
     }
}