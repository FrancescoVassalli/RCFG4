#!/bin/csh                                                                                                                                                                                                  

source /phenix/u/chase/.cshrc

@ pt15 = ($1 - 500)
@ pt25 = ($1 - 600)
@ pt35 = ($1 - 650)

set DESTINATION = "/sphenix/user/chase/HEPsimout"

#set all files for pTHatMin 5
set outfileDST = "/sphenix/user/chase/HEPsimout/1000RunFiles/XjPhi1_pT5_DST_"$1".root"      #DST.root from Fun4All
set outfileRoot = "/sphenix/user/chase/HEPsimout/1000RunFiles/R02/XjPhi1_pT5_output_"$1".root"  #.root from module (analyze this)

#set all files for pTHatMin 15                                                                                                                                                                             
set outfileDST2 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT5_DST_"$pt15".root"
set outfileRoot2 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT5_output_"$pt15".root"

#set all files for pTHatMin 25                                                                                                                                                                             
set outfileDST3 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT25_DST_"$pt25".root"
set outfileRoot3 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT25_output_"$pt25".root"

#set all files for pTHatMin 35                                                                                                                                                                             
set outfileDST4 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT35_DST_"$pt35".root"
set outfileRoot4 = "/sphenix/user/chase/HEPsimout/XjPhi3_pT35_output_"$pt35".root"


#run pTHatmin = 5 for first 500 in queue
if ($1 <1000 && -f $outfileDST) then 
    echo ---- RUNNING  Analysis Module ----
    echo root -b -q run_macro_isolation.C\(\"$outfileDST\",\"$outfileRoot\"\)
    root -b -q run_macro_isolation.C\(\"$outfileDST\",\"$outfileRoot\"\)

#run pTHatmin = 15 for next 100 in queue
else if ($1 > 1499 && $1 <1600 && -f $outfileDST) then
    echo ---- RUNNING  Analysis Module ----
    root -b -q run_macro_isolation.C\(\"$outfileDST2\",\"$outfileRoot2\"\)

#run pTHatmin = 25 for next 500 in queue
else if ($1 > 1599 && $1<6150 && -f $outfileDST) then
    echo ---- RUNNING  Analysis Module ----
    root -b -q run_macro_isolation.C\(\"$outfileDST3\",\"$outfileRoot3\"\)

#run pTHatmin = 35 for next 50 in queue
else if ($1>1650 && -f $outfileDST) then
    echo ---- RUNNING  Analysis Module ----
    root -b -q run_macro_isolation.C\(\"$outfileDST4\",\"$outfileRoot4\"\)
else
    echo ARGUMENT OUT OF FILE RANGE
endif
