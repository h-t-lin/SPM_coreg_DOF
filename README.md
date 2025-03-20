# SPM_coreg_DOF

This MATLAB script provides a function to switch the **degree of freedom (DOF)** in SPM coregister between `6` and `12`.

## Fetures

1. The `set_spm_dof` function allows users to dynamically change the DOF setting within the SPM coregistration process.  
2. It simplifies changing between **6 DOF (rigid-body transformation)** and **12 DOF (affine transformation)**.  

## Usage

There are two input parameters: `set_spm_dof(dof, spm_version)`  
> dof: The desired degrees of freedom to switch to. Must be either 6 or 12. Defaults to 6.  
> spm_version: The SPM version to apply the change to. Defaults to 12.  

Examples:
```
set_spm_dof(6)  % Switch DOF to 6 (for SPM12)
set_spm_dof(12) % Switch DOF to 12 (for SPM12)
set_spm_dof(12, 8) % Switch DOF to 12 for SPM8
```

## Prerequisites

* MATLAB and SPM must be installed.
* This script and the SPM directory should be in the same folder path.
