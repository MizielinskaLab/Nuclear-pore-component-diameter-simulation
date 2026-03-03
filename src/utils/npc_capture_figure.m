function img = npc_capture_figure(figHandle)
%NPC_CAPTURE_FIGURE Capture current figure content as an RGB image (uint8).
%
% img = npc_capture_figure(gcf)
%
% This replaces third-party figure capture utilities (e.g., export_fig)
% when you need the rendered pixels for SSIM / image-based comparisons.

if nargin < 1 || isempty(figHandle); figHandle = gcf; end

% Ensure rendered
drawnow;

try
    fr = getframe(figHandle);
    img = fr.cdata;
catch
    % Fallback: capture axes if figure capture fails
    ax = findobj(figHandle,'Type','axes');
    if isempty(ax)
        error('No axes found to capture.');
    end
    fr = getframe(ax(1));
    img = fr.cdata;
end

% Ensure uint8 RGB
if ~isa(img,'uint8')
    img = im2uint8(img);
end
end
