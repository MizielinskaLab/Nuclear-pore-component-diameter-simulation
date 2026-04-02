# TrackMate and simulation notes

## TrackMate export settings
The original workflow note records the following TrackMate settings for the XML files imported into MATLAB:

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

These settings matter because the MATLAB scripts analyse the exported TrackMate XML output rather than performing independent spot detection inside MATLAB.

## Why the workflow order matters
The workflow is sequential:
1. prepare images;
2. define the ROI in ImageJ/FIJI;
3. export TrackMate XML in ImageJ/FIJI;
4. import ROI and XML into MATLAB;
5. run the experimental spot analysis;
6. analyse simulation-location files in MATLAB; and
7. compare experimental and simulated outputs.

## Simulation-location naming used in this package
Representative example:
- `1FR_D116H004_2GR_D180H010`

Meaning:
- `FR` = FarRed spot population
- `GR` = Green spot population
- `D` = outer diameter of the allowed random-position region
- `H` = hollow inner diameter excluded from the centre

For this example:
- FR spots are distributed randomly within **4-116 nm diameter**
- GR spots are distributed randomly within **10-180 nm diameter**

When expressed from the centre as radius:
- FR = **2-58 nm radius**
- GR = **5-90 nm radius**

The filename therefore stores the geometry in diameter units, while the same geometry can also be described radially by halving those values.
