# solidity-classrom-reserver

Blockchain technológiák és alkalmazások tárgyhoz tartozó házifeladat megoldásom.

### Futtatás

http://remix.ethereum.org/ 
Compile, Run :)

### Feladatkiírás

# Problem statement
Implement a smart contract for classroom reservations.
*	The contract should have exactly one owner (the school's management).
*	The owner can approve access for teachers of the school.
*	Teachers who have been approved can reserve the classroom for time slots of 30 minutes.
*	Teachers can also drop their reservations.
*	Anyone can check whether a teacher has access to the room at any given time.
# Example scenario
Alice is an administrator at BME. She creates an instance of this contract to manage access to one of the rooms on campus.

Professor Bob reserves the time slot between 10:00am and 11:00am. However, Bob realizes that he reserved the wrong time, so he drops this reservation and makes a new one for the time slot between 02:00pm and 03:00pm.

At 02:00pm, Bob scans the QR code of his Ethereum address at the QR code scanner next to the room. The university's reservation system verifies that Bob has reserved the room and proceeds to open the door for him.
# Contract interface
*	constructor: function ClassroomReservations()
    *	The creator of the contract (msg.sender) is the owner.
*	register: function registerTeacher(address teacher)
    *	Registers teacher as a teacher of the school.
    *	Only teachers can reserve classrooms.
*	reserve: function reserve(uint24 slotId)
    *	Reserve the slotId'th time slot since contract creation. For example, if the contract was created today at 00:00, then slot number                            16 would be the one from 07:30 to 08:00, while slot number 64 would be the same time slot on the next day.
    *	This transaction succeeds only if the time slot has not yet been reserved.
*	drop: function dropReservation(uint24 slotId)
    *	Drop's the sender's reservation for the slodId'th time slot.
    *	Succeeds only if the reservation originally belonged to the sender of the transaction (msg.sender).
*	validate: function validate(address teacher) view returns (bool)
    *	Returns true if teacher is entitled to use the classroom at the time of the validation.
    * Can be called by anyone. (In our use case, this will be called by the university's reservation system.)
  
# Contract skeleton
```Solidity
pragma solidity ^0.4.21;

contract ClassroomReservations {

    // <contract_variables>

    // </contract_variables>

    function ClassroomReservations() public {
        // TODO
    }

    function registerTeacher(address teacher) public {
        // TODO
    }

    function reserve(uint24 slotId) public {
        // TODO
    }

    function dropReservation(uint24 slotId) public {
        // TODO
    }

    function validate(address teacher) public view returns (bool) {
        // TODO
    }

}
```
