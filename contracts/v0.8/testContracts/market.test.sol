// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <= 0.8.15;

import { MarketAPI } from "../MarketAPI.sol";
import { CommonTypes } from "../typeLibraries/CommonTypes.sol";
import { MarketTypes } from "../typeLibraries/MarketTypes.sol";

contract FilecoinMarketMockTest {
    address marketApiAddress;

    constructor(address _marketApiAddress) {
        marketApiAddress = _marketApiAddress;
    }

    function market_withdraw_balance_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory addr = bytes("0x1111");
        MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);

        MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance.withdraw_balance(params);
    }

    function market_add_balance_test() public{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory addr = bytes("0x1111");
        MarketTypes.AddBalanceParams memory params = MarketTypes.AddBalanceParams(addr);

        marketApiInstance.add_balance(params);
    }

    function get_balance_test() public{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        bytes memory params = bytes("0x1111");

        MarketTypes.GetBalanceReturn memory response = marketApiInstance.get_balance(params);
    }

    function get_deal_data_commitment_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealDataCommitmentParams memory params = MarketTypes.GetDealDataCommitmentParams(1);

        MarketTypes.GetDealDataCommitmentReturn memory response = marketApiInstance.get_deal_data_commitment(params);
    }

    function get_deal_client_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientParams memory params = MarketTypes.GetDealClientParams(1);

        MarketTypes.GetDealClientReturn memory response = marketApiInstance.get_deal_client(params);
    }

    function get_deal_provider_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderParams memory params = MarketTypes.GetDealProviderParams(1);

        MarketTypes.GetDealProviderReturn memory response = marketApiInstance.get_deal_provider(params);
    }

    function get_deal_label_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealLabelParams memory params = MarketTypes.GetDealLabelParams(1);

        MarketTypes.GetDealLabelReturn memory response = marketApiInstance.get_deal_label(params);
    }

    function get_deal_term_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealTermParams memory params = MarketTypes.GetDealTermParams(1);

        MarketTypes.GetDealTermReturn memory response = marketApiInstance.get_deal_term(params);
    }

    function get_deal_epoch_price_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealEpochPriceParams memory params = MarketTypes.GetDealEpochPriceParams(1);

        MarketTypes.GetDealEpochPriceReturn memory response = marketApiInstance.get_deal_epoch_price(params);
    }

    function get_deal_client_collateral_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientCollateralParams memory params = MarketTypes.GetDealClientCollateralParams(1);

        MarketTypes.GetDealClientCollateralReturn memory response = marketApiInstance.get_deal_client_collateral(params);
    }

    function get_deal_provider_collateral_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderCollateralParams memory params = MarketTypes.GetDealProviderCollateralParams(1);

        MarketTypes.GetDealProviderCollateralReturn memory response = marketApiInstance.get_deal_provider_collateral(params);
    }

    function get_deal_verified_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealVerifiedParams memory params = MarketTypes.GetDealVerifiedParams(1);

        MarketTypes.GetDealVerifiedReturn memory response = marketApiInstance.get_deal_verified(params);
    }

    function get_deal_activation_test() public view{
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        uint64 id;
        MarketTypes.GetDealActivationParams memory params = MarketTypes.GetDealActivationParams(id);

        MarketTypes.GetDealActivationReturn memory response = marketApiInstance.get_deal_activation(params);
    }
}
