// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <= 0.8.15;

library CommonTypes{
    enum RegisteredSealProof {
        StackedDRG2KiBV1,
        StackedDRG512MiBV1,
        StackedDRG8MiBV1,
        StackedDRG32GiBV1,
        StackedDRG64GiBV1,

        StackedDRG2KiBV1P1,
        StackedDRG512MiBV1P1,
        StackedDRG8MiBV1P1,
        StackedDRG32GiBV1P1,
        StackedDRG64GiBV1P1,
        Invalid
    }

    enum RegisteredPoStProof {
        StackedDRGWinning2KiBV1,
        StackedDRGWinning8MiBV1,
        StackedDRGWinning512MiBV1,
        StackedDRGWinning32GiBV1,
        StackedDRGWinning64GiBV1,
        StackedDRGWindow2KiBV1,
        StackedDRGWindow8MiBV1,
        StackedDRGWindow512MiBV1,
        StackedDRGWindow32GiBV1,
        StackedDRGWindow64GiBV1,
        Invalid
    }

    enum RegisteredUpdateProof {
        StackedDRG2KiBV1,
        StackedDRG8MiBV1,
        StackedDRG512MiBV1,
        StackedDRG32GiBV1,
        StackedDRG64GiBV1,
        Invalid
    }
    enum ExtensionKind {
        ExtendCommittmentLegacy,
        ExtendCommittment
    }

    // FIXME this is actually an int64 on rust
    enum SectorSize {
        _2KiB,
        _8MiB,
        _512MiB,
        _32GiB,
        _64GiB
    }

    struct ValidatedExpirationExtension {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
        int64 new_expiration;
    }

    struct ExtendExpirationsInner {
        ValidatedExpirationExtension[] extensions;
        bytes claims; // FIXME this is a BTreeMap<SectorNumber, (u64, u64)> on rust
    }

    struct PendingBeneficiaryChange {
        Addr new_beneficiary;
        int256 new_quota;
        uint64 new_expiration;
        bool approved_by_beneficiary;
        bool approved_by_nominee;
    }

    struct BeneficiaryTerm {
        int256 quota;
        int256 used_quota;
        uint64 expiration;
    }

    struct ActiveBeneficiary {
        Addr beneficiary;
        BeneficiaryTerm term;
    }

    struct RecoveryDeclaration {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
    }

    struct FaultDeclaration {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
    }

    struct TerminationDeclaration {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
    }

    struct SectorClaim {
        uint64 sector_number;
        uint64[] maintain_claims;
        uint64[] drop_claims;
    }

    struct ExpirationExtension2 {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
        SectorClaim[] sectors_with_claims;
        int64 new_expiration;
    }

    struct ExpirationExtension {
        uint64 deadline;
        uint64 partition;
        uint8 sectors;
        int64 new_expiration;
    }

    struct FilterEstimate {
        int256 position;
        int256 velocity;
    }

    struct SectorPreCommitInfoInner {
        RegisteredSealProof seal_proof;
        uint64 sector_number;
        CID sealed_cid;
        int64 seal_rand_epoch;
        uint64[] deal_ids;
        int64 expiration;
        CID unsealed_cid;
    }

    struct SectorPreCommitInfo {
        RegisteredSealProof seal_proof;
        uint64 sector_number;
        CID sealed_cid;
        int64 seal_rand_epoch;
        uint64[] deal_ids;
        int64 expiration;
        CID unsealed_cid;
    }
    struct ReplicaUpdateInner {
        uint64 sector_number;
        uint64 deadline;
        uint64 partition;
        CID new_sealed_cid;
        CID new_unsealed_cid;
        uint64[] deals;
        RegisteredUpdateProof update_proof_type;
        bytes replica_proof;
    }

    struct ReplicaUpdate {
        uint64 sector_number;
        uint64 deadline;
        uint64 partition;
        CID new_sealed_cid;
        uint64 deals;
        RegisteredUpdateProof update_proof_type;
        bytes replica_proof;
    }

    struct ReplicaUpdate2 {
        uint64 sector_number;
        uint64 deadline;
        uint64 partition;
        CID new_sealed_cid;
        CID new_unsealed_cid;
        uint64 deals;
        RegisteredUpdateProof update_proof_type;
        bytes replica_proof;
    }

    struct PoStPartition {
        uint64 index;
        int8 skipped;
    }

    struct PoStProof {
        RegisteredPoStProof post_proof;
        bytes proof_bytes;
    }

    struct VestingFunds{
        int64 epoch;
        int256 amount;
    }
    struct SectorDeals {
        int64 sector_type;
        int64 sector_expiry;
        uint64 [] deal_ids;
    }

    struct Addr{
        int network;
        bytes payload;
    }

    struct Signature {
        int8 sig_type;
        bytes data;
    }

    struct DealProposal {
        CID piece_cid;
        uint64 piece_size;
        bool verified_deal;
        Addr client;
        Addr provider;
        string label;
        int64 start_epoch;
        int64 end_epoch;
        int storage_price_per_epoch;
        int provider_collateral;
        int client_collateral;
    }

    struct ClientDealProposal {
        DealProposal proposal;
        Signature client_signature;
    }

    struct SectorDealData {
        CID commd;
    }

    struct CID {
        uint8 version;
        uint64 codec;
        Multihash hash;
    }

    struct Multihash{
        uint64 code;
        uint8 size;
        bytes digest;
    }

    struct VerifiedDealInfo {
        uint64 client;
        uint64 allocation_id;
        CID data;
        uint64 size;
    }

    struct SectorDataSpec {
        uint64[] deal_ids;
        int64 sector_type;
    }
}


