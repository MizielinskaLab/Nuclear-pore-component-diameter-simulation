
function run_simulation_batch()
%RUN_SIMULATION_BATCH Run simulation analysis from the repository root.
    thisFile = mfilename('fullpath');
    repoRoot = fileparts(thisFile);
    repoRoot = fileparts(repoRoot);
    targetDir = fullfile(repoRoot, 'data', 'simulation');
    scriptPath = fullfile(repoRoot, 'src', 'simulation', 'Simulation_ramdon_spot_analysis.m');
    oldDir = pwd;
    cleanup = onCleanup(@() cd(oldDir));
    cd(targetDir);
    run(scriptPath);
end
