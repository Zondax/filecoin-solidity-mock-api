pragma solidity >=0.4.25 <= 0.8.15;

import { MarketTypes, MarketAPI, CommonTypes } from "./filecoin.mock.sol";

contract FilecoinMarketMockTest {
    function market_withdraw_balance_test() public{
        CommonTypes.Addr memory addr = CommonTypes.Addr(1, bytes("0x1111"));
        MarketTypes.WithdrawBalanceParams memory params = MarketTypes.WithdrawBalanceParams(addr, 1);

        MarketTypes.WithdrawBalanceReturn memory response = MarketAPI.withdraw_balance(params);
    }

    function market_add_balance_test() public{
        CommonTypes.Addr memory addr = CommonTypes.Addr(1, bytes("0x1111"));
        MarketTypes.AddBalanceParams memory params = MarketTypes.AddBalanceParams(addr);

        MarketAPI.add_balance(params);
    }

    function publish_storage_deals_test() public{
        CommonTypes.ClientDealProposal[] memory deals;
        MarketTypes.PublishStorageDealsParams memory params = MarketTypes.PublishStorageDealsParams(deals);

        MarketTypes.PublishStorageDealsReturn memory response = MarketAPI.publish_storage_deals(params);
    }

    function verify_deals_for_activation_test() public{
        CommonTypes.SectorDeals[] memory sectors;
        MarketTypes.VerifyDealsForActivationParams memory params = MarketTypes.VerifyDealsForActivationParams(sectors);

        MarketTypes.VerifyDealsForActivationReturn memory response = MarketAPI.verify_deals_for_activation(params);
    }

    function activate_deals_test() public{
        uint64[] memory deal_ids;
        int64 sector_expiry;
        MarketTypes.ActivateDealsParams memory params = MarketTypes.ActivateDealsParams(deal_ids, sector_expiry);

        MarketTypes.ActivateDealsResult memory response = MarketAPI.activate_deals(params);
    }

    function on_miner_sectors_terminate_test() public{
        uint64 epoch;
        uint64[] memory deal_ids;
        MarketTypes.OnMinerSectorsTerminateParams memory params = MarketTypes.OnMinerSectorsTerminateParams(epoch, deal_ids);

        MarketAPI.on_miner_sectors_terminate(params);
    }

    function compute_data_commitment_test() public{
        CommonTypes.SectorDataSpec[] memory inputs;
        MarketTypes.ComputeDataCommitmentParams memory params = MarketTypes.ComputeDataCommitmentParams(inputs);

        MarketTypes.ComputeDataCommitmentReturn memory response = MarketAPI.compute_data_commitment(params);
    }

    function cron_tick_test() public{
        MarketAPI.cron_tick();
    }

    function get_deal_activation_test() public{
        uint64 id;
        MarketTypes.GetDealActivationParams memory params = MarketTypes.GetDealActivationParams(id);

        MarketTypes.GetDealActivationReturn memory response = MarketAPI.get_deal_activation(params);
    }
}
