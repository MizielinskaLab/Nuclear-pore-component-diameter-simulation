function check_dependencies(requireDetectionDeps)
%CHECK_DEPENDENCIES Check required third-party MATLAB files for this repository.
%   CHECK_DEPENDENCIES() checks all third-party files required for the
%   example repository package.
%
%   CHECK_DEPENDENCIES(false) checks only the dependencies needed for the
%   simulation workflow.
%
%   The following files are intentionally not redistributed in this public
%   repository because their original licenses or redistribution terms were
%   not confirmed for republication:
%       - trackmateSpots.m
%       - ReadImageJROI.m
%       - export_fig.m
%       - scatter_kde.m
%
%   Users should obtain these files from their original sources and place
%   them in the repository third_party/ folder, then add that folder to the
%   MATLAB path.

    if nargin < 1
        requireDetectionDeps = true;
    end

    commonDeps = {'export_fig.m'};
    detectionDeps = {'trackmateSpots.m', 'ReadImageJROI.m', 'scatter_kde.m'};

    missing = {};

    for i = 1:numel(commonDeps)
        if exist(commonDeps{i}, 'file') ~= 2
            missing{end+1} = commonDeps{i}; %#ok<AGROW>
        end
    end

    if requireDetectionDeps
        for i = 1:numel(detectionDeps)
            if exist(detectionDeps{i}, 'file') ~= 2
                missing{end+1} = detectionDeps{i}; %#ok<AGROW>
            end
        end
    end

    if ~isempty(missing)
        msg = sprintf([ ...
            'Missing third-party dependency file(s): %s\n\n' ...
            'These files are not redistributed in this public repository because redistribution permission was not confirmed.\n' ...
            'Please obtain them from their original sources, place them in third_party/, and add that folder to the MATLAB path.\n' ...
            'See README.md and DEPENDENCIES.md for details.'], ...
            strjoin(missing, ', '));
        error(msg);
    end
end
