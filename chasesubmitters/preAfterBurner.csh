#!/bin/csh                                                                                                                                                                                                  

source /phenix/u/chase/.cshrc


#set all files for pTHatMin 5
set outfileDST = "/sphenix/user/chase/HEPsimout/XjPhi3_pT5_DST_"$1".root"      #DST.root from Fun4All
set checkRoot = "/sphenix/user/chase/HEPsimout/XjPhi3_pT5_output_"$1".root"  #.root from module (analyze this)
set outfileRoot = "/sphenix/user/chase/HEPsimout/temp/XjPhi3_pT5_output_"$1".root"

if ($1 <500 && -f $outfileDST && -f $checkRoot) then 
    echo ---- RUNNING  Analysis Module ----
    echo root -b -q run_macro_isolation.C\(\"$outfileDST\",\"$outfileRoot\"\)
    root -b -q run_macro_isolation.C\(\"$outfileDST\",\"$outfileRoot\"\)
else
    echo DST NOT READY TO BE ANALYZED
endif
