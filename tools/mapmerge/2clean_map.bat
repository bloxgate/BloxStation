SET z_levels=6
cd 

FOR /L %%i IN (1,1,%z_levels%) DO (
  java -jar MapPatcher.jar -clean ../../maps/exodus-%%i.dmm.backup ../../maps/exodus-%%i.dmm ../../maps/exodus-%%i.dmm
)

java -jar MapPatcher.jar -clean ../../maps/blox-1.dmm.backup ../../maps/blox-1.dmm ../../maps/blox-1.dmm

pause