library MarketTypes{
    struct AddBalanceParams {
        CommonTypes.Addr provider_or_client;
    }

    struct WithdrawBalanceParams {
        CommonTypes.Addr provider_or_client;
        int tokenAmount;
    }

    struct WithdrawBalanceReturn {
        int amount_withdrawn;
    }

    struct PublishStorageDealsParams {
        CommonTypes.ClientDealProposal[] deals;
    }

    struct PublishStorageDealsReturn {
        int[] ids;
        int[] valid_deals;
    }

    struct VerifyDealsForActivationParams {
        CommonTypes.SectorDeals[] sectors;
    }

    struct VerifyDealsForActivationReturn {
        CommonTypes.SectorDealData[] sectors;
    }

    struct ActivateDealsParams {
        uint64[] deal_ids;
        int64 sector_expiry;
    }

    struct ActivateDealsResult {
        int nonverified_deal_space;
        CommonTypes.VerifiedDealInfo[] verified_infos;
    }

    struct OnMinerSectorsTerminateParams {
        uint64 epoch;
        uint64[] deal_ids;
    }

    struct ComputeDataCommitmentParams {
        CommonTypes.SectorDataSpec[] inputs;
    }

    struct ComputeDataCommitmentReturn {
        CommonTypes.CID[] commds;
    }

    struct GetDealActivationParams {
        uint64 id;
    }

    struct GetDealActivationReturn {
        int64 activated;
        int64 terminated;
    }
}

library MarketAPI{

    function add_balance(MarketTypes.AddBalanceParams memory params) internal {
    }

    function withdraw_balance(MarketTypes.WithdrawBalanceParams memory params) internal returns (MarketTypes.WithdrawBalanceReturn memory) {
        return MarketTypes.WithdrawBalanceReturn(1);
    }

    function publish_storage_deals(MarketTypes.PublishStorageDealsParams memory params) internal returns (MarketTypes.PublishStorageDealsReturn memory) {
        int[] memory ids;
        int[] memory valid_deals;

        return MarketTypes.PublishStorageDealsReturn(ids,valid_deals);
    }

    function verify_deals_for_activation(MarketTypes.VerifyDealsForActivationParams memory params) internal returns (MarketTypes.VerifyDealsForActivationReturn memory) {
        CommonTypes.SectorDealData[] memory sectors;

        return MarketTypes.VerifyDealsForActivationReturn(sectors);
    }

    function activate_deals(MarketTypes.ActivateDealsParams memory params) internal returns (MarketTypes.ActivateDealsResult memory) {
        CommonTypes.VerifiedDealInfo[] memory verified_infos;

        return MarketTypes.ActivateDealsResult(1, verified_infos);
    }

    function on_miner_sectors_terminate(MarketTypes.OnMinerSectorsTerminateParams memory params) internal {
    }

    function compute_data_commitment(MarketTypes.ComputeDataCommitmentParams memory params) internal returns (MarketTypes.ComputeDataCommitmentReturn memory) {
        CommonTypes.CID[] memory cids;

        return MarketTypes.ComputeDataCommitmentReturn(cids);
    }

    function cron_tick() internal {
    }

    function get_deal_activation(MarketTypes.GetDealActivationParams memory params) internal returns (MarketTypes.GetDealActivationReturn memory) {
        return MarketTypes.GetDealActivationReturn(1, 1);
    }
}

