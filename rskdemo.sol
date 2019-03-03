pragma solidity ^0.5.2;

contract rskself {

     struct  PersonalRecord {
        uint currentBalance;
        uint numberApprovedCalls; // API calls - to avoid Metamask in running systems
        bool recordExists;
    }

    mapping (bytes32 => PersonalRecord) public PersonalRecords;

    function getPersonalBalance (bytes32 userIrisScan) public view returns (uint) {
        require(PersonalRecords[userIrisScan].recordExists);
        return PersonalRecords[userIrisScan].currentBalance;
    }


    function setPersonalBalance (bytes32 userIrisScan, uint addMoney) public  {
        require(PersonalRecords[userIrisScan].recordExists);
        require(PersonalRecords[userIrisScan].numberApprovedCalls>0);
        PersonalRecords[userIrisScan].numberApprovedCalls--; // need to check API calls
        PersonalRecords[userIrisScan].currentBalance+=addMoney;
    }

    function initPersonalBalance (bytes32 userIrisScan, uint addMoney, uint numberApprovedCalls) public  {
        require(!PersonalRecords[userIrisScan].recordExists);
        PersonalRecords[userIrisScan].recordExists=true;
        PersonalRecords[userIrisScan].numberApprovedCalls=numberApprovedCalls;
        PersonalRecords[userIrisScan].currentBalance=addMoney;
    }



}
