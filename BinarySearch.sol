pragma solidity ^0.8.0;

contract BinarySearch {


    /**
     * 递归法二分查找
     */
     function binarySearch(uint256[] memory arr, uint256 target, uint256 left, uint256 right) public pure returns(int256){
        if(left > right){
            return -1; // 未找到
        }

        uint256 mid = left + (right - left) / 2;

        if(arr[mid] == target){
            return int256(mid);
        } else if(arr[mid] < target){
            return binarySearch(arr, target, mid+1, right);
        } else{
            return binarySearch(arr, target, left, mid-1);
        }
     }


     /**
      * 迭代法二分查找
      */
      function searchInsert(uint256[] memory arr, uint256 target) public pure returns(int256){
        uint256 left = 0;
        uint256 right = arr.length;

        while(left < right){
            uint256 mid = left + (right - left) / 2;
            
            if(arr[mid] == target){
                return mid;
            } else if(arr[mid] < target){
                left = mid + 1
            } else {
                right = mid
            }

            return left;
        }
      }
}