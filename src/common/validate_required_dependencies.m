
function validate_required_dependencies(requireDetectionDeps)
%VALIDATE_REQUIRED_DEPENDENCIES Check third-party MATLAB files needed by this repo.
%   requireDetectionDeps=true also checks files required for experimental spot detection.
    if nargin < 1
        requireDetectionDeps = true;
    end

    commonDeps = {'export_fig.m'};
    detectionDeps = {'trackmateSpots.m', 'ReadImageJROI.m', 'scatter_kde.m'};

    missing = {};
    for i = 1:numel(commonDeps)
        if exist(commonDeps{i}, 'file') == 0
            missing{end+1} = commonDeps{i}; %#ok<AGROW>
        end
    end
    if requireDetectionDeps
        for i = 1:numel(detectionDeps)
            if exist(detectionDeps{i}, 'file') == 0
                missing{end+1} = detectionDeps{i}; %#ok<AGROW>
            end
        end
    end

    if ~isempty(missing)
        msg = sprintf(['Missing third-party dependency files: %s\n' ...
            'Place them in repo/third_party and add that folder to the MATLAB path.\n' ...
            'See DEPENDENCIES.md for details.'], strjoin(missing, ', '));
        error(msg);
    end
end
