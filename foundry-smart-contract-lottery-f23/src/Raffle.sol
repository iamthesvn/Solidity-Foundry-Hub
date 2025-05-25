// SPDX-License_Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title A sample Raffle Contract
 * @author Thesvn
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2
 */
contract Raffle {
    error Raffle__NotEnoughEthSent();

    uint256 private immutable i_entranceFee;
    // @dev Duration of the lottery in seconds
    uint256 private immutable i_interval;
    address private immutable i_vrfCoordinator;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /**Events */
    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval, address vrf Coordinator) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        i_vrfCoordinator = vrfCoordinator
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        // require(msg.value>= i_entranceFee, "Not enough ETH sent!")
        if (msg.value < i_entranceFee) {
            revert NotEhoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    //1. Get a random number
    //2. Use the random number to pick a player
    //3. Be automatically called

    function pickWinner() external {
        // check to see if enough time has passed
        if ((block.timestamp - s_lastTimstamp) < i_interval) {
            revert;
        }
        //1. Request the RNG
        //2. Get the random number
         uint256 requestId = i_vrfCoordinator.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
    }

    /** Getter Function */

    function getEntranceFee() external view returns (unint256) {
        return i_entranceFee;
    }
}
