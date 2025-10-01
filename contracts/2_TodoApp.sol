// SPDX-License-Identifier: MIT
pragma solidity >=0.8.30;

contract TodoApp {
    enum IsCompleted {
        yes,
        no
    }

    struct Task {
        string description;
        IsCompleted isCompleted;
    }

    Task[] internal s_tasks;

    function addTask(Task calldata _task) external returns (uint16) {
        uint16 lastTaskIndex = uint16(s_tasks.length);
        s_tasks.push(_task);
        return lastTaskIndex;
    }

    function getTaskByIndex(uint16 _index) public view returns (Task memory) {
        return s_tasks[_index];
    }

    function getTaskByDesc(string calldata _desc) public view returns (Task memory) {
        bytes32 descHash = keccak256(abi.encodePacked(_desc));
        for (uint16 i = 0; i < s_tasks.length; ++i) 
        {
            if (descHash == keccak256(abi.encodePacked(s_tasks[i].description))){
                return s_tasks[i];
            }
        }
        revert("Task not found");
    }

    function getTasks() public view returns (Task[] memory) {
        return s_tasks;
    }

    function updateTask(uint16 _index, IsCompleted _isCompleted) external {
        s_tasks[_index].isCompleted = _isCompleted;
    }

    function deleteTask(uint16 _index) external {
        uint16 lastTaskIndex = uint16(s_tasks.length - 1);
        if (_index != lastTaskIndex) {
            s_tasks[_index] = s_tasks[lastTaskIndex];
        }
        s_tasks.pop();
    }

}
