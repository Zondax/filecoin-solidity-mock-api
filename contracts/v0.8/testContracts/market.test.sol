// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.4.25 <=0.8.15;

import {MarketAPI} from "../MarketAPI.sol";
import {CommonTypes} from "../types/CommonTypes.sol";
import {MarketTypes} from "../types/MarketTypes.sol";

contract FilecoinMarketMockTest {
    address marketApiAddress;

    constructor(address _marketApiAddress) {
        marketApiAddress = _marketApiAddress;
    }

    function market_withdraw_balance_test()
        public
        returns (MarketTypes.WithdrawBalanceReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        string memory addr = "t01113";
        MarketTypes.WithdrawBalanceParams memory params = MarketTypes
            .WithdrawBalanceParams(addr, 1);

        MarketTypes.WithdrawBalanceReturn memory response = marketApiInstance
            .withdraw_balance(params);
        return response;
    }

    function market_add_balance_test() public {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        string memory addr = "t01113";
        MarketTypes.AddBalanceParams memory params = MarketTypes
            .AddBalanceParams(addr);

        marketApiInstance.add_balance(params);
    }

    function get_balance_test()
        public
        view
        returns (MarketTypes.GetBalanceReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        string memory params = "t01113";

        MarketTypes.GetBalanceReturn memory response = marketApiInstance
            .get_balance(params);
        return response;
    }

    function get_deal_data_commitment_test()
        public
        view
        returns (MarketTypes.GetDealDataCommitmentReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealDataCommitmentParams memory params = MarketTypes
            .GetDealDataCommitmentParams(75);

        MarketTypes.GetDealDataCommitmentReturn
            memory response = marketApiInstance.get_deal_data_commitment(
                params
            );
        return response;
    }

    function get_deal_client_test() public view returns (string memory) {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientParams memory params = MarketTypes
            .GetDealClientParams(74);

        MarketTypes.GetDealClientReturn memory response = marketApiInstance
            .get_deal_client(params);
        return response.client;
    }

    function get_deal_provider_test()
        public
        view
        returns (MarketTypes.GetDealProviderReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderParams memory params = MarketTypes
            .GetDealProviderParams(80);

        MarketTypes.GetDealProviderReturn memory response = marketApiInstance
            .get_deal_provider(params);
        return response;
    }

    function get_deal_label_test()
        public
        view
        returns (MarketTypes.GetDealLabelReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealLabelParams memory params = MarketTypes
            .GetDealLabelParams(73);

        MarketTypes.GetDealLabelReturn memory response = marketApiInstance
            .get_deal_label(params);
        return response;
    }

    function get_deal_term_test()
        public
        view
        returns (MarketTypes.GetDealTermReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealTermParams memory params = MarketTypes
            .GetDealTermParams(72);

        MarketTypes.GetDealTermReturn memory response = marketApiInstance
            .get_deal_term(params);
        return response;
    }

    function get_deal_total_price_test()
        public
        view
        returns (MarketTypes.GetDealEpochPriceReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealEpochPriceParams memory params = MarketTypes
            .GetDealEpochPriceParams(67);

        MarketTypes.GetDealEpochPriceReturn memory response = marketApiInstance
            .get_deal_total_price(params);
        return response;
    }

    function get_deal_client_collateral_test()
        public
        view
        returns (MarketTypes.GetDealClientCollateralReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealClientCollateralParams memory params = MarketTypes
            .GetDealClientCollateralParams(68);

        MarketTypes.GetDealClientCollateralReturn
            memory response = marketApiInstance.get_deal_client_collateral(
                params
            );
        return response;
    }

    function get_deal_provider_collateral_test()
        public
        view
        returns (MarketTypes.GetDealProviderCollateralReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealProviderCollateralParams memory params = MarketTypes
            .GetDealProviderCollateralParams(69);

        MarketTypes.GetDealProviderCollateralReturn
            memory response = marketApiInstance.get_deal_provider_collateral(
                params
            );
        return response;
    }

    function get_deal_verified_test()
        public
        view
        returns (MarketTypes.GetDealVerifiedReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealVerifiedParams memory params = MarketTypes
            .GetDealVerifiedParams(70);

        MarketTypes.GetDealVerifiedReturn memory response = marketApiInstance
            .get_deal_verified(params);
        return response;
    }

    function get_deal_activation_test()
        public
        view
        returns (MarketTypes.GetDealActivationReturn memory)
    {
        MarketAPI marketApiInstance = MarketAPI(marketApiAddress);

        MarketTypes.GetDealActivationParams memory params = MarketTypes
            .GetDealActivationParams(71);

        MarketTypes.GetDealActivationReturn memory response = marketApiInstance
            .get_deal_activation(params);
        return response;
    }
}