library MinerTypes{
    struct GetControlAddressesReturn {
        CommonTypes.Addr owner;
        CommonTypes.Addr worker;
        CommonTypes.Addr[] control_addresses;
    }
    struct GetOwnerReturn {
        CommonTypes.Addr owner;
    }
    struct IsControllingAddressParam {
        CommonTypes.Addr addr;
    }
    struct IsControllingAddressReturn {
        bool is_controlling;
    }
    struct GetSectorSizeReturn {
        CommonTypes.SectorSize sector_size;
    }
    struct GetAvailableBalanceReturn {
        int256 available_balance;
    }
    struct GetVestingFundsReturn {
        CommonTypes.VestingFunds[] vesting_funds;
    }
    struct ChangeWorkerAddressParams {
        CommonTypes.Addr new_worker;
        CommonTypes.Addr[] new_control_addresses;
    }
    struct ChangePeerIDParams {
        bytes new_id;
    }
    struct ChangeMultiaddrsParams {
        bytes new_multi_addrs;
    }
    struct SubmitWindowedPoStParams {
        uint64 deadline;
        CommonTypes.PoStPartition[] partitions;
        CommonTypes.PoStProof[] proofs;
        int64 chain_commit_epoch;
        bytes chain_commit_rand;
    }
    struct ProveCommitAggregateParams {
        uint8 sector_numbers;
        bytes aggregate_proof;
    }
    struct ProveReplicaUpdatesParams {
        CommonTypes.ReplicaUpdate[] updates;
    }
    struct ProveReplicaUpdatesParams2 {
        CommonTypes.ReplicaUpdate2 updates;
    }
    struct DisputeWindowedPoStParams {
        uint64 deadline;
        uint64 post_index;
    }
    struct PreCommitSectorParams {
        CommonTypes.RegisteredSealProof seal_proof;
        uint64 sector_number;
        CommonTypes.CID sealed_cid;
        int64 seal_rand_epoch;
        uint64[] deal_ids;
        int64 expiration;
        bool replace_capacity;
        uint64 replace_sector_deadline;
        uint64 replace_sector_partition;
        uint64 replace_sector_number;
    }

    struct PreCommitSectorBatchParams {
        PreCommitSectorParams[] sectors;
    }

    struct PreCommitSectorBatchParams2 {
        CommonTypes.SectorPreCommitInfo[] sectors;
    }

    struct ProveCommitSectorParams {
        uint64 sector_number;
        bytes proof;
    }

    struct ConfirmSectorProofsParams {
        uint64[] sectors;
        CommonTypes.FilterEstimate reward_smoothed;
        int256 reward_baseline_power;
        CommonTypes.FilterEstimate quality_adj_power_smoothed;
    }
    struct CheckSectorProvenParams {
        uint64 sector_number;
    }
    struct ExtendSectorExpirationParams {
        CommonTypes.ExpirationExtension[] extensions;
    }

    struct ExtendSectorExpiration2Params {
        CommonTypes.ExpirationExtension2[] extensions;
    }

    struct TerminateSectorsParams {
        CommonTypes.TerminationDeclaration[] terminations;
    }

    struct TerminateSectorsReturn {
        bool done;
    }

    struct DeclareFaultsParams {
        CommonTypes.FaultDeclaration[] faults;
    }

    struct DeclareFaultsRecoveredParams {
        CommonTypes.RecoveryDeclaration[] recoveries;
    }

    struct CompactPartitionsParams {
        uint64 deadline;
        uint8 partitions;
    }

    struct CompactSectorNumbersParams {
        uint8 mask_sector_numbers;
    }

    struct ApplyRewardParams {
        int256 reward;
        int256 penalty;
    }

    struct ReportConsensusFaultParams {
        bytes header1;
        bytes header2;
        bytes header_extra;
    }

    struct WithdrawBalanceParams {
        int256 amount_requested;
    }

    struct WithdrawBalanceReturn {
        int256 amount_withdrawn;
    }

    struct ChangeBeneficiaryParams {
        CommonTypes.Addr new_beneficiary;
        int256 new_quota;
        uint64 new_expiration;
    }

    struct GetBeneficiaryReturn {
        CommonTypes.ActiveBeneficiary active;
        CommonTypes.PendingBeneficiaryChange proposed;
    }

    struct DeferredCronEventParams {
        bytes event_payload;
        CommonTypes.FilterEstimate reward_smoothed;
        CommonTypes.FilterEstimate quality_adj_power_smoothed;
    }
}

