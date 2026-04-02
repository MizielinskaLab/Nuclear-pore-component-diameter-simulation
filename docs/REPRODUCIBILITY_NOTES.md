# Reproducibility notes

## What this repository demonstrates
This repository demonstrates a **tested worked example** for:
- the experimental two-colour spot-analysis branch; and
- the random-position simulation-analysis branch.

The repository includes representative inputs and representative outputs for both branches.

## Preserved workflow order
The workflow should be followed in this order:
1. microscopy image preparation;
2. ROI definition in ImageJ/FIJI;
3. TrackMate XML export in ImageJ/FIJI;
4. import and analysis in MATLAB for the experimental branch;
5. preparation and placement of simulation-location `.mat` files;
6. MATLAB analysis of the simulation branch;
7. comparison of experimental and simulation outputs.

The order matters because the MATLAB scripts expect the ROI and TrackMate XML files to already exist.

## Tested environment
- MATLAB 2023a
- ImageJ 1.54
- FIJI with the latest available update recommended

## Scope
This repository supports a reproducible **example-scale run** of the Fig. 4-linked computational workflow. It does not yet bundle the full paper-level simulation search space or the full set of image-analysis inputs used across the study.
