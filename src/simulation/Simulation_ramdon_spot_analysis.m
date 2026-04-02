
%%%%%%%%%%%%%%%%%%
% simulation batch runner (GitHub-ready wrapper)
%%%%%%%%%%%%%%%%%%%%%%%%%
repoRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(fullfile(repoRoot,'common'));
addpath(fileparts(mfilename('fullpath')));
check_dependencies(false);

ss1 = '01-Simulation-location';
ss2 = dir(fullfile(ss1, '*.mat'));
assert(~isempty(ss2), 'No simulation .mat files found in %s', fullfile(pwd, ss1));
for ss4 = 1:numel(ss2)
    sData = {fullfile(ss2(ss4).folder, ss2(ss4).name)};
    fprintf('Running simulation analysis for %s\n', ss2(ss4).name);
    Twocolour_NPCSimulation(sData, ss4)
end
