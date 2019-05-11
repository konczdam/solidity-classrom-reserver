pragma solidity ^0.5.0;

contract ClassroomReservations {

    address owner;
    uint creationTime;
    mapping(address => bool) teachers;
    mapping(uint24 => address) reservations;
 
    constructor() public {
        owner = msg.sender;
        creationTime = now;
    }

    function registerTeacher(address teacher) public forOnlyOwner {
        teachers[teacher] = true;
    }

    function reserve(uint24 slotId) public forOnlyTeachers {
        require(reservations[slotId] == address(0x0));
        reservations[slotId] = msg.sender;
        
    }

    function dropReservation(uint24 slotId) public forOnlyTeachers {
        require(reservations[slotId] == msg.sender);
        reservations[slotId] = address(0x0);
    }

    function validate(address teacher) public view returns (bool) {
        return reservations[getSlotIdOfNow()] == teacher;
    }
    
     modifier forOnlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    modifier forOnlyTeachers {
        require(teachers[msg.sender]);
        _;
    }
    
    function getCreationTime() public view returns (uint){
        return creationTime;
    }
    
    function getSlotIdOfNow() public view returns(uint24){
        return uint24(((now - creationTime) / 1800) + 1) ;
    }
}