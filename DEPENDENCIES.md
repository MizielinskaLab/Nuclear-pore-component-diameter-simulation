# Dependency notes

The following third-party MATLAB utilities are referenced by the workflow but are intentionally **not redistributed** in this public repository. Users should download them directly from their original sources and comply with the original licenses or redistribution terms.

## Required third-party MATLAB files

| File | Role in this workflow | Author information noted in the original workflow material | Suggested source |
|---|---|---|---|
| `trackmateSpots.m` | Imports visible spots from TrackMate XML into MATLAB | Jean-Yves Tinevez (2016) | TrackMate / FIJI script source |
| `ReadImageJROI.m` | Imports ImageJ/FIJI ROI files into MATLAB | Dylan Muir | Dylan Muir repository or MATLAB File Exchange |
| `export_fig.m` | Exports figures in publication-quality format | Oliver Woodford; maintained by Yair Altman | export_fig repository or MATLAB File Exchange |
| `scatter_kde.m` | Scatter plot coloured by local kernel-density estimate | Nils Haentjens | MATLAB File Exchange |

## Why these files are not bundled here
This repository separates the author-generated analysis code from third-party helper utilities. This keeps the public release clearer and avoids redistributing external code when redistribution permission has not been independently confirmed for this package.

## What users should do
1. Download the required files from their original sources.
2. Place them in `third_party/`.
3. Add `third_party/` to the MATLAB path.
4. Run the repository scripts.

`src/common/check_dependencies.m` reports missing files at the start of execution.
