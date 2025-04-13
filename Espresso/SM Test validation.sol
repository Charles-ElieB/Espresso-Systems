// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EspressoTxValidator {
    address public owner;

    // Événement émis si l'action est validée
    event ActionValidated(address indexed user, string message);

    constructor() {
        owner = msg.sender;
    }

    /// @dev Simule une confirmation depuis Espresso
    function isConfirmedByEspresso(bytes32 txHash) public pure returns (bool) {
        return uint256(txHash) % 2 == 0; 
    }

    /// @dev Action sécurisée : exécutée uniquement si la transaction est confirmée
    function performAction(bytes32 txHash) external {
        require(isConfirmedByEspresso(txHash), "Not confirmed by Espresso");

        emit ActionValidated(msg.sender, "Transaction confirmed & action performed!");
    }
}
