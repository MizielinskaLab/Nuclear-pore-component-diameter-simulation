# Two-colour NPC spot analysis for Fig. 4-linked workflow

## Core repository statement
> This repository provides the author-generated MATLAB workflow, representative inputs, and representative outputs for the spot-analysis and simulation-comparison component of the manuscript, but does not yet reproduce the full paper-level simulation search space.

## What this repository is for
This repository is a public, representative release of the MATLAB workflow used for the **two-colour NPC spot-analysis and random-position simulation-comparison** branch of the study. It is most directly linked to the computational logic underlying **Fig. 4**, especially the paired-localisation, density-style comparison, and simulation-matching parts of the workflow.

The repository is intended to show:
- how microscopy-derived two-colour spot data are prepared and analysed;
- how representative random-position simulation inputs are analysed with the same style of distance and density summaries; and
- how the experimental and simulated outputs are compared in the framework used for the study.

This is therefore a **worked example package** for the Fig. 4-linked analysis branch. It is not a complete rebuild of the full manuscript workflow and it does not contain the full paper-level simulation search space.

## Repository contents
- `src/` — MATLAB scripts and functions.
- `data/experimental/` — representative experimental inputs.
- `data/simulation/` — representative simulation-location inputs.
- `results/experimental_example/` — representative experimental outputs.
- `results/simulation_example/` — representative simulation outputs.
- `third_party/` — location for third-party MATLAB helper files that must be downloaded separately.
- `docs/` — documentation for manuscript connection, workflow order, TrackMate export settings, simulation naming, tested run, and reproducibility scope.

## Code modules
- `src/run_spot_detection.m` — wrapper for the experimental analysis branch.
- `src/run_simulation_batch.m` — wrapper for the simulation analysis branch.
- `src/spot_detection/Spot_detection.m` — experimental spot-analysis script.
- `src/simulation/Simulation_ramdon_spot_analysis.m` — simulation batch analysis script.
- `src/simulation/Twocolour_NPCSimulation.m` — simulation analysis function.
- `src/common/check_dependencies.m` — checks that required third-party MATLAB utilities are available.

## Relation to the manuscript and Fig. 4
This repository is linked to the **spot-analysis and simulation-comparison workflow associated with Fig. 4**.

In practical terms:
- the experimental branch starts from microscopy images, ROI definition, and TrackMate XML spot export;
- MATLAB is then used to calculate spot number, density, intensity, inter-spot distance, and two-colour matching summaries;
- the simulation branch analyses representative random-position localisation files using the same style of downstream summaries; and
- study-level comparison is then made by comparing experimental and simulated distributions, including density-style outputs and similarity-based comparison.

This public package contains **one representative worked example** for each branch. The broader manuscript-level comparison required many additional image-analysis inputs and many additional random-position simulations beyond what is included here.

## Software used
This workflow uses **ImageJ/FIJI first**, followed by **MATLAB**.

### Tested software environment
- MATLAB **2023a**
- ImageJ **1.54**
- **FIJI** with the latest available update recommended before ROI export and TrackMate XML export

### MATLAB toolboxes used
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox

## Required workflow order
The workflow is sequential and should be run in the following order.

### Experimental pathway
1. Acquire microscopy images.
2. Prepare the denoised green and far-red images.
3. In ImageJ/FIJI, draw the nuclear ROI.
4. In ImageJ/FIJI, run TrackMate and export the XML spot files.
5. Place the bright-field image, denoised images, ROI, and XML files into the expected repository folders.
6. In MATLAB, add `third_party/` to the path.
7. In MATLAB, run `run_spot_detection`.

### Simulation pathway
1. Prepare the random-position simulation `.mat` files.
2. Place them in `data/simulation/01-Simulation-location/`.
3. In MATLAB, add `third_party/` to the path.
4. In MATLAB, run `run_simulation_batch`.
5. Compare the resulting simulation outputs with the experimental outputs.

## TrackMate export settings recorded for this workflow
The original workflow note records the following TrackMate settings for the exported XML files that are imported into MATLAB:

```text
settings.detectorFactory = LogDetectorFactory()
settings.detectorSettings = {
DetectorKeys.KEY_DO_SUBPIXEL_LOCALIZATION : True,
DetectorKeys.KEY_RADIUS : 0.125,
DetectorKeys.KEY_TARGET_CHANNEL : 1,
DetectorKeys.KEY_THRESHOLD : 60.,
DetectorKeys.KEY_DO_MEDIAN_FILTERING : False,
settings.trackerFactory = NearestNeighborTrackerFactory()
settings.trackerSettings = settings.trackerFactory.getDefaultSettings();
settings.trackerSettings['LINKING_MAX_DISTANCE'] = 1.0
```

Because the MATLAB workflow imports the TrackMate XML output, changing these settings can change the downstream spot tables, density summaries, and matching outputs.

## Simulation-location naming used in the representative example
Example name:
- `1FR_D116H004_2GR_D180H010`

Interpretation:
- `1FR` = first channel, FarRed
- `D116` = outer diameter 116 nm for the FR random-position region
- `H004` = hollow inner diameter 4 nm for the FR inner exclusion region
- `2GR` = second channel, Green
- `D180` = outer diameter 180 nm for the GR random-position region
- `H010` = hollow inner diameter 10 nm for the GR inner exclusion region

This means:
- FR spots are randomly positioned within **4-116 nm in diameter**
- GR spots are randomly positioned within **10-180 nm in diameter**

When described as radial distance from the centre, these become:
- FR = **2-58 nm radius**
- GR = **5-90 nm radius**

## Third-party files required
The original MATLAB workflow calls the following third-party MATLAB files, but they are **not redistributed** in this public repository:
- `trackmateSpots.m`
- `ReadImageJROI.m`
- `export_fig.m`
- `scatter_kde.m`

Please download the canonical versions from their original sources, place them in `third_party/`, and add `third_party/` to the MATLAB path before running the scripts.

See:
- `DEPENDENCIES.md`
- `third_party/README.md`

## What this repository does and does not reproduce
This repository demonstrates the analysis structure with representative inputs and representative outputs. It supports a **tested worked example** for the Fig. 4-linked computational branch.

It does **not** yet include:
- the full paper-level simulation search space;
- the full set of image-analysis inputs used across all conditions in the study; or
- a single one-click reconstruction of the entire figure and manuscript output.

The full study-level simulation search described in the original workflow note involved **100,000+ simulations**. That larger search space is not bundled here.

## Quick start
1. Download the required third-party files and place them in `third_party/`.
2. Open MATLAB 2023a or a closely compatible version.
3. Add the repository root and `third_party/` to the MATLAB path.
4. Run `src/run_spot_detection.m` for the experimental example.
5. Run `src/run_simulation_batch.m` for the simulation example.
6. Inspect the exported results in `results/`.

## Usage note
Please see `LICENSE_NOTE.md` for the public-use terms for the author-generated code and example data included in this repository.

## Documentation
- `CODE_AVAILABILITY.md`
- `DEPENDENCIES.md`
- `LICENSE_NOTE.md`
- `docs/MANUSCRIPT_CONNECTION.md`
- `docs/QUICK_START.md`
- `docs/REPRODUCIBILITY_NOTES.md`
- `docs/TESTED_RUN_NOTE.md`
- `docs/TRACKMATE_AND_SIMULATION_NOTES.md`
