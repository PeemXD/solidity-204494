//SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract Twitter{

    uint16 constant MAX_TWEET_LENGTH = 280;

    struct Tweet {
        address author;
        string content;
        uint timestamp;
        uint likes;
    }

    mapping (address => Tweet[]) public tweets;

    function createTweet(string memory text) public {
        // 1 chracter == 1 byte
        require(getStringLength(text) <= MAX_TWEET_LENGTH, string(abi.encodePacked("string length must less than equal ", uintToStr(MAX_TWEET_LENGTH))));

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: text,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

    }

    // function getTweet(address friend) {}
    function getAllTweets(address _owner) public view returns(Tweet[] memory allTweet){
        return tweets[_owner];
    }

    function getStringLength(string memory str) public pure returns (uint) {
        return bytes(str).length;
    }

    function uintToStr(uint _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        j = _i;  // Reset j to the original value
        while (j != 0) {
            k = k-1;
            bstr[k] = bytes1(uint8(48 + j % 10)); // Cast to bytes1
            j /= 10;
        }
        return string(bstr);
    }
}