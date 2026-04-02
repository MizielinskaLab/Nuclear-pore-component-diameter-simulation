# Tested run note

The public repository structure was tested successfully as a **worked example**.

## Tested software environment
- MATLAB 2023a
- ImageJ 1.54
- FIJI with the latest available update recommended before ROI export and TrackMate XML export

## Tested workflow
### Experimental branch
1. Prepare microscopy-derived inputs.
2. Use ImageJ/FIJI to define the nuclear ROI.
3. Use ImageJ/FIJI TrackMate to generate the XML spot calls.
4. Place the bright-field image, denoised images, ROI, and XML files in the expected repository folders.
5. Add `third_party/` to the MATLAB path.
6. Run `src/run_spot_detection.m`.

### Simulation branch
1. Place representative simulation-location `.mat` files into `data/simulation/01-Simulation-location/`.
2. Add `third_party/` to the MATLAB path.
3. Run `src/run_simulation_batch.m`.

## Outcome
- The packaged MATLAB workflow ran successfully in the public repository structure.
- The ImageJ/FIJI-to-MATLAB order was followed successfully.
- Representative experimental outputs and representative simulation outputs were generated as expected.

## Accurate description
This tested run supports the repository as a reproducible **worked example** for the Fig. 4-linked computational branch. It does not change the scope statement that the repository remains smaller than the full paper-level simulation search space.
