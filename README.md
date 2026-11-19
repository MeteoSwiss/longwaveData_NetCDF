# longwaveData_NetCDF
MATLAB framework for creating FAIR and self-describing NetCDF datasets for atmospheric downward longwave radiation studies.  

The framework combines:
  - NetCDF Climate and Forecast (CF)-compliant variable metadata
  - World Meteorological Organization (WMO) Observing Systems Capability Analysis and Review tool (OSCAR)-inspired variable descriptions
  - standardized templates for different dataset configurations
  - automatic generation of NetCDF files from MATLAB data structures  
## Purpose
This framework generates FAIR, self-describing NetCDF4 datasets for atmospheric downwelling longwave radiation studies using standardized metadata catalogues, dimension definitions and MATLAB data structures.  
## FRAMEWORK OVERVIEW
- `getTemplateCatalogue.m`
  -> selects variable names
- `getVariableCatalogue.m`
  -> contains the variable description and metadata specific for atmospheric longwave radiation studies
-  `getGlobalMetadata.m`
  -> contains the global metadata attributes specific for the atmospheric longwave radiation study at the Payerne station
- `getDimensionCatalogue.m`
  -> defines dimensions and lengths
- `ncSavVarFil.m`
  -> writes the NetCDF file
- `create_longwave_structure.m`
  -> assembles the dataset by calling all the scripts and associates the data values to each variable before writing the NetCDF file  
## INPUT ARGUMENTS FOR `create_longwave_structure.m`
  - `fn_netCDF` : path to the output NetCDF file
  - `VarNames` : list of variable names to include
  - `DataValues` : path to a MAT-file containing a structure named `DataValuesStruct` that contains data values of the mentioned variables in `VarNames`
  - `TimeMin` : Start time in datetime format
  - `TimeMax` : End time in datetime format  
### Possibilities for `VarNames` are
#### AllRS observations
  - `TimeAllRS`
  - `LwdInst1AllRS`
  - `LwdInst2AllRS`
  - `LwdInst1StdAllRS`
  - `LwdInst2StdAllRS`
  - `SwDiffuseAllRS`
  - `SwDirectAllRS`
  - `SwGlobalAllRS`  
#### Atmospheric variables
  - `Time`
  - `Temperature`
  - `ProfileSurfaceTemp`
  - `TemperatureGradient`
  - `ProfileSurfacePres`
  - `water_vapor`  
#### Radiation measurements
  - `LwdInst1`
  - `LwdInst2`
  - `LwdInst1Std`
  - `LwdInst2Std`
  - `SwDiffuse`
  - `SwDirect`
  - `SwGlobal`  
#### Model outputs
  - `LibRadtranDLR`
  - `FitParameterizedDLR`
  - `NNParameterizedDLR`  
#### Corrected longwave radiation
  - `LwdInst1CorrectedIWV`
  - `LwdInst2CorrectedIWV`
  - `LwdInst1CorrectedSWDif`
  - `LwdInst2CorrectedSWDif`
  - `LwdInst1CorrectedIWVSWDif`
  - `LwdInst2CorrectedIWVSWDif`  
#### Regression coefficients
  - `SWDifCorrectionCoefDay`
  - `SWDifCorrectionCoefDaySE`
  - `SWDifCorrectionCoefAll`
  - `SWDifCorrectionCoefAllSE`
  - `IWVCorrectionCoef`
  - `IWVCorrectionCoefSE`  

The complete variable dictionary is defined in getVariableCatalogue.m, which serves as the authoritative source of metadata used during NetCDF generation.
### Remarks
Variables present in `DataValuesStruct` but not defined in `getVariableCatalogue.m` are automatically added to the dataset using a minimal metadata definition.  

For maximum FAIR compliance, variable metadata, dimensions and descriptions should be fully documented in a second step by the user.  
For example with: 
```matlab
ncwriteatt( ...
	'test.nc', ...
	'newVarName', ...
	'description', ...
	'This new variables description')
```
### Input data structure
The MAT-file provided through DataValues must contain a structure named `DataValuesStruct`, where the fieldnames must correspond to the Name entries d>
Example:
```matlab
DataValuesStruct.TimeAllRS
DataValuesStruct.LwdInst1AllRS
DataValuesStruct.Time
DataValuesStruct.Temperature
DataValuesStruct.water_vapor
DataValuesStruct.LwdInst1
DataValuesStruct.LwdInst2
```
### Assumptions
  1) Variables using dimension "Time" are stored in the source dataset with the same temporal sampling as the `Time` vector.  
  2) Variables using dimension "TimeAllRS" are stored in the source dataset with the same temporal sampling as the `TimeAllRS` vector.  
  3) Variables on dimension "Coef" are static regression coefficients and must not be temporally subsetted.
## Templates
The following templates of variables can be called, for example  
  `VarNames = {'all'}` will load the template vector  
  Possibilities are:  
	- `'all'`
	- `'allCS'`
	- `'allAllRS'`
	- `'inst1wCoef'`
	- `'inst1noCoef'`
	- `'inst2wCoef'`
	- `'inst2noCoef'`  
## Metadata standards
Variable metadata were defined using:
  - NetCDF Climate and Forecast (CF) Standard Name Table
  - World Meteorological Organization (WMO) Observing Systems Capability Analysis and Review tool (OSCAR) variable description  

The generated files follow:
  - NetCDF4
  - NetCDF Climate and Forecast (CF) Metadata Conventions
  - Findable, Accessible, Interoperable, and Reusable (FAIR) data principles  
## Example
```matlab
create_longwave_structure(...
	'nameFile.nc', ...
	 {'Time' 'Temperature'}, ...
	'LongwaveDataStruct.mat')
```
will create a NetCDF file containing those 2 variables (`Time` and `Temperature`), including their attributes and the global general metadata for the entire available time period.  
```matlab
create_longwave_structure(...
	'nameFile.nc', ...
	{'all'}, ...
	'LongwaveDataStruct.mat')
```
will create a NetCDF file containing all the variables defined in the variable catalogue with their associated attributes and general global metadata for the entire available time period.
## Example output
The generated NetCDF file can be inspected using:
```shell
ncdump -h test.nc
```
## License
Dataset metadata and generated files are intended to be distributed under CC-BY-4.0 unless specified otherwise.  
