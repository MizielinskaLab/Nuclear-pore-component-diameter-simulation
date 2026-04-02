# Quick start

## 1. Install the required third-party MATLAB files
Place the following files in `third_party/`:
- `trackmateSpots.m`
- `ReadImageJROI.m`
- `export_fig.m`
- `scatter_kde.m`

Then add `third_party/` to the MATLAB path.

## 2. Experimental example
The experimental example assumes this order:
1. prepare images;
2. define the ROI in ImageJ/FIJI;
3. export TrackMate XML in ImageJ/FIJI;
4. place the inputs in `data/experimental/`;
5. run `src/run_spot_detection.m`.

## 3. Simulation example
The simulation example assumes this order:
1. prepare simulation-location `.mat` files;
2. place them in `data/simulation/01-Simulation-location/`;
3. run `src/run_simulation_batch.m`.

## 4. Tested environment
- MATLAB 2023a
- ImageJ 1.54
- FIJI with the latest available update recommended
