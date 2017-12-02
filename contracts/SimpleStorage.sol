pragma solidity ^0.4.18;

contract SimpleStorage {
    /* Define variable status of the type string */
    string status;
    
    /* This runs when the contract is executed */
    function SimpleStorage(string _status) public {
        status = _status;
    }

    /* Get status */
    function getStatus() constant public returns (string) {
        return status;
    }

    /* Set status */
    function setStatus(string _status) public returns (string) {
        status = _status;
        return status;
    }
}

