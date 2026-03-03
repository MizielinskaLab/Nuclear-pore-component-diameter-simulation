% run_sim_comparison_template.m
%
% Template to generate comparison figures + summary tables for a single
% "experiment vs simulation" pair, using the functions in src/plot/.
%
% This repo does NOT ship lab-specific input .mat files. You must provide:
%   (1) zzz_data  : a cell array produced by your upstream pipeline
%   (2) zzz_import: path to a '99_all_data.mat' containing simulation parameters
%                  and raw XY points (see docs/input_schema.md)

clear; close all; clc;

% Add repo paths
repoRoot = fileparts(mfilename('fullpath'));
addpath(genpath(fullfile(repoRoot,'..','src')));

% -------------------------------------------------------------------------
% USER INPUTS (edit these)
% -------------------------------------------------------------------------

% A) Load / construct zzz_data
%    Example: load('my_zzz_data.mat','zzz_data');  % must exist in workspace
error('Please load or construct zzz_data (see docs/input_schema.md).');

% B) Import file produced by the diameter/hollow simulation stage
%    This file should contain variables like:
%      s_1FR_9inshp_um, s_2GR_9inshp_um, s_1FR_1diameter, s_1FR_2hallow, ...
zzz_import = 'path/to/99_all_data.mat';

% C) Naming tags used only for output filenames / figure titles
xxxn1 = '4DP015_F02';          % e.g. dataset tag
xxxn2 = '1GRserFRfix';         % e.g. condition tag
xxxn3 = '32';                  % e.g. experiment folder tag
xxxs  = 15;                    % optional, used only by some legacy naming

% D) Output folder
zzz_folder = fullfile(repoRoot,'..','output','example_run');
if ~exist(zzz_folder,'dir'); mkdir(zzz_folder); end

% -------------------------------------------------------------------------
% RUN (example: first entry)
% -------------------------------------------------------------------------
zzz = 1; % which row of zzz_data to plot
zzz_name = sprintf('example_%03d_', zzz);

% Choose either GF2 or GF3 style
sim_comparison_04gcLBB_jet_Lo3_GF2(zzz_data, zzz_folder, zzz_name, zzz, xxxn1, xxxn2, xxxn3, xxxs, zzz_import);
% sim_comparison_04gcLBB_jet_Lo3_GF3(zzz_data, zzz_folder, zzz_name, zzz, xxxn1, xxxn2, xxxn3, xxxs, zzz_import);

disp('Done. Check the output folder for .tif figures and .csv tables.');
