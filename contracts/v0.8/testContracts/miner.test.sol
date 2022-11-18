// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <= 0.8.15;

import { MinerAPI } from "../MinerAPI.sol";
import { CommonTypes } from "../typeLibraries/CommonTypes.sol";
import { MinerTypes } from "../typeLibraries/MinerTypes.sol";


contract FilecoinMinerMockTest {
    address minerApiAddress;

    constructor(address _minerApiAddress) {
        minerApiAddress = _minerApiAddress;
    }

    function mock_set_owner_test() public{
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory addr = bytes("0x1111");
        minerApiInstance.mock_set_owner(addr);
    }

    function get_owner_test() public  view{
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);
        MinerTypes.GetOwnerReturn memory response = minerApiInstance.get_owner();
    }

    function is_controlling_address_test() public view {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.IsControllingAddressParam memory params;
        MinerTypes.IsControllingAddressReturn memory response = minerApiInstance.is_controlling_address(params);
    }

    function get_sector_size_test() public view{
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.GetSectorSizeReturn memory response = minerApiInstance.get_sector_size();
    }

    function get_available_balance_test() public view returns (int256){
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.GetAvailableBalanceReturn memory response = minerApiInstance.get_available_balance();
        return response.available_balance;
    }


    function get_vesting_funds_test() public view {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.GetVestingFundsReturn memory response = minerApiInstance.get_vesting_funds();
    }

    function change_beneficiary_test() public {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.ChangeBeneficiaryParams memory params;
        minerApiInstance.change_beneficiary(params);
    }

    function get_beneficiary_test() public view {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        MinerTypes.GetBeneficiaryReturn memory response = minerApiInstance.get_beneficiary();
    }

    function change_owner_address_test() public {
        MinerAPI minerApiInstance = MinerAPI(minerApiAddress);

        bytes memory addr = bytes("0x1111");
        minerApiInstance.change_owner_address(addr);
    }
}
