#!/bin/csh 
                                                                                                                                            

#-------------------                                                                                                                                 
# Arguments                                                                                                               
# #-------------------                                                                                                                                  
#
@ p = $1
#
# #-------------------                                                                                                                                
# # Variable Defs                                                                                                                                      
# #-------------------                                                                                                                                  
#
set OUT_FILE="/sphenix/user/vassalli/G4SinglePhoton"
#
set SCRATCH_AREA="$_CONDOR_SCRATCH_DIR"                                                                                                              
# #set SCRATCH_AREA="/phenix/scratch/chase"
#
set SOURCE_PHOTONMAKER="/direct/phenix+u/vassalli/sphenix/single/*"
#
# #-------------------                                                                                                                                
# # Export Libraries                                                                                                                                   
# #-------------------                                                                                                                                  
#
source /phenix/u/vassalli/.cshrc
#
# #-------------------                                                                                                                                 
# # Set Scratch Area                                                                                                                                   
# #-------------------                                                                                                                                  
#
mkdir $SCRATCH_AREA/fran_single_photons
cp  $SOURCE_PHOTONMAKER $SCRATCH_AREA/fran_single_photons/
#
# #-------------------                                                                                                                                
# # Run Executable  
# #-------------------                                                                                                                                  
#
cd $SCRATCH_AREA/fran_single_photons
root -b -q Fun4All_G4_sPHENIX.C\(\"out${1}DST.root\",\"out${1}Tree.root\"\) 
root -b -q myAnalysis.C\(\"out${1}DST.root\",\"out${1}Tree.root\"\)
cp out${1}Tree.root $OUT_FILE
#
#
rm -r $SCRATCH_AREA/fran_single_photons
#
#
exit 0
