// SPDX-License-Identifier: MIT
pragma solidity >=0.8.30;

/** 
 * @title Message
 * @author ErickFCS
 * @notice This is the project 1
 */ 
contract Message {
    string internal s_message;

    event Message_MessageUpdated(string message);

    function getMessage() external view returns (string memory message_) {
        message_ = s_message;
    }
    
    function setMessage(string calldata _message) external {
        s_message = _message;
        emit Message_MessageUpdated(_message);
    }

}