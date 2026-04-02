
function run_spot_detection()
%RUN_SPOT_DETECTION Run experimental spot detection from the repository root.
    thisFile = mfilename('fullpath');
    repoRoot = fileparts(fileparts(thisFile));
    targetDir = fullfile(repoRoot, 'data', 'experimental');
    scriptPath = fullfile(repoRoot, 'src', 'spot_detection', 'Spot_detection.m');
    oldDir = pwd;
    cleanup = onCleanup(@() cd(oldDir));
    cd(targetDir);
    run(scriptPath);
end
