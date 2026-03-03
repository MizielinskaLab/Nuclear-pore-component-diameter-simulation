function npc_save_figure(figHandle, outPath, resolutionDPI)
%NPC_SAVE_FIGURE Save a figure to a raster file without third-party tools.
%
% npc_save_figure(gcf, 'output/myfig.tif', 300)
%
% Notes
% - Uses exportgraphics when available (R2020a+).
% - Falls back to print() if exportgraphics is unavailable.
% - Background transparency is best-effort; some MATLAB versions may ignore it.

if nargin < 1 || isempty(figHandle); figHandle = gcf; end
if nargin < 2 || isempty(outPath); error('outPath is required'); end
if nargin < 3 || isempty(resolutionDPI); resolutionDPI = 300; end

outDir = fileparts(outPath);
if ~isempty(outDir) && ~exist(outDir,'dir'); mkdir(outDir); end

try
    % Prefer exportgraphics (more consistent than print for many versions)
    if exist('exportgraphics','file') == 2
        exportgraphics(figHandle, outPath, ...
            'Resolution', resolutionDPI, ...
            'BackgroundColor', 'none');
        return;
    end
catch
    % fall through
end

% Fallback: print
try
    set(figHandle, 'PaperPositionMode', 'auto');
    [~,~,ext] = fileparts(outPath);
    if isempty(ext); ext = '.tif'; outPath = [outPath ext]; end
    print(figHandle, outPath, '-dtiff', ['-r' num2str(resolutionDPI)]);
catch ME
    error('Failed to save figure: %s', ME.message);
end
end
