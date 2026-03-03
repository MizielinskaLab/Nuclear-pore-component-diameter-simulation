function npc_viscircles(centers, radii, varargin)
%NPC_VISCIRCLES Toolbox-friendly circle plotting.
%
% npc_viscircles([0 0], 0.06, 'Color','r','LineStyle',':')
%
% If Image Processing Toolbox is available, uses viscircles().
% Otherwise, falls back to plotting circles with line().
%
% This is included to keep the repo free from third-party plotting utilities.

if exist('viscircles','file') == 2
    viscircles(centers, radii, varargin{:});
    return;
end

% Simple fallback (supports scalar radius and a single center)
if size(centers,1) ~= 1
    error('npc_viscircles fallback supports one center at a time.');
end
if numel(radii) ~= 1
    error('npc_viscircles fallback supports a single radius.');
end

% Parse a few common parameters
color = 'r';
lineStyle = '-';
lineWidth = 1;
for k = 1:2:numel(varargin)
    key = varargin{k};
    if k+1 > numel(varargin); break; end
    val = varargin{k+1};
    switch lower(key)
        case 'color'
            color = val;
        case 'linestyle'
            lineStyle = val;
        case {'linewidth','linewdith'} % tolerate typo seen in some scripts
            lineWidth = val;
        otherwise
            % ignore unsupported params
    end
end

theta = linspace(0,2*pi,360);
x = centers(1) + radii*cos(theta);
y = centers(2) + radii*sin(theta);
line(x,y,'Color',color,'LineStyle',lineStyle,'LineWidth',lineWidth);
end
