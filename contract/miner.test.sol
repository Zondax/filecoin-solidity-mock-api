pragma solidity >=0.4.25 <= 0.8.15;

import { MinerTypes, MinerAPI, CommonTypes } from "./filecoin.mock.sol";

contract FilecoinMinerMockTest {

    function control_addresses() public {
        MinerTypes.GetControlAddressesReturn memory response = MinerAPI.control_addresses();
    }

    function get_owner() public {
        MinerTypes.GetOwnerReturn memory response = MinerAPI.get_owner();
    }

    function is_controlling_address() public {
        MinerTypes.IsControllingAddressParam memory params;

        MinerTypes.IsControllingAddressReturn memory response = MinerAPI.is_controlling_address(params);
    }

    function get_sector_size() public {
        MinerTypes.GetSectorSizeReturn memory response = MinerAPI.get_sector_size();
    }

    function get_available_balance( ) public {
        MinerTypes.GetAvailableBalanceReturn memory response = MinerAPI.get_available_balance();
    }

    function get_vesting_funds() public {
        MinerTypes.GetVestingFundsReturn memory response = MinerAPI.get_vesting_funds();
    }

    function change_worker_address( MinerTypes.ChangeWorkerAddressParams memory params ) internal {
        MinerTypes.ChangeWorkerAddressParams memory params;

        MinerAPI.change_worker_address(params);
    }

    function confirm_update_worker_key() public {
        MinerAPI.confirm_update_worker_key();
    }

    function change_owner_address() public {
        CommonTypes.Addr memory params;

        MinerAPI.change_owner_address(params);
    }

    function change_peer_id() public {
        MinerTypes.ChangePeerIDParams memory params;

        MinerAPI.change_peer_id(params);
    }

    function change_multiaddresses() public {
        MinerTypes.ChangeMultiaddrsParams memory params;

        MinerAPI.change_multiaddresses(params);
    }

    function submit_windowed_post( ) public {
        MinerTypes.SubmitWindowedPoStParams memory params;

        MinerAPI.submit_windowed_post(params);
    }

    function prove_commit_aggregate( ) public {
        MinerTypes.ProveCommitAggregateParams memory params;

        MinerAPI.prove_commit_aggregate(params);
    }

    function prove_replica_updates( ) public {
        MinerTypes.ProveReplicaUpdatesParams memory params;

        uint8 response = MinerAPI.prove_replica_updates(params);
    }

    function prove_replica_updates2() public {
        MinerTypes.ProveReplicaUpdatesParams2 memory params;

        uint8 response = MinerAPI.prove_replica_updates2(params);
    }

    function prove_replica_updates_inner() public {
        CommonTypes.ReplicaUpdateInner[] memory updates;

        uint8 response = MinerAPI.prove_replica_updates_inner(updates);
    }

    function dispute_windowed_post( ) public {
        MinerTypes.DisputeWindowedPoStParams memory params;

        MinerAPI.dispute_windowed_post(params);
    }

    function pre_commit_sector(  ) public {
        MinerTypes.PreCommitSectorParams memory params;

        MinerAPI.pre_commit_sector(params);
    }

    function pre_commit_sector_batch( ) public {
        MinerTypes.PreCommitSectorBatchParams memory params;

        MinerAPI.pre_commit_sector_batch(params);
    }

    function pre_commit_sector_batch2( ) public {
        MinerTypes.PreCommitSectorBatchParams2 memory params;

        MinerAPI.pre_commit_sector_batch2(params);
    }

    function pre_commit_sector_batch_inner(  ) public {
        CommonTypes.SectorPreCommitInfoInner[] memory sectors;

        MinerAPI.pre_commit_sector_batch_inner(sectors);
    }

    function prove_commit_sector() public {
        MinerTypes.ProveCommitSectorParams memory params;

        MinerAPI.prove_commit_sector(params);
    }

    function confirm_sector_proofs_valid( ) public {
        MinerTypes.ConfirmSectorProofsParams memory params;

        MinerAPI.confirm_sector_proofs_valid(params);
    }

    function check_sector_proven() public {
        MinerTypes.CheckSectorProvenParams memory params;

        MinerAPI.check_sector_proven(params);
    }

    function extend_sector_expiration( ) public {
        MinerTypes.ExtendSectorExpirationParams memory params;

        MinerAPI.extend_sector_expiration(params);
    }

    function extend_sector_expiration2() public {
        MinerTypes.ExtendSectorExpiration2Params memory params;

        MinerAPI.extend_sector_expiration2(params);
    }

    function extend_sector_expiration_inner() public {
        CommonTypes.ExtendExpirationsInner memory inner;
        CommonTypes.ExtensionKind kind;

        MinerAPI.extend_sector_expiration_inner(inner, kind);
    }

    function terminate_sectors() public {
        MinerTypes.TerminateSectorsParams memory params;

        MinerTypes.TerminateSectorsReturn memory response = MinerAPI.terminate_sectors(params);
    }

    function declare_faults( ) public {
        MinerTypes.DeclareFaultsParams memory params;

        MinerAPI.declare_faults(params);
    }

    function declare_faults_recovered() public {
        MinerTypes.DeclareFaultsRecoveredParams memory params;

        MinerAPI.declare_faults_recovered(params);
    }

    function compact_partitions() public {
        MinerTypes.CompactPartitionsParams memory params;

        MinerAPI.compact_partitions(params);
    }

    function compact_sector_numbers( ) public {
        MinerTypes.CompactSectorNumbersParams memory params;

        MinerAPI.compact_sector_numbers(params);
    }

    function apply_rewards(  ) public {
        MinerTypes.ApplyRewardParams memory params;

        MinerAPI.apply_rewards(params);
    }

    function report_consensus_fault( ) public {
        MinerTypes.ReportConsensusFaultParams memory params;

        MinerAPI.report_consensus_fault(params);
    }

    function withdraw_balance() public{
        MinerTypes.WithdrawBalanceParams memory params;

        MinerTypes.WithdrawBalanceReturn memory response = MinerAPI.withdraw_balance(params);
    }

    function change_beneficiary() public {
        MinerTypes.ChangeBeneficiaryParams memory params;

        MinerAPI.change_beneficiary(params);
    }

    function get_beneficiary() public {
        MinerTypes.GetBeneficiaryReturn memory response = MinerAPI.get_beneficiary();
    }

    function repay_debt() public {
        MinerAPI.repay_debt();
    }

    function on_deferred_cron_event() public {
        MinerTypes.DeferredCronEventParams memory params;

        MinerAPI.on_deferred_cron_event(params);
    }
}
