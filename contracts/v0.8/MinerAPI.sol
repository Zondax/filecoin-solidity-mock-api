// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.15;

import "./types/MinerTypes.sol";

/// @title Filecoin miner actor API for Solidity.
/// @author Zondax AG
/// @notice It is mock with specific scenarios based on the parameters used to call its methods. It is meant to serve as the first entry point, and be replaced seamlessly in the future by the real API implementation tath actually calls the filecoin actor.
/// @dev Most of function calls are currently implemented using some kind of struct for parameters and returns.
contract MinerAPI {
    string owner;
    bool isBeneficiarySet = false;
    CommonTypes.ActiveBeneficiary activeBeneficiary;
    mapping(CommonTypes.SectorSize => uint64) sectorSizesBytes;

    constructor(string memory _owner) {
        owner = _owner;

        sectorSizesBytes[CommonTypes.SectorSize._2KiB] = 2 << 10;
        sectorSizesBytes[CommonTypes.SectorSize._8MiB] = 8 << 20;
        sectorSizesBytes[CommonTypes.SectorSize._512MiB] = 512 << 20;
        sectorSizesBytes[CommonTypes.SectorSize._32GiB] = 32 << 30;
        sectorSizesBytes[CommonTypes.SectorSize._64GiB] = 2 * (32 << 30);
    }

    function mock_set_owner(string memory addr) public {
        require(bytes(owner).length == 0);
        owner = addr;
    }

    function get_owner()
        public
        view
        returns (MinerTypes.GetOwnerReturn memory)
    {
        require(bytes(owner).length != 0);

        return MinerTypes.GetOwnerReturn(owner);
    }

    function change_owner_address(string memory addr) public {
        owner = addr;
    }

    function is_controlling_address(
        MinerTypes.IsControllingAddressParam memory params
    ) public pure returns (MinerTypes.IsControllingAddressReturn memory) {
        return MinerTypes.IsControllingAddressReturn(false);
    }

    function get_sector_size()
        public
        view
        returns (MinerTypes.GetSectorSizeReturn memory params)
    {
        return
            MinerTypes.GetSectorSizeReturn(
                sectorSizesBytes[CommonTypes.SectorSize._8MiB]
            );
    }

    function get_available_balance()
        public
        pure
        returns (MinerTypes.GetAvailableBalanceReturn memory params)
    {
        return MinerTypes.GetAvailableBalanceReturn(10000000000000000000000);
    }

    function get_vesting_funds()
        public
        pure
        returns (MinerTypes.GetVestingFundsReturn memory params)
    {
        CommonTypes.VestingFunds[]
            memory vesting_funds = new CommonTypes.VestingFunds[](1);
        vesting_funds[0] = CommonTypes.VestingFunds(
            1668514825,
            2000000000000000000000
        );

        return MinerTypes.GetVestingFundsReturn(vesting_funds);
    }

    function change_beneficiary(
        MinerTypes.ChangeBeneficiaryParams memory params
    ) public {
        if (!isBeneficiarySet) {
            CommonTypes.BeneficiaryTerm memory term = CommonTypes
                .BeneficiaryTerm(params.new_quota, 0, params.new_expiration);
            activeBeneficiary = CommonTypes.ActiveBeneficiary(
                params.new_beneficiary,
                term
            );
            isBeneficiarySet = true;
        } else {
            activeBeneficiary.beneficiary = params.new_beneficiary;
            activeBeneficiary.term.quota = params.new_quota;
            activeBeneficiary.term.expiration = params.new_expiration;
        }
    }

    function get_beneficiary()
        public
        view
        returns (MinerTypes.GetBeneficiaryReturn memory)
    {
        require(isBeneficiarySet);

        CommonTypes.PendingBeneficiaryChange memory proposed;
        return MinerTypes.GetBeneficiaryReturn(activeBeneficiary, proposed);
    }

    function get_sector_size_from_enum() internal returns (uint64) {}
}