library MinerAPI{
    function control_addresses() internal returns (MinerTypes.GetControlAddressesReturn memory) {
        CommonTypes.Addr memory owner;
        CommonTypes.Addr memory worker;
        CommonTypes.Addr[] memory control_addresses;

        return MinerTypes.GetControlAddressesReturn(owner, worker, control_addresses);
    }

    function get_owner() internal returns (MinerTypes.GetOwnerReturn memory) {
        CommonTypes.Addr memory owner;

        return MinerTypes.GetOwnerReturn(owner);
    }

    function is_controlling_address( MinerTypes.IsControllingAddressParam memory params ) internal returns (MinerTypes.IsControllingAddressReturn memory) {
        return MinerTypes.IsControllingAddressReturn(true);
    }

    function get_sector_size() internal returns (MinerTypes.GetSectorSizeReturn memory params ) {
        return MinerTypes.GetSectorSizeReturn(CommonTypes.SectorSize._512MiB);
    }

    function get_available_balance( ) internal returns (MinerTypes.GetAvailableBalanceReturn memory params ) {
        return MinerTypes.GetAvailableBalanceReturn(100000000);
    }

    function get_vesting_funds() internal returns (MinerTypes.GetVestingFundsReturn memory params ) {
        CommonTypes.VestingFunds[] memory vesting_funds;

        return MinerTypes.GetVestingFundsReturn(vesting_funds);
    }

    function change_worker_address( MinerTypes.ChangeWorkerAddressParams memory params ) internal {
    }

    function confirm_update_worker_key() internal {
    }

    function change_owner_address( CommonTypes.Addr memory new_address) internal {
    }

    function change_peer_id( MinerTypes.ChangePeerIDParams memory params) internal {
    }

    function change_multiaddresses( MinerTypes.ChangeMultiaddrsParams memory params ) internal {
    }

    function submit_windowed_post( MinerTypes.SubmitWindowedPoStParams memory params ) internal {
    }

    function prove_commit_aggregate( MinerTypes.ProveCommitAggregateParams memory params ) internal {
    }

    function prove_replica_updates( MinerTypes.ProveReplicaUpdatesParams memory params ) internal returns (uint8) {
        return 0;
    }

    function prove_replica_updates2(MinerTypes.ProveReplicaUpdatesParams2 memory params ) internal returns (uint8) {
        return 0;
    }

    function prove_replica_updates_inner(CommonTypes.ReplicaUpdateInner[] memory updates ) internal returns (uint8) {
        return 0;
    }

    function dispute_windowed_post(MinerTypes.DisputeWindowedPoStParams memory params ) internal {
    }

    function pre_commit_sector(MinerTypes.PreCommitSectorParams memory params  ) internal {
    }

    function pre_commit_sector_batch(MinerTypes.PreCommitSectorBatchParams memory params ) internal {
    }

    function pre_commit_sector_batch2(MinerTypes.PreCommitSectorBatchParams2 memory params ) internal {
    }

    function pre_commit_sector_batch_inner(CommonTypes.SectorPreCommitInfoInner[] memory sectors   ) internal {
    }

    function prove_commit_sector(MinerTypes.ProveCommitSectorParams memory  params ) internal {
    }

    function confirm_sector_proofs_valid(MinerTypes.ConfirmSectorProofsParams memory params ) internal {
    }

    function check_sector_proven(MinerTypes.CheckSectorProvenParams memory params ) internal {
    }

    function extend_sector_expiration(MinerTypes.ExtendSectorExpirationParams memory params ) internal {
    }

    function extend_sector_expiration2(MinerTypes.ExtendSectorExpiration2Params memory  params ) internal {
    }

    function extend_sector_expiration_inner(CommonTypes.ExtendExpirationsInner memory inner, CommonTypes.ExtensionKind kind   ) internal {
    }

    function terminate_sectors(MinerTypes.TerminateSectorsParams memory params   ) internal returns (MinerTypes.TerminateSectorsReturn memory) {
        return MinerTypes.TerminateSectorsReturn(true);
    }

    function declare_faults(MinerTypes.DeclareFaultsParams memory params ) internal {
    }

    function declare_faults_recovered(MinerTypes.DeclareFaultsRecoveredParams memory params ) internal {
    }

    function compact_partitions(MinerTypes.CompactPartitionsParams memory  params ) internal {
    }

    function compact_sector_numbers(MinerTypes.CompactSectorNumbersParams memory params ) internal {
    }

    function apply_rewards( MinerTypes.ApplyRewardParams memory params ) internal {
    }

    function report_consensus_fault(MinerTypes.ReportConsensusFaultParams memory params ) internal {
    }

    function withdraw_balance(MinerTypes.WithdrawBalanceParams memory params ) internal returns (MinerTypes.WithdrawBalanceReturn memory) {
        return MinerTypes.WithdrawBalanceReturn(100000);
    }

    function change_beneficiary(MinerTypes.ChangeBeneficiaryParams memory params ) internal {
    }

    function get_beneficiary() internal returns (MinerTypes.GetBeneficiaryReturn memory) {
        CommonTypes.ActiveBeneficiary memory active;
        CommonTypes.PendingBeneficiaryChange memory proposed;

        return MinerTypes.GetBeneficiaryReturn(active, proposed);
    }

    function repay_debt() internal {
    }

    function on_deferred_cron_event(MinerTypes.DeferredCronEventParams memory params ) internal {
    }

}
