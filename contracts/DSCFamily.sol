pragma solidity ^0.5.6;

import "./klaytn-contracts/token/KIP17/IKIP17Enumerable.sol";
import "./klaytn-contracts/ownership/Ownable.sol";
import "./klaytn-contracts/math/SafeMath.sol";

contract DSCFamily is Ownable {
    using SafeMath for uint256;

    struct Info {
        address owner;
        string data;
    }
    Info[] public infos;

    function add(string calldata data) external returns (uint256 id) {
        id = infos.length;
        infos.push(Info({
            owner: msg.sender,
            data: data
        }));
    }

    function update(uint256 id, string calldata data) external {
        require(infos[id].owner == msg.sender);
        infos[id].data = data;
    }

    function remove(uint256 id) external {
        require(infos[id].owner == msg.sender);
        delete infos[id];
    }
}
