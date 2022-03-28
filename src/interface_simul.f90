module ac_interface_simul
use ac_kinds, only: dp, &
                    int32
use ac_simul, only: AdjustpSenescenceToETo, &
                    DetermineCCi, &
                    DetermineCCiGDD


implicit none


contains


subroutine AdjustpSenescenceToETo_wrap(EToMean, TimeSenescence, WithBeta, pSenAct)
    real(dp), intent(in) :: EToMean
    real(dp), intent(in) :: TimeSenescence
    logical(1), intent(in) :: WithBeta
    real(dp), intent(inout) :: pSenAct

    logical :: WithBeta_f

    WithBeta_f = WithBeta
    call AdjustpSenescenceToETo(EToMean, TimeSenescence, WithBeta_f, pSenAct)
end subroutine AdjustpSenescenceToETo_wrap


subroutine DetermineCCiGDD_wrap(CCxTotal, CCoTotal, &
                           StressLeaf, FracAssim, MobilizationON, &
                           StorageON, SumGDDAdjCC, VirtualTimeCC, &
                           StressSenescence, TimeSenescence, NoMoreCrop, &
                           CDCTotal, CGCAdjustmentAfterCutting, GDDayFraction, &
                           GDDayi, GDDCDCTotal, GDDTadj)
    real(dp), intent(in) :: CCxTotal
    real(dp), intent(in) :: CCoTotal
    real(dp), intent(inout) :: StressLeaf
    real(dp), intent(in) :: FracAssim
    logical(1), intent(in) :: MobilizationON
    logical(1), intent(in) :: StorageON
    real(dp), intent(in) :: SumGDDAdjCC
    integer(int32), intent(in) :: VirtualTimeCC
    real(dp), intent(inout) :: StressSenescence
    real(dp), intent(inout) :: TimeSenescence
    logical(1), intent(inout) :: NoMoreCrop
    real(dp), intent(in) :: CDCTotal
    logical(1), intent(inout) :: CGCAdjustmentAfterCutting
    real(dp), intent(in) :: GDDayFraction
    real(dp), intent(in) :: GDDayi
    real(dp), intent(in) :: GDDCDCTotal
    integer(int32), intent(in) :: GDDTadj

    logical :: MobilizationON_f, StorageON_f, NoMoreCrop_f, &
               CGCAdjustmentAfterCutting_f

    MobilizationON_f = MobilizationON
    StorageON_f = StorageON
    NoMoreCrop_f = NoMoreCrop
    CGCAdjustmentAfterCutting_f = CGCAdjustmentAfterCutting

    call DetermineCCiGDD(CCxTotal, CCoTotal, &
                           StressLeaf, FracAssim, MobilizationON_f, &
                           StorageON_f, SumGDDAdjCC, VirtualTimeCC, &
                           StressSenescence, TimeSenescence, NoMoreCrop_f, &
                           CDCTotal, CGCAdjustmentAfterCutting_f, GDDayFraction, &
                           GDDayi, GDDCDCTotal, GDDTadj)
    NoMoreCrop = NoMoreCrop_f
    CGCAdjustmentAfterCutting = CGCAdjustmentAfterCutting_f
end subroutine DetermineCCiGDD_wrap


subroutine DetermineCCi_wrap(CCxTotal, CCoTotal, StressLeaf, FracAssim, &
                        MobilizationON, StorageON, Tadj, VirtualTimeCC, &
                        StressSenescence, TimeSenescence, NoMoreCrop, &
                        CDCTotal, CGCAdjustmentAfterCutting, DayFraction, &
                        GDDCDCTotal, TESTVAL)
    real(dp), intent(in) :: CCxTotal
    real(dp), intent(in) :: CCoTotal
    real(dp), intent(inout) :: StressLeaf
    real(dp), intent(in) :: FracAssim
    logical, intent(in) :: MobilizationON
    logical, intent(in) :: StorageON
    integer(int32), intent(in) :: Tadj
    integer(int32), intent(in) :: VirtualTimeCC
    real(dp), intent(inout) :: StressSenescence
    real(dp), intent(inout) :: TimeSenescence
    logical, intent(inout) :: NoMoreCrop
    real(dp), intent(in) :: CDCTotal
    logical, intent(inout) :: CGCAdjustmentAfterCutting
    real(dp), intent(in) :: DayFraction
    real(dp), intent(in) :: GDDCDCTotal
    real(dp), intent(inout) :: TESTVAL

    logical :: MobilizationON_f, StorageON_f, NoMoreCrop_f, &
               CGCAdjustmentAfterCutting_f

    MobilizationON_f = MobilizationON
    StorageON_f = StorageON
    NoMoreCrop_f = NoMoreCrop
    CGCAdjustmentAfterCutting_f = CGCAdjustmentAfterCutting

    call DetermineCCi(CCxTotal, CCoTotal, StressLeaf, FracAssim, &
                        MobilizationON_f, StorageON_f, Tadj, VirtualTimeCC, &
                        StressSenescence, TimeSenescence, NoMoreCrop_f, &
                        CDCTotal, CGCAdjustmentAfterCutting_f, DayFraction, &
                        GDDCDCTotal, TESTVAL)
    NoMoreCrop = NoMoreCrop_f
    CGCAdjustmentAfterCutting = CGCAdjustmentAfterCutting_f
end subroutine DetermineCCi_wrap


end module ac_interface_simul
