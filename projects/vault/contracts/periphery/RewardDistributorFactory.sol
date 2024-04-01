// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IRewardDistributor} from "../interfaces/IRewardDistributor.sol";
import {IRewardDistributorFactory} from "../interfaces/IRewardDistributorFactory.sol";

import {BeaconProxy} from "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";
import {AccessManagedUpgradeable} from "@openzeppelin/contracts-upgradeable/access/manager/AccessManagedUpgradeable.sol";

contract RewardDistributorFactory is IRewardDistributorFactory, AccessManagedUpgradeable {
    Parameters internal _parameters;
    address public beacon;

    event NewRewardDistributor(address indexed proxy, Parameters param);

    function inittialize(address _beacon, address _auth) external initializer {
        beacon = _beacon;
        __AccessManaged_init(_auth);
    }

    function parameters() external view override returns (Parameters memory) {
        return _parameters;
    }

    function deploy(Parameters calldata p) external restricted returns (address proxy) {
        _parameters = p;
        BeaconProxy beaconProxy = new BeaconProxy{salt: keccak256(abi.encode(
            p.rewardToken, 
            block.timestamp
            ))}(beacon, bytes(""));
        proxy = address(beaconProxy);
        IRewardDistributor(proxy).initialize();
        delete _parameters;
        emit NewRewardDistributor(proxy, p);
    }
}
