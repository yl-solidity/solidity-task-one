
// ✅ 创建一个名为Voting的合约，包含以下功能：
// 一个mapping来存储候选人的得票数
// 一个vote函数，允许用户投票给某个候选人
// 一个getVotes函数，返回某个候选人的得票数
// 一个resetVotes函数，重置所有候选人的得票数

pragram solidity ^0.8.0;

contract Voting {
    // mapping 存储候选人的得票数
    mapping(string => uint256) private candidateVotes;

    // 存储所有候选人的数组，用于重置
    string[] private candidateList;

    // 事件：投票成功时触发
    event Voted(address indexed voter, string candidate, uint256     newVoteCount);

    // 事件：重置投票时触发
    event VotesReset(address indexed resetter, uint256 timestamp);

    /**
     * 投票给候选人
     */
     function vote(string memory candidate) public {

        require(bytes(candidate).length > 0, "Candidate name cannote be empty");

        // 如果第一次给这个候选人投票
        if(candidateVotes[canidate] === 0 && !isCandidateInList(candidate)) {
            candidateList.push(candidate)
        }

        // 增加票数
        candidateVotes[candidate]++;

        // 触发事件
        emit Voted(msg.sender, candidate, candidateVotes[candidate]);
     }

     /**
      * 获取候选人的票数
      */
      getVotes(string memory candidate) public view returns (uint256) {
        return candidateVotes[candidate];
      }

      /**
        * 重置所有候选人的票次数
       */
       resetVotes() public {
        // 遍历所有候选人的票数并修改为0
        for(uint256 i=0; i< candidateList.length; i++) {
            candidateVotes[candidate[i]] = 0;
        }

        // 触发事件
        emit VotesReset(msg.sender, block.timestamp);
       }

       /**
        * 获取所有候选人列表
        */
        getAllCandidates() public view returns (string[] memory) {
            return canlidateList;
        }
        /**
          *检查候选人是否已经在列表中
         */
         isCandidateInList(string memory canlidate) private view returns (bool) {
            for(uint256 i=0; i< canlidateList.length; i++){
                if(keccak256(bytes(canlidateList[i])) == keccak256(bytes(canlidate))){
                    return true;
                }
            }
            return false;
         }
}

