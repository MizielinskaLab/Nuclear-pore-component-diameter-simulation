# Nuclear-pore-component-diameter-simulation

**One-line purpose:** MATLAB utilities to compare **experimental NPC component heatmaps** against **diameter/hollow simulation outputs** using **SSIM-like image comparisons**, and to export **publication-ready figures and summary tables**.

## What this repo is (and is not)
- **Included:** plotting + reporting utilities (`src/plot/`) and small helper functions (`src/utils/`) for generating:
  - 2×3-panel comparison figures (experiment vs simulation + XY scatter + diameter/hollow overlays)
  - CSV/TXT tables summarising experiment vs simulation and SSIM/ratio metrics
- **Not included:** lab-specific raw data, upstream tracking/heatmap pipelines, or full simulation datasets.  
  You must provide your own `.mat` inputs (see `docs/input_schema.md`).

## Requirements
- MATLAB (tested with typical R2020+ environments; older versions may still work)
- **Image Processing Toolbox** (recommended):
  - `ssim` (used by `run/legacy_batch_ssim.m`)
  - `viscircles` is optional; this repo provides `npc_viscircles` as a fallback

## Quick start
1) Clone the repo and open MATLAB in the repo folder.
2) Run the template (edit paths first):
   - `run/run_sim_comparison_template.m`

Outputs are written as:
- `*_densitymap.tif` (raster figure)
- `*_2table_all.csv` and `*_2table_all_SSIM.csv` (summary tables)

## Inputs (high-level)
The plotting functions expect:
- `zzz_data` : a cell array produced by your upstream pipeline
- `zzz_import` : path to a `99_all_data.mat` file containing simulation parameters and XY points

See `docs/input_schema.md` for the minimal required fields.

## Example output preview
Small previews are included in `examples/output_preview/` to show what the exported figures/tables look like.

> Recommendation: keep large result archives out of git history.  
> If you want to share full-resolution outputs (tens of MB per image), attach them to a **GitHub Release** or archive (e.g., Zenodo/OSF) and link from this README.

## License
MIT (see `LICENSE`).

## Citation
If you use this software, please cite it using `CITATION.cff`.
