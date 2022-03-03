unit interface_tempprocessing;

interface

uses Global, interface_global;


procedure AdjustMONTHandYEAR(
            VAR Mfile,Yfile : INTEGER);
        external 'aquacrop' name '__ac_tempprocessing_MOD_adjustmonthandyear';

procedure AdjustDecadeMONTHandYEAR(
            VAR DecFile,Mfile,Yfile : INTEGER);
        external 'aquacrop' name '__ac_tempprocessing_MOD_adjustdecademonthandyear';

procedure SetDayNrToYundef(
            VAR DayNri : LongInt);
        external 'aquacrop' name '__ac_tempprocessing_MOD_setdaynrtoyundef';

procedure GetDecadeTemperatureDataSet(
            constref DayNri : LongInt;
            VAR TminDataSet,TmaxDataSet : rep_SimulationEventsDbl);
        external 'aquacrop' name '__ac_tempprocessing_MOD_getdecadetemperaturedataset';

procedure GetMonthlyTemperatureDataSet(
            constref DayNri : LongInt;
            VAR TminDataSet,TmaxDataSet : rep_SimulationEventsDbl);
        external 'aquacrop' name '__ac_tempprocessing_MOD_getmonthlytemperaturedataset';

function GrowingDegreeDays(
            constref ValPeriod : INTEGER;
            constref FirstDayPeriod : LongInt;
            constref Tbase,Tupper,TDayMin,TDayMax : double) : integer;
        external 'aquacrop' name '__ac_tempprocessing_MOD_growingdegreedays';

function SumCalendarDays(
            constref ValGDDays : INTEGER;
            constref FirstDayCrop : LongInt;
            constref Tbase,Tupper,TDayMin,TDayMax : double) : integer;
        external 'aquacrop' name '__ac_tempprocessing_MOD_sumcalendardays';

FUNCTION MaxAvailableGDD(
            constref FromDayNr : LongInt;
            constref Tbase,Tupper,TDayMin,TDayMax : double) : Double;
         external 'aquacrop' name '__ac_tempprocessing_MOD_maxavailablegdd';

procedure GDDCDCToCDC(
            constref PlantDayNr : LongInt;
            constref D123,GDDL123,GDDHarvest : INTEGER;
            constref CCx,GDDCDC,Tbase,Tupper,NoTempFileTMin,NoTempFileTMax : double;
            VAR CDC : double);
        external 'aquacrop' name '__ac_tempprocessing_MOD_gddcdctocdc';

PROCEDURE AdjustCalendarDays(
            constref PlantDayNr : LongInt;
            constref InfoCropType : rep_subkind;
            constref Tbase,Tupper,NoTempFileTMin,NoTempFileTMax : double;
            constref GDDL0,GDDL12,GDDFlor,GDDLengthFlor,GDDL123,GDDHarvest,GDDLZmax : INTEGER;
            VAR GDDHImax : INTEGER;
            constref GDDCGC,GDDCDC,CCo,CCx : double;
            constref IsCGCGiven : BOOLEAN;
            constref HIndex : INTEGER;
            constref TheDaysToCCini : INTEGER;
            constref ThePlanting : rep_planting;
            VAR D0,D12,DFlor,LengthFlor,D123,DHarvest,DLZmax,LHImax : INTEGER;
            VAR StLength : rep_int_array;
            VAR CGC,CDC,dHIdt : double;
            VAR Succes : BOOLEAN);
        external 'aquacrop' name '__ac_tempprocessing_MOD_adjustcalendardays';

procedure AdjustCalendarCrop(
            constref FirstCropDay : LongInt);
        external 'aquacrop' name '__ac_tempprocessing_MOD_adjustcalendarcrop';

function RoundedOffGDD(
            constref PeriodGDD,PeriodDay : INTEGER;
            constref FirstDayPeriod : LongInt;
            constref TempTbase,TempTupper,TempTmin,TempTmax : double) : INTEGER;
         external 'aquacrop' name '__ac_tempprocessing_MOD_roundedoffgdd';

procedure HIadjColdHeat(
            constref TempHarvest,TempFlower,TempLengthFlowering,TempHI : INTEGER;
            constref TempTmin,TempTmax : double;
            constref TempTcold,TempTheat : shortInt;
            constref TempfExcess : smallInt;
            VAR HIadjusted : double;
            VAR ColdStress,HeatStress : BOOLEAN);
         external 'aquacrop' name '__ac_tempprocessing_MOD_hiadjcoldheat';

function ResetCropDay1(
            constref CropDay1IN : LongInt;
            constref SwitchToYear1 : BOOLEAN) : LongInt;
         external 'aquacrop' name '__ac_tempprocessing_MOD_resetcropday1';

procedure CropStressParametersSoilSalinity(
            constref CCxRed,CCdistortion : ShortInt;
            constref CCo,CCx,CGC,GDDCGC : double;
            constref CropDeterm : BOOLEAN;
            constref L12,LFlor,LengthFlor,L123 : INTEGER;
            constref GDDL12,GDDLFlor,GDDLengthFlor,GDDL123 : INTEGER;
            constref TheModeCycle : rep_modeCycle;
            VAR StressResponse : rep_EffectStress);
         external 'aquacrop' name '__ac_tempprocessing_MOD_cropstressparameterssoilsalinity';

procedure TemperatureFileCoveringCropPeriod(
            constref CropFirstDay,CropLastDay : LongInt);
         external 'aquacrop' name '__ac_tempprocessing_MOD_temperaturefilecoveringcropperiod';

procedure AdjustCropFileParameters(
            constref TheCropFileSet : rep_CropFileSet;
            constref LseasonDays : INTEGER;
            constref TheCropDay1 : LongInt;
            constref TheModeCycle  : rep_modeCycle;
            constref TheTbase,TheTupper  : double;
            VAR L123,L1234,GDD123,GDD1234 : INTEGER);
         external 'aquacrop' name '__ac_tempprocessing_MOD_adjustcropfileparameters';

procedure LoadSimulationRunProject(
            constref NameFileFull : string;
            constref NrRun : INTEGER);

procedure LoadSimulationRunProject(
            constref IrriFileFull : string;
            constref strlen1 : integer;
            constref NrRun : INTEGER);
         external 'aquacrop' name '__ac_tempprocessing_MOD_loadsimulationrunproject';

implementation


procedure LoadSimulationRunProject(
            constref NameFileFull : string;
            constref NrRun : INTEGER);
var
    p1 := PChar;
    strlen1: integer;
begin;
    p1 := PChar(NameFileFull);
    strlen1 := Length(NameFileFull);
    LoadSimulationRunProject_wrap(p1, strlen1, NrRun);
end;

initialization


end.

