pragma solidity ^0.5.2;

contract rskself {

     struct  PersonalRecord {
        uint currentBalance;
        bool recordExists;
    }

    mapping (bytes32 => PersonalRecord) public PersonalRecords;

    function getPersonalBalance (bytes32 userIrisScan) public view returns (uint) {
        require(PersonalRecords[userIrisScan].recordExists);
        return PersonalRecords[userIrisScan].currentBalance;
    }


    function setPersonalBalance (bytes32 userIrisScan, uint addMoney) public  {
        require(PersonalRecords[userIrisScan].recordExists);
        PersonalRecords[userIrisScan].currentBalance+=addMoney;
    }

    function initPersonalBalance (bytes32 userIrisScan, uint addMoney) public  {
        require(!PersonalRecords[userIrisScan].recordExists);
        PersonalRecords[userIrisScan].currentBalance=addMoney;
    }



}
