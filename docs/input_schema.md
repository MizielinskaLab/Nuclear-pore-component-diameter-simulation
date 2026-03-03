# Input schema (minimal) for public use

This repo intentionally does **not** ship lab-specific `.mat` files.  
To use the plotting utilities you must supply:

## 1) `zzz_data` (cell array)

The functions:
- `src/plot/sim_comparison_04gcLBB_jet_Lo3_GF2.m`
- `src/plot/sim_comparison_04gcLBB_jet_Lo3_GF3.m`

access the following fields for row `zzz`:

### Required columns (by index)

- `zzz_data{zzz,1}` : 1×N cell, experiment (EXP)
  - `{1,1}` : heatmap payload (cell)
    - `{1,1}` : X grid (numeric array)
    - `{1,2}` : Y grid (numeric array)
    - `{1,3}` : Z values (numeric array; density/intensity)
  - `{1,2}` : source filename (char/string) used for provenance logging
  - `{1,3}` : summary table (MATLAB table) for EXP

- `zzz_data{zzz,2}` : 1×N cell, simulation (SIM)
  - same structure as column 1 (heatmap payload / filename / summary table)

- `zzz_data{zzz,3}` : numeric scalar
  - used as SSIM annotation label in figure titles (some pipelines store "scaled SSIM" here)

- `zzz_data{zzz,6}` : numeric scalar
  - `n_exp` (number of events/points used for EXP heatmap)

- `zzz_data{zzz,7}` : numeric scalar
  - `n_sim` (number of events/points used for SIM heatmap)

- `zzz_data{zzz,12:16}` : numeric scalars
  used to build the `*_2table_all_SSIM.csv` table:
  - col12: SSIM
  - col13: Ratio_mean
  - col14: Ratio_median
  - col15: Ratio_SD
  - col16: SSIM_mean

> Note: the upstream pipeline can store many additional columns; they are ignored here.

## 2) `zzz_import` (`99_all_data.mat`)

The plotting functions call:
```matlab
xz1 = importdata(zzz_import);
```
and expect `xz1` to be a struct containing at least:

- `s_1FR_9inshp_um` : N×2 numeric array (XY points for one species; units: µm)
- `s_2GR_9inshp_um` : M×2 numeric array (XY points for the other species; units: µm)

- `s_1FR_1diameter` : scalar (nm)
- `s_1FR_2hallow`   : scalar (nm)
- `s_2GR_1diameter` : scalar (nm)
- `s_2GR_2hallow`   : scalar (nm)

These are used for the scatter plot and for drawing diameter/hollow circles.

## Outputs (created by sim_comparison_*)
For each `zzz` entry, the plotting functions export:

- `...__1densitymap.tif` : 2×3 figure panel (raster)
- `...__2table_all.csv`  : concatenated EXP/SIM summary tables
- `...__2table_all_SSIM.csv` : SSIM + ratio summary
- plus small provenance text files (locations)

The exact filenames depend on `zzz_folder` and `zzz_name`.
