// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GradeBook {
    
    address public owner;

    
    struct Grade {
        string studentName;
        string subject;
        uint8 grade;
    }

    
    Grade[] public grades;

   
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    
    constructor() {
        owner = msg.sender;
    }

    
    function addGrade(string memory _studentName, string memory _subject, uint8 _grade) public onlyOwner {
        grades.push(Grade(_studentName, _subject, _grade));
    }

    
    function updateGrade(string memory _studentName, string memory _subject, uint8 _grade) public onlyOwner {
        for (uint i = 0; i < grades.length; i++) {
            if (keccak256(abi.encodePacked(grades[i].studentName)) == keccak256(abi.encodePacked(_studentName)) &&
                keccak256(abi.encodePacked(grades[i].subject)) == keccak256(abi.encodePacked(_subject))) {
                grades[i].grade = _grade;
                return;
            }
        }
    }

   
    function getGrade(string memory _studentName, string memory _subject) public view returns (uint8) {
        for (uint i = 0; i < grades.length; i++) {
            if (keccak256(abi.encodePacked(grades[i].studentName)) == keccak256(abi.encodePacked(_studentName)) &&
                keccak256(abi.encodePacked(grades[i].subject)) == keccak256(abi.encodePacked(_subject))) {
                return grades[i].grade;
            }
        }
        revert("Grade not found");
    }

   
    function averageGrade(string memory _subject) public view returns (uint8) {
        uint total = 0;
        uint count = 0;
        for (uint i = 0; i < grades.length; i++) {
            if (keccak256(abi.encodePacked(grades[i].subject)) == keccak256(abi.encodePacked(_subject))) {
                total += grades[i].grade;
                count++;
            }
        }
        require(count > 0, "No grades found for this subject");
        return uint8(total / count);
    }
}
