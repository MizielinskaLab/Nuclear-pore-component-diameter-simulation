% legacy_example_calls.m
%
% This is a lightly cleaned excerpt based on:
%   LEE_13_20210908_SSIM__noR_SmTL_M1_M_Fix_FN_031F_03_only_2025.m
%
% It shows how the original workflow called sim_comparison_04gcLBB_jet_Lo3_*.
% The original script depended on many workspace variables created by the
% batch SSIM script (legacy_batch_ssim.m). For public sharing, this file is
% provided as a *reference only* and will not run as-is.

% Example (pseudo-code):
% repoRoot = fileparts(mfilename('fullpath'));
% addpath(genpath(fullfile(repoRoot,'..','src')));
%
% zzz_import = 'path/to/99_all_data.mat';
% xxxn1 = '4DP015_F02';
% xxxn2 = '1GRserFRfix'; xxxn3 = '32';
% zzz_data = xsss_2GR2_2GRFR_a15; % created upstream
% xxxs = 15;
% zzz_folder = fullfile(repoRoot,'..','output','example');
% mkdir(zzz_folder)
% for zzz = 1:2
%     zzz_name = sprintf('example_%03d_', zzz);
%     sim_comparison_04gcLBB_jet_Lo3_GF2(zzz_data, zzz_folder, zzz_name, zzz, xxxn1, xxxn2, xxxn3, xxxs, zzz_import);
% end
