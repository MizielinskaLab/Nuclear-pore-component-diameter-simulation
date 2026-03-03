%%%%%%%%%%%%%%%%%%%%%%%%%%%
% similirity
% zz_ssimval = ssim(zz,zz4)
%%%%%%%%%%%%%%%%%%%%%%%%
% pause(3600);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
tt1 = datetime('now');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%
beep off; 
warning off;
% Stop exponential answers
format long g
% Figure hide
set(0,'DefaultFigureVisible','off');
% set(gcf,'visible','on')

%%%%%%%%%%%%%%%%%%%%%%
% Image saving order number
zzzN = 2;

%%%%%%%%%%%%%%%%%%%%%%%
% Save location
zFolderSave = '41-SSIM-SD000-Direct_003';
mkdir(zFolderSave);
%%%%%%%%%
% focused file location
%%%%%%%%%%%%%
% DP020 / SD000
a01 = '*FRserGRfix*DP020*SD000*.mat';
a02 = '*FRserGRfix*DP020*SD000*.mat';
a03 = '*FRserGRfix*DP025*SD000*.mat';
a04 = '*FRserGRfix*DP025*SD000*.mat';
a05 = '*FRserGRfix*DP015*SD000*.mat';
a06 = '*FRserGRfix*DP015*SD000*.mat';
%%%%
a11 = '*GRserFRfix*DP020*SD000*.mat';
a12 = '*GRserFRfix*DP020*SD000*.mat';
a13 = '*GRserFRfix*DP025*SD000*.mat';
a14 = '*GRserFRfix*DP025*SD000*.mat';
a15 = '*GRserFRfix*DP015*SD000*.mat';
a16 = '*GRserFRfix*DP015*SD000*.mat';
%%%%
a21 = '*17_matching_distance_nm.mat';
%%%%
b01 = '42-Heatmap_Densioty-2R090';
% b02 = '42-Heatmap_Densioty-2R090';
% b03 = '42-Heatmap_Densioty-4R080';
%%%%
b11 = '11-Table-2R090';
% b12 = '11-Table-2R090';
% b13 = '11-Table-4R080';
%%%%
% c01 = '82_Spot_count__FG_GR_CANDLE_M03_2MD120__320_SEL_0median';
c02 = '116_1FRA_12_40__2FRGR_50_99_Spot_count___CANDLE_2MD120_320_SEL_3d20';
% c03 = '82_Spot_count__FG_GR_CANDLE_M03_2MD120__320_SEL_3d20';
%%%%
d01 = '31-CS-IMM-OxEA-CON-14';
d02 = '32-CS-IMM-OxEA-GR2-15';
%%%%%%%%%%%%%%%%%%%
dataRoot = ''; % TODO: set your local data root (see docs)
e01 = fullfile(dataRoot,'012-IMM-DPR-All');

%%%%%%%%%
% simulation
e02 = fullfile(dataRoot,'031-Simulation');
d03 = '35-Direct_003';
c99 = '*SIM_rand*';
b99 = '21-Heatmap_Densioty';
b98 = '11-Table';
% %%%%%
% a01 = '*FRserGRfix*DP020*SD000*.mat';
% a02 = '*FRserGRfix*DP020*SD000*.mat';
% a03 = '*FRserGRfix*DP025*SD000*.mat';
% a04 = '*FRserGRfix*DP025*SD000*.mat';
% a05 = '*FRserGRfix*DP015*SD000*.mat';
% a06 = '*FRserGRfix*DP015*SD000*.mat';
% %%%%
% a11 = '*GRserFRfix*DP020*SD000*.mat';
% a12 = '*GRserFRfix*DP020*SD000*.mat';
% a13 = '*GRserFRfix*DP025*SD000*.mat';
% a14 = '*GRserFRfix*DP025*SD000*.mat';
% a15 = '*GRserFRfix*DP015*SD000*.mat';
% a16 = '*GRserFRfix*DP015*SD000*.mat';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f0101 = [e01 '\' d01 '\' c02 '\' b01 '\' a01];
f0102 = [e01 '\' d01 '\' c02 '\' b01 '\' a02];
f0103 = [e01 '\' d01 '\' c02 '\' b01 '\' a03];
f0104 = [e01 '\' d01 '\' c02 '\' b01 '\' a04];
f0105 = [e01 '\' d01 '\' c02 '\' b01 '\' a05];
f0106 = [e01 '\' d01 '\' c02 '\' b01 '\' a06];
%%%%
f1101 = [e01 '\' d02 '\' c02 '\' b01 '\' a01];
f1102 = [e01 '\' d02 '\' c02 '\' b01 '\' a02];
f1103 = [e01 '\' d02 '\' c02 '\' b01 '\' a03];
f1104 = [e01 '\' d02 '\' c02 '\' b01 '\' a04];
f1105 = [e01 '\' d02 '\' c02 '\' b01 '\' a05];
f1106 = [e01 '\' d02 '\' c02 '\' b01 '\' a06];
%%%%%%%
%%%%%%%
g0101 = [e01 '\' d01 '\' c02 '\' b01 '\' a11];
g0102 = [e01 '\' d01 '\' c02 '\' b01 '\' a12];
g0103 = [e01 '\' d01 '\' c02 '\' b01 '\' a13];
g0104 = [e01 '\' d01 '\' c02 '\' b01 '\' a14];
g0105 = [e01 '\' d01 '\' c02 '\' b01 '\' a15];
g0106 = [e01 '\' d01 '\' c02 '\' b01 '\' a16];
%%%%
g1101 = [e01 '\' d02 '\' c02 '\' b01 '\' a11];
g1102 = [e01 '\' d02 '\' c02 '\' b01 '\' a12];
g1103 = [e01 '\' d02 '\' c02 '\' b01 '\' a13];
g1104 = [e01 '\' d02 '\' c02 '\' b01 '\' a14];
g1105 = [e01 '\' d02 '\' c02 '\' b01 '\' a15];
g1106 = [e01 '\' d02 '\' c02 '\' b01 '\' a16];
%%%%
h0101 = [e01 '\' d01 '\' c02 '\' b11 '\' a21];
h1101 = [e01 '\' d02 '\' c02 '\' b11 '\' a21];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
t1_ass_f0101 = dir(f0101);
t1_assCell_f0101 = struct2cell(t1_ass_f0101)';
t1_aFullPath_f0101 = t1_ass_f0101.folder;  
t1_aFullPathName_f0101 = [t1_aFullPath_f0101 '\' t1_ass_f0101.name];
%%%
t1_ass_f0102 = dir(f0102);
t1_assCell_f0102 = struct2cell(t1_ass_f0102)';
t1_aFullPath_f0102 = t1_ass_f0102.folder;  
t1_aFullPathName_f0102 = [t1_aFullPath_f0102 '\' t1_ass_f0102.name];
%%%
t1_ass_f0103 = dir(f0103);
t1_assCell_f0103 = struct2cell(t1_ass_f0103)';
t1_aFullPath_f0103 = t1_ass_f0103.folder;  
t1_aFullPathName_f0103 = [t1_aFullPath_f0103 '\' t1_ass_f0103.name];
%%%
t1_ass_f0104 = dir(f0104);
t1_assCell_f0104 = struct2cell(t1_ass_f0104)';
t1_aFullPath_f0104 = t1_ass_f0104.folder;  
t1_aFullPathName_f0104 = [t1_aFullPath_f0104 '\' t1_ass_f0104.name];
%%%
t1_ass_f0105 = dir(f0105);
t1_assCell_f0105 = struct2cell(t1_ass_f0105)';
t1_aFullPath_f0105 = t1_ass_f0105.folder;  
t1_aFullPathName_f0105 = [t1_aFullPath_f0105 '\' t1_ass_f0105.name];
%%%
t1_ass_f0106 = dir(f0106);
t1_assCell_f0106 = struct2cell(t1_ass_f0106)';
t1_aFullPath_f0106 = t1_ass_f0106.folder;  
t1_aFullPathName_f0106 = [t1_aFullPath_f0106 '\' t1_ass_f0106.name];
%%%
t1_ass_f1101 = dir(f1101);
t1_assCell_f1101 = struct2cell(t1_ass_f1101)';
t1_aFullPath_f1101 = t1_ass_f1101.folder;  
t1_aFullPathName_f1101 = [t1_aFullPath_f1101 '\' t1_ass_f1101.name];
%%%
t1_ass_f1102 = dir(f1102);
t1_assCell_f1102 = struct2cell(t1_ass_f1102)';
t1_aFullPath_f1102 = t1_ass_f1102.folder;  
t1_aFullPathName_f1102 = [t1_aFullPath_f1102 '\' t1_ass_f1102.name];
%%%
t1_ass_f1103 = dir(f1103);
t1_assCell_f1103 = struct2cell(t1_ass_f1103)';
t1_aFullPath_f1103 = t1_ass_f1103.folder;  
t1_aFullPathName_f1103 = [t1_aFullPath_f1103 '\' t1_ass_f1103.name];
%%%
t1_ass_f1104 = dir(f1104);
t1_assCell_f1104 = struct2cell(t1_ass_f1104)';
t1_aFullPath_f1104 = t1_ass_f1104.folder;  
t1_aFullPathName_f1104 = [t1_aFullPath_f1104 '\' t1_ass_f1104.name];
%%%
t1_ass_f1105 = dir(f1105);
t1_assCell_f1105 = struct2cell(t1_ass_f1105)';
t1_aFullPath_f1105 = t1_ass_f1105.folder;  
t1_aFullPathName_f1105 = [t1_aFullPath_f1105 '\' t1_ass_f1105.name];
%%%
t1_ass_f1106 = dir(f1106);
t1_assCell_f1106 = struct2cell(t1_ass_f1106)';
t1_aFullPath_f1106 = t1_ass_f1106.folder;  
t1_aFullPathName_f1106 = [t1_aFullPath_f1106 '\' t1_ass_f1106.name];
%%%
t1_ass_g0101 = dir(g0101);
t1_assCell_g0101 = struct2cell(t1_ass_g0101)';
t1_aFullPath_g0101 = t1_ass_g0101.folder;  
t1_aFullPathName_g0101 = [t1_aFullPath_g0101 '\' t1_ass_g0101.name];
%%%
t1_ass_g0102 = dir(g0102);
t1_assCell_g0102 = struct2cell(t1_ass_g0102)';
t1_aFullPath_g0102 = t1_ass_g0102.folder;  
t1_aFullPathName_g0102 = [t1_aFullPath_g0102 '\' t1_ass_g0102.name];
%%%
t1_ass_g0103 = dir(g0103);
t1_assCell_g0103 = struct2cell(t1_ass_g0103)';
t1_aFullPath_g0103 = t1_ass_g0103.folder;  
t1_aFullPathName_g0103 = [t1_aFullPath_g0103 '\' t1_ass_g0103.name];
%%%
t1_ass_g0104 = dir(g0104);
t1_assCell_g0104 = struct2cell(t1_ass_g0104)';
t1_aFullPath_g0104 = t1_ass_g0104.folder;  
t1_aFullPathName_g0104 = [t1_aFullPath_g0104 '\' t1_ass_g0104.name];
%%%
t1_ass_g0105 = dir(g0105);
t1_assCell_g0105 = struct2cell(t1_ass_g0105)';
t1_aFullPath_g0105 = t1_ass_g0105.folder;  
t1_aFullPathName_g0105 = [t1_aFullPath_g0105 '\' t1_ass_g0105.name];
%%%
t1_ass_g0106 = dir(g0106);
t1_assCell_g0106 = struct2cell(t1_ass_g0106)';
t1_aFullPath_g0106 = t1_ass_g0106.folder;  
t1_aFullPathName_g0106 = [t1_aFullPath_g0106 '\' t1_ass_g0106.name];
%%%
t1_ass_g1101 = dir(g1101);
t1_assCell_g1101 = struct2cell(t1_ass_g1101)';
t1_aFullPath_g1101 = t1_ass_g1101.folder;  
t1_aFullPathName_g1101 = [t1_aFullPath_g1101 '\' t1_ass_g1101.name];
%%%
t1_ass_g1102 = dir(g1102);
t1_assCell_g1102 = struct2cell(t1_ass_g1102)';
t1_aFullPath_g1102 = t1_ass_g1102.folder;  
t1_aFullPathName_g1102 = [t1_aFullPath_g1102 '\' t1_ass_g1102.name];
%%%
t1_ass_g1103 = dir(g1103);
t1_assCell_g1103 = struct2cell(t1_ass_g1103)';
t1_aFullPath_g1103 = t1_ass_g1103.folder;  
t1_aFullPathName_g1103 = [t1_aFullPath_g1103 '\' t1_ass_g1103.name];
%%%
t1_ass_g1104 = dir(g1104);
t1_assCell_g1104 = struct2cell(t1_ass_g1104)';
t1_aFullPath_g1104 = t1_ass_g1104.folder;  
t1_aFullPathName_g1104 = [t1_aFullPath_g1104 '\' t1_ass_g1104.name];
%%%
t1_ass_g1105 = dir(g1105);
t1_assCell_g1105 = struct2cell(t1_ass_g1105)';
t1_aFullPath_g1105 = t1_ass_g1105.folder;  
t1_aFullPathName_g1105 = [t1_aFullPath_g1105 '\' t1_ass_g1105.name];
%%%
t1_ass_g1106 = dir(g1106);
t1_assCell_g1106 = struct2cell(t1_ass_g1106)';
t1_aFullPath_g1106 = t1_ass_g1106.folder;  
t1_aFullPathName_g1106 = [t1_aFullPath_g1106 '\' t1_ass_g1106.name];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t1_ass_h0101 = dir(h0101);
t1_assCell_h0101 = struct2cell(t1_ass_h0101)';
t1_aFullPath_h0101 = t1_ass_h0101.folder;  
t1_aFullPathName_h0101 = [t1_aFullPath_h0101 '\' t1_ass_h0101.name];
%%%
t1_ass_h1101 = dir(h1101);
t1_assCell_h1101 = struct2cell(t1_ass_h1101)';
t1_aFullPath_h1101 = t1_ass_h1101.folder;  
t1_aFullPathName_h1101 = [t1_aFullPath_h1101 '\' t1_ass_h1101.name];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%
t2_f0101_1IR = importdata(t1_aFullPathName_f0101);
t2_f0101_2LO = t1_aFullPathName_f0101;
t2_f0101_3MD = importdata(t1_aFullPathName_h0101);
t3_f0101_A = {t2_f0101_1IR,t2_f0101_2LO,t2_f0101_3MD};
%%%
t2_f0102_1IR = importdata(t1_aFullPathName_f0102);
t2_f0102_2LO = t1_aFullPathName_f0102;
t2_f0102_3MD = importdata(t1_aFullPathName_h0101);
t3_f0102_A = {t2_f0102_1IR,t2_f0102_2LO,t2_f0102_3MD};
%%%
t2_f0103_1IR = importdata(t1_aFullPathName_f0103);
t2_f0103_2LO = t1_aFullPathName_f0103;
t2_f0103_3MD = importdata(t1_aFullPathName_h0101);
t3_f0103_A = {t2_f0103_1IR,t2_f0103_2LO,t2_f0103_3MD};
%%%
t2_f0104_1IR = importdata(t1_aFullPathName_f0104);
t2_f0104_2LO = t1_aFullPathName_f0104;
t2_f0104_3MD = importdata(t1_aFullPathName_h0101);
t3_f0104_A = {t2_f0104_1IR,t2_f0104_2LO,t2_f0104_3MD};
%%%
t2_f0105_1IR = importdata(t1_aFullPathName_f0105);
t2_f0105_2LO = t1_aFullPathName_f0105;
t2_f0105_3MD = importdata(t1_aFullPathName_h0101);
t3_f0105_A = {t2_f0105_1IR,t2_f0105_2LO,t2_f0105_3MD};
%%%
t2_f0106_1IR = importdata(t1_aFullPathName_f0106);
t2_f0106_2LO = t1_aFullPathName_f0106;
t2_f0106_3MD = importdata(t1_aFullPathName_h0101);
t3_f0106_A = {t2_f0106_1IR,t2_f0106_2LO,t2_f0106_3MD};
%%%%%%%%%%
%%%%%
t2_f1101_1IR = importdata(t1_aFullPathName_f1101);
t2_f1101_2LO = t1_aFullPathName_f1101;
t2_f1101_3MD = importdata(t1_aFullPathName_h1101);
t3_f1101_A = {t2_f1101_1IR,t2_f1101_2LO,t2_f1101_3MD};
%%%
t2_f1102_1IR = importdata(t1_aFullPathName_f1102);
t2_f1102_2LO = t1_aFullPathName_f1102;
t2_f1102_3MD = importdata(t1_aFullPathName_h1101);
t3_f1102_A = {t2_f1102_1IR,t2_f1102_2LO,t2_f1102_3MD};
%%%
t2_f1103_1IR = importdata(t1_aFullPathName_f1103);
t2_f1103_2LO = t1_aFullPathName_f1103;
t2_f1103_3MD = importdata(t1_aFullPathName_h1101);
t3_f1103_A = {t2_f1103_1IR,t2_f1103_2LO,t2_f1103_3MD};
%%%
t2_f1104_1IR = importdata(t1_aFullPathName_f1104);
t2_f1104_2LO = t1_aFullPathName_f1104;
t2_f1104_3MD = importdata(t1_aFullPathName_h1101);
t3_f1104_A = {t2_f1104_1IR,t2_f1104_2LO,t2_f1104_3MD};
%%%
t2_f1105_1IR = importdata(t1_aFullPathName_f1105);
t2_f1105_2LO = t1_aFullPathName_f1105;
t2_f1105_3MD = importdata(t1_aFullPathName_h1101);
t3_f1105_A = {t2_f1105_1IR,t2_f1105_2LO,t2_f1105_3MD};
%%%
t2_f1106_1IR = importdata(t1_aFullPathName_f1106);
t2_f1106_2LO = t1_aFullPathName_f1106;
t2_f1106_3MD = importdata(t1_aFullPathName_h1101);
t3_f1106_A = {t2_f1106_1IR,t2_f1106_2LO,t2_f1106_3MD};
%%%%%%%%%%
%%%%%
t2_g0101_1IR = importdata(t1_aFullPathName_g0101);
t2_g0101_2LO = t1_aFullPathName_g0101;
t2_g0101_3MD = importdata(t1_aFullPathName_h0101);
t3_g0101_A = {t2_g0101_1IR,t2_g0101_2LO,t2_g0101_3MD};
%%%
t2_g0102_1IR = importdata(t1_aFullPathName_g0102);
t2_g0102_2LO = t1_aFullPathName_g0102;
t2_g0102_3MD = importdata(t1_aFullPathName_h0101);
t3_g0102_A = {t2_g0102_1IR,t2_g0102_2LO,t2_g0102_3MD};
%%%
t2_g0103_1IR = importdata(t1_aFullPathName_g0103);
t2_g0103_2LO = t1_aFullPathName_g0103;
t2_g0103_3MD = importdata(t1_aFullPathName_h0101);
t3_g0103_A = {t2_g0103_1IR,t2_g0103_2LO,t2_g0103_3MD};
%%%
t2_g0104_1IR = importdata(t1_aFullPathName_g0104);
t2_g0104_2LO = t1_aFullPathName_g0104;
t2_g0104_3MD = importdata(t1_aFullPathName_h0101);
t3_g0104_A = {t2_g0104_1IR,t2_g0104_2LO,t2_g0104_3MD};
%%%
t2_g0105_1IR = importdata(t1_aFullPathName_g0105);
t2_g0105_2LO = t1_aFullPathName_g0105;
t2_g0105_3MD = importdata(t1_aFullPathName_h0101);
t3_g0105_A = {t2_g0105_1IR,t2_g0105_2LO,t2_g0105_3MD};
%%%
t2_g0106_1IR = importdata(t1_aFullPathName_g0106);
t2_g0106_2LO = t1_aFullPathName_g0106;
t2_g0106_3MD = importdata(t1_aFullPathName_h0101);
t3_g0106_A = {t2_g0106_1IR,t2_g0106_2LO,t2_g0106_3MD};
%%%%%%%%%%
%%%%%
t2_g1101_1IR = importdata(t1_aFullPathName_g1101);
t2_g1101_2LO = t1_aFullPathName_g1101;
t2_g1101_3MD = importdata(t1_aFullPathName_h1101);
t3_g1101_A = {t2_g1101_1IR,t2_g1101_2LO,t2_g1101_3MD};
%%%
t2_g1102_1IR = importdata(t1_aFullPathName_g1102);
t2_g1102_2LO = t1_aFullPathName_g1102;
t2_g1102_3MD = importdata(t1_aFullPathName_h1101);
t3_g1102_A = {t2_g1102_1IR,t2_g1102_2LO,t2_g1102_3MD};
%%%
t2_g1103_1IR = importdata(t1_aFullPathName_g1103);
t2_g1103_2LO = t1_aFullPathName_g1103;
t2_g1103_3MD = importdata(t1_aFullPathName_h1101);
t3_g1103_A = {t2_g1103_1IR,t2_g1103_2LO,t2_g1103_3MD};
%%%
t2_g1104_1IR = importdata(t1_aFullPathName_g1104);
t2_g1104_2LO = t1_aFullPathName_g1104;
t2_g1104_3MD = importdata(t1_aFullPathName_h1101);
t3_g1104_A = {t2_g1104_1IR,t2_g1104_2LO,t2_g1104_3MD};
%%%
t2_g1105_1IR = importdata(t1_aFullPathName_g1105);
t2_g1105_2LO = t1_aFullPathName_g1105;
t2_g1105_3MD = importdata(t1_aFullPathName_h1101);
t3_g1105_A = {t2_g1105_1IR,t2_g1105_2LO,t2_g1105_3MD};
%%%
t2_g1106_1IR = importdata(t1_aFullPathName_g1106);
t2_g1106_2LO = t1_aFullPathName_g1106;
t2_g1106_3MD = importdata(t1_aFullPathName_h1101);
t3_g1106_A = {t2_g1106_1IR,t2_g1106_2LO,t2_g1106_3MD};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation result
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01 = '*FRserGRfix*DP020*SD000*.mat';
% a02 = '*FRserGRfix*DP020*SD000*.mat';
% a03 = '*FRserGRfix*DP025*SD000*.mat';
% a04 = '*FRserGRfix*DP025*SD000*.mat';
% a05 = '*FRserGRfix*DP015*SD000*.mat';
% a06 = '*FRserGRfix*DP015*SD000*.mat';
% %%%%
% a11 = '*GRserFRfix*DP020*SD000*.mat';
% a12 = '*GRserFRfix*DP020*SD000*.mat';
% a13 = '*GRserFRfix*DP025*SD000*.mat';
% a14 = '*GRserFRfix*DP025*SD000*.mat';
% a15 = '*GRserFRfix*DP015*SD000*.mat';
% a16 = '*GRserFRfix*DP015*SD000*.mat';
%%%%%
% a21 = '*17_matching_distance_nm.mat';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Location
s0000 = [e02 '\' d03 '\' c99];
s0001 = '21-Heatmap_Densioty';
s0002 = '11-Table';
s0003 = '99_all_data.mat';
%%%%
s1_ass_s0000 = dir(s0000);
s1_assCell_s0000 = struct2cell(s1_ass_s0000)';
s1_aFullPath_s0000 = s1_ass_s0000.folder;  
s1_aFullPathName_s0000 = s1_assCell_s0000(:,1);
%%%%%%%%%%%
% import data
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s0_ass_000_name{ss1,1} = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0003];
end
%%%%%%%%%%
% a01
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a01];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a01{ss1,1} = s2_ass_001;
    s3_ass_a01{ss1,2} = s2_ass_002;
    s3_ass_a01{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a02
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a02];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a02{ss1,1} = s2_ass_001;
    s3_ass_a02{ss1,2} = s2_ass_002;
    s3_ass_a02{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a03
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a03];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a03{ss1,1} = s2_ass_001;
    s3_ass_a03{ss1,2} = s2_ass_002;
    s3_ass_a03{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a04
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a04];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a04{ss1,1} = s2_ass_001;
    s3_ass_a04{ss1,2} = s2_ass_002;
    s3_ass_a04{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a05
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a05];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a05{ss1,1} = s2_ass_001;
    s3_ass_a05{ss1,2} = s2_ass_002;
    s3_ass_a05{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a06
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a06];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a06{ss1,1} = s2_ass_001;
    s3_ass_a06{ss1,2} = s2_ass_002;
    s3_ass_a06{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%
% a11
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a11];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a11{ss1,1} = s2_ass_001;
    s3_ass_a11{ss1,2} = s2_ass_002;
    s3_ass_a11{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a12
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a12];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a12{ss1,1} = s2_ass_001;
    s3_ass_a12{ss1,2} = s2_ass_002;
    s3_ass_a12{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a13
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a13];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a13{ss1,1} = s2_ass_001;
    s3_ass_a13{ss1,2} = s2_ass_002;
    s3_ass_a13{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a14
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a14];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a14{ss1,1} = s2_ass_001;
    s3_ass_a14{ss1,2} = s2_ass_002;
    s3_ass_a14{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a15
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a15];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a15{ss1,1} = s2_ass_001;
    s3_ass_a15{ss1,2} = s2_ass_002;
    s3_ass_a15{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end
%%%%%%%%%%
% a16
for ss1 = 1:numel(s1_aFullPathName_s0000)
    s1_ass_001 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0001 '\' a16];
    s1_ass_011 = dir(s1_ass_001);
    s1_ass_012 = struct2cell(s1_ass_011)';
    s1_ass_013 = s1_ass_011.folder; 
    s1_ass_014 = [s1_ass_013 '\' s1_ass_011.name];
    %%%%
    s1_ass_101 = [e02 '\' d03 '\' s1_aFullPathName_s0000{ss1,:} '\' s0002 '\' a21];
    s1_ass_111 = dir(s1_ass_101);
    s1_ass_112 = struct2cell(s1_ass_111)';
    s1_ass_113 = s1_ass_111.folder; 
    s1_ass_114 = [s1_ass_113 '\' s1_ass_111.name];
    %%%%
    s2_ass_001  = importdata(s1_ass_014);
    s2_ass_002  = s1_ass_014;
    s2_ass_003  = importdata(s1_ass_114);
    %%%%
    s3_ass_a16{ss1,1} = s2_ass_001;
    s3_ass_a16{ss1,2} = s2_ass_002;
    s3_ass_a16{ss1,3} = s2_ass_003;
    
    clear s2_ass_001 s2_ass_002 s2_ass_003
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% All data
%%%%%%%%%%%%%%
% experiments
%%%%%%%%%%%%%%%
% Control
%%%%%%%%%%%%%%%%%%%%%%
% a01-a06
x1CON_1FRGR_ass_a01 = [t3_f0101_A];
x1CON_1FRGR_ass_a02 = [t3_f0102_A];
x1CON_1FRGR_ass_a03 = [t3_f0103_A];
x1CON_1FRGR_ass_a04 = [t3_f0104_A];
x1CON_1FRGR_ass_a05 = [t3_f0105_A];
x1CON_1FRGR_ass_a06 = [t3_f0106_A];
%%%%
x1CON_2GRFR_ass_a11 = [t3_g0101_A];
x1CON_2GRFR_ass_a12 = [t3_g0102_A];
x1CON_2GRFR_ass_a13 = [t3_g0103_A];
x1CON_2GRFR_ass_a14 = [t3_g0104_A];
x1CON_2GRFR_ass_a15 = [t3_g0105_A];
x1CON_2GRFR_ass_a16 = [t3_g0106_A];
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
% GR20
x2GR2_1FRGR_ass_a01 = [t3_f1101_A];
x2GR2_1FRGR_ass_a02 = [t3_f1102_A];
x2GR2_1FRGR_ass_a03 = [t3_f1103_A];
x2GR2_1FRGR_ass_a04 = [t3_f1104_A];
x2GR2_1FRGR_ass_a05 = [t3_f1105_A];
x2GR2_1FRGR_ass_a06 = [t3_f1106_A];
%%%%%%%%%%%%
x2GR2_2GRFR_ass_a11 = [t3_g1101_A];
x2GR2_2GRFR_ass_a12 = [t3_g1102_A];
x2GR2_2GRFR_ass_a13 = [t3_g1103_A];
x2GR2_2GRFR_ass_a14 = [t3_g1104_A];
x2GR2_2GRFR_ass_a15 = [t3_g1105_A];
x2GR2_2GRFR_ass_a16 = [t3_g1106_A];
%%%%
%%%%%%%%%%%%%%%%
% Simulation
x3SIM_1FRGR_ass_a01 = s3_ass_a01;
x3SIM_1FRGR_ass_a02 = s3_ass_a02;
x3SIM_1FRGR_ass_a03 = s3_ass_a03;
x3SIM_1FRGR_ass_a04 = s3_ass_a04;
x3SIM_1FRGR_ass_a05 = s3_ass_a05;
x3SIM_1FRGR_ass_a06 = s3_ass_a06;
%%%%%
x3SIM_2GRFR_ass_a11 = s3_ass_a11;
x3SIM_2GRFR_ass_a12 = s3_ass_a12;
x3SIM_2GRFR_ass_a13 = s3_ass_a13;
x3SIM_2GRFR_ass_a14 = s3_ass_a14;
x3SIM_2GRFR_ass_a15 = s3_ass_a15;
x3SIM_2GRFR_ass_a16 = s3_ass_a16;

%%%%%%%%%%%%%%%%%%%%
% add import location
x3SIM_1FRGR_ass_a01(:,5) = s0_ass_000_name;
x3SIM_1FRGR_ass_a02(:,5) = s0_ass_000_name;
x3SIM_1FRGR_ass_a03(:,5) = s0_ass_000_name;
x3SIM_1FRGR_ass_a04(:,5) = s0_ass_000_name;
x3SIM_1FRGR_ass_a05(:,5) = s0_ass_000_name;
x3SIM_1FRGR_ass_a06(:,5) = s0_ass_000_name;
%%%
x3SIM_2GRFR_ass_a11(:,5) = s0_ass_000_name;
x3SIM_2GRFR_ass_a12(:,5) = s0_ass_000_name;
x3SIM_2GRFR_ass_a13(:,5) = s0_ass_000_name;
x3SIM_2GRFR_ass_a14(:,5) = s0_ass_000_name;
x3SIM_2GRFR_ass_a15(:,5) = s0_ass_000_name;
x3SIM_2GRFR_ass_a16(:,5) = s0_ass_000_name;

%%%%%%%%%%%%%%%%%%%%%%%%
% SSIM to grey scale + length
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % set(gcf,'visible','on')
 for xx1 = 1:numel(x1CON_1FRGR_ass_a01(:,1))
        pcolor(x1CON_1FRGR_ass_a01{xx1,1}{1,1},x1CON_1FRGR_ass_a01{xx1,1}{1,2},x1CON_1FRGR_ass_a01{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a01{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_1FRGR_ass_a02(:,1))
        pcolor(x1CON_1FRGR_ass_a02{xx1,1}{1,1},x1CON_1FRGR_ass_a02{xx1,1}{1,2},x1CON_1FRGR_ass_a02{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a02{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_1FRGR_ass_a03(:,1))
        pcolor(x1CON_1FRGR_ass_a03{xx1,1}{1,1},x1CON_1FRGR_ass_a03{xx1,1}{1,2},x1CON_1FRGR_ass_a03{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a03{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_1FRGR_ass_a04(:,1))
        pcolor(x1CON_1FRGR_ass_a04{xx1,1}{1,1},x1CON_1FRGR_ass_a04{xx1,1}{1,2},x1CON_1FRGR_ass_a04{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a04{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_1FRGR_ass_a05(:,1))
        pcolor(x1CON_1FRGR_ass_a05{xx1,1}{1,1},x1CON_1FRGR_ass_a05{xx1,1}{1,2},x1CON_1FRGR_ass_a05{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a05{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_1FRGR_ass_a06(:,1))
        pcolor(x1CON_1FRGR_ass_a06{xx1,1}{1,1},x1CON_1FRGR_ass_a06{xx1,1}{1,2},x1CON_1FRGR_ass_a06{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_1FRGR_ass_a06{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a11(:,1))
        pcolor(x1CON_2GRFR_ass_a11{xx1,1}{1,1},x1CON_2GRFR_ass_a11{xx1,1}{1,2},x1CON_2GRFR_ass_a11{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a11{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a12(:,1))
        pcolor(x1CON_2GRFR_ass_a12{xx1,1}{1,1},x1CON_2GRFR_ass_a12{xx1,1}{1,2},x1CON_2GRFR_ass_a12{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a12{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a13(:,1))
        pcolor(x1CON_2GRFR_ass_a13{xx1,1}{1,1},x1CON_2GRFR_ass_a13{xx1,1}{1,2},x1CON_2GRFR_ass_a13{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a13{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a14(:,1))
        pcolor(x1CON_2GRFR_ass_a14{xx1,1}{1,1},x1CON_2GRFR_ass_a14{xx1,1}{1,2},x1CON_2GRFR_ass_a14{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a14{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a15(:,1))
        pcolor(x1CON_2GRFR_ass_a15{xx1,1}{1,1},x1CON_2GRFR_ass_a15{xx1,1}{1,2},x1CON_2GRFR_ass_a15{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a15{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x1CON_2GRFR_ass_a16(:,1))
        pcolor(x1CON_2GRFR_ass_a16{xx1,1}{1,1},x1CON_2GRFR_ass_a16{xx1,1}{1,2},x1CON_2GRFR_ass_a16{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x1CON_2GRFR_ass_a16{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a01(:,1))
        pcolor(x2GR2_1FRGR_ass_a01{xx1,1}{1,1},x2GR2_1FRGR_ass_a01{xx1,1}{1,2},x2GR2_1FRGR_ass_a01{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a01{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a02(:,1))
        pcolor(x2GR2_1FRGR_ass_a02{xx1,1}{1,1},x2GR2_1FRGR_ass_a02{xx1,1}{1,2},x2GR2_1FRGR_ass_a02{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a02{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a03(:,1))
        pcolor(x2GR2_1FRGR_ass_a03{xx1,1}{1,1},x2GR2_1FRGR_ass_a03{xx1,1}{1,2},x2GR2_1FRGR_ass_a03{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a03{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a04(:,1))
        pcolor(x2GR2_1FRGR_ass_a04{xx1,1}{1,1},x2GR2_1FRGR_ass_a04{xx1,1}{1,2},x2GR2_1FRGR_ass_a04{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a04{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a05(:,1))
        pcolor(x2GR2_1FRGR_ass_a05{xx1,1}{1,1},x2GR2_1FRGR_ass_a05{xx1,1}{1,2},x2GR2_1FRGR_ass_a05{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a05{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_1FRGR_ass_a06(:,1))
        pcolor(x2GR2_1FRGR_ass_a06{xx1,1}{1,1},x2GR2_1FRGR_ass_a06{xx1,1}{1,2},x2GR2_1FRGR_ass_a06{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_1FRGR_ass_a06{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a11(:,1))
        pcolor(x2GR2_2GRFR_ass_a11{xx1,1}{1,1},x2GR2_2GRFR_ass_a11{xx1,1}{1,2},x2GR2_2GRFR_ass_a11{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a11{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a12(:,1))
        pcolor(x2GR2_2GRFR_ass_a12{xx1,1}{1,1},x2GR2_2GRFR_ass_a12{xx1,1}{1,2},x2GR2_2GRFR_ass_a12{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a12{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a13(:,1))
        pcolor(x2GR2_2GRFR_ass_a13{xx1,1}{1,1},x2GR2_2GRFR_ass_a13{xx1,1}{1,2},x2GR2_2GRFR_ass_a13{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a13{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a14(:,1))
        pcolor(x2GR2_2GRFR_ass_a14{xx1,1}{1,1},x2GR2_2GRFR_ass_a14{xx1,1}{1,2},x2GR2_2GRFR_ass_a14{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a14{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a15(:,1))
        pcolor(x2GR2_2GRFR_ass_a15{xx1,1}{1,1},x2GR2_2GRFR_ass_a15{xx1,1}{1,2},x2GR2_2GRFR_ass_a15{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a15{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x2GR2_2GRFR_ass_a16(:,1))
        pcolor(x2GR2_2GRFR_ass_a16{xx1,1}{1,1},x2GR2_2GRFR_ass_a16{xx1,1}{1,2},x2GR2_2GRFR_ass_a16{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x2GR2_2GRFR_ass_a16{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a01(:,1))
        pcolor(x3SIM_1FRGR_ass_a01{xx1,1}{1,1},x3SIM_1FRGR_ass_a01{xx1,1}{1,2},x3SIM_1FRGR_ass_a01{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a01{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a02(:,1))
        pcolor(x3SIM_1FRGR_ass_a02{xx1,1}{1,1},x3SIM_1FRGR_ass_a02{xx1,1}{1,2},x3SIM_1FRGR_ass_a02{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a02{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a03(:,1))
        pcolor(x3SIM_1FRGR_ass_a03{xx1,1}{1,1},x3SIM_1FRGR_ass_a03{xx1,1}{1,2},x3SIM_1FRGR_ass_a03{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a03{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a04(:,1))
        pcolor(x3SIM_1FRGR_ass_a04{xx1,1}{1,1},x3SIM_1FRGR_ass_a04{xx1,1}{1,2},x3SIM_1FRGR_ass_a04{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a04{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a05(:,1))
        pcolor(x3SIM_1FRGR_ass_a05{xx1,1}{1,1},x3SIM_1FRGR_ass_a05{xx1,1}{1,2},x3SIM_1FRGR_ass_a05{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a05{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_1FRGR_ass_a06(:,1))
        pcolor(x3SIM_1FRGR_ass_a06{xx1,1}{1,1},x3SIM_1FRGR_ass_a06{xx1,1}{1,2},x3SIM_1FRGR_ass_a06{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_1FRGR_ass_a06{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a11(:,1))
        pcolor(x3SIM_2GRFR_ass_a11{xx1,1}{1,1},x3SIM_2GRFR_ass_a11{xx1,1}{1,2},x3SIM_2GRFR_ass_a11{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a11{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a12(:,1))
        pcolor(x3SIM_2GRFR_ass_a12{xx1,1}{1,1},x3SIM_2GRFR_ass_a12{xx1,1}{1,2},x3SIM_2GRFR_ass_a12{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a12{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a13(:,1))
        pcolor(x3SIM_2GRFR_ass_a13{xx1,1}{1,1},x3SIM_2GRFR_ass_a13{xx1,1}{1,2},x3SIM_2GRFR_ass_a13{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a13{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a14(:,1))
        pcolor(x3SIM_2GRFR_ass_a14{xx1,1}{1,1},x3SIM_2GRFR_ass_a14{xx1,1}{1,2},x3SIM_2GRFR_ass_a14{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a14{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a15(:,1))
        pcolor(x3SIM_2GRFR_ass_a15{xx1,1}{1,1},x3SIM_2GRFR_ass_a15{xx1,1}{1,2},x3SIM_2GRFR_ass_a15{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a15{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
for xx1 = 1:numel(x3SIM_2GRFR_ass_a16(:,1))
        pcolor(x3SIM_2GRFR_ass_a16{xx1,1}{1,1},x3SIM_2GRFR_ass_a16{xx1,1}{1,2},x3SIM_2GRFR_ass_a16{xx1,1}{1,3})
        colormap(gray)
        shading interp
        axis equal
        axis square
        % set(gca,'Visible','off')
        set(gca,'Color','black')
        set(gca,'XTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'XLim',[-0.1 0.1])
        set(gca,'YTick',-0.1:0.1:0.1,'FontSize',40)
        set(gca,'YLim',[-0.1 0.1])
        set(gca, 'XTickLabel', '')
        set(gca, 'YTickLabel', '')
        x3SIM_2GRFR_ass_a16{xx1,4} = npc_capture_figure(gcf);
        close gcf;
 end
%%%%%
%%%%%%%%%%%%%%%%%%%%%%%





 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%% 
% similiality
%%%%%%
% 1: control // 2: simulation // 3: similarlity (1=identical)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % GPU process
% xg1CON_1FRGR_ass_a01 = gpuArray(cell2mat(x1CON_1FRGR_ass_a01(1,1)));
% xg3SIM_1FRGR_ass_a01 = gpuArray(cell2mat(x3SIM_1FRGR_ass_a01(1,1)));
% xgs_1FRGR_a01 = multissim(xg1CON_1FRGR_ass_a01,xg3SIM_1FRGR_ass_a01);
% 
% zzz1 = cell2mat(x1CON_1FRGR_ass_a01(1,1));
% 
% 
% 
% 
% 
% tic;
% xs_1FRGR_a01{xx3,1} = [x1CON_1FRGR_ass_a01(xx1,:)];
% xs_1FRGR_a01{xx3,2} = [x3SIM_1FRGR_ass_a01(xx2,:)];
% xs_1FRGR_a01{xx3,3} = ssim(x1CON_1FRGR_ass_a01{xx1,1}{1,3},x3SIM_1FRGR_ass_a01{xx2,1}{1,3});
% toc;
% 
% xx3=1;
% for xx1 =1:numel(x1CON_1FRGR_ass_a01)
%     for xx2 = 1:numel(x3SIM_1FRGR_ass_a01(:,1))
%         xs_1FRGR_a01{xx3,1} = [x1CON_1FRGR_ass_a01(xx1,:)];
%         xs_1FRGR_a01{xx3,2} = [x3SIM_1FRGR_ass_a01(xx2,:)];
%         xs_1FRGR_a01{xx3,3} = ssim(x1CON_1FRGR_ass_a01{xx1,1}{1,3},x3SIM_1FRGR_ass_a01{xx2,1}{1,3});
%         xx3=xx3+1;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx3=1;
for xx1 = 1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a01(:,1))
        xs_1CON_1FRGR_a01{xx3,1} = [x1CON_1FRGR_ass_a01(xx1,:)];
        xs_1CON_1FRGR_a01{xx3,2} = [x3SIM_1FRGR_ass_a01(xx2,:)];
        xs_1CON_1FRGR_a01{xx3,3} = ssim(x1CON_1FRGR_ass_a01{xx1,4},x3SIM_1FRGR_ass_a01{xx2,4});
        xx3=xx3+1;
    end
end
%%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a02(:,1))
        xs_1CON_1FRGR_a02{xx3,1} = [x1CON_1FRGR_ass_a02(xx1,:)];
        xs_1CON_1FRGR_a02{xx3,2} = [x3SIM_1FRGR_ass_a02(xx2,:)];
        xs_1CON_1FRGR_a02{xx3,3} = ssim(x1CON_1FRGR_ass_a02{xx1,4},x3SIM_1FRGR_ass_a02{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a03(:,1))
        xs_1CON_1FRGR_a03{xx3,1} = [x1CON_1FRGR_ass_a03(xx1,:)];
        xs_1CON_1FRGR_a03{xx3,2} = [x3SIM_1FRGR_ass_a03(xx2,:)];
        xs_1CON_1FRGR_a03{xx3,3} = ssim(x1CON_1FRGR_ass_a03{xx1,4},x3SIM_1FRGR_ass_a03{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a04(:,1))
        xs_1CON_1FRGR_a04{xx3,1} = [x1CON_1FRGR_ass_a04(xx1,:)];
        xs_1CON_1FRGR_a04{xx3,2} = [x3SIM_1FRGR_ass_a04(xx2,:)];
        xs_1CON_1FRGR_a04{xx3,3} = ssim(x1CON_1FRGR_ass_a04{xx1,4},x3SIM_1FRGR_ass_a04{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a05(:,1))
        xs_1CON_1FRGR_a05{xx3,1} = [x1CON_1FRGR_ass_a05(xx1,:)];
        xs_1CON_1FRGR_a05{xx3,2} = [x3SIM_1FRGR_ass_a05(xx2,:)];
        xs_1CON_1FRGR_a05{xx3,3} = ssim(x1CON_1FRGR_ass_a05{xx1,4},x3SIM_1FRGR_ass_a05{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a06(:,1))
        xs_1CON_1FRGR_a06{xx3,1} = [x1CON_1FRGR_ass_a06(xx1,:)];
        xs_1CON_1FRGR_a06{xx3,2} = [x3SIM_1FRGR_ass_a06(xx2,:)];
        xs_1CON_1FRGR_a06{xx3,3} = ssim(x1CON_1FRGR_ass_a06{xx1,4},x3SIM_1FRGR_ass_a06{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a11(:,1))
        xs_1CON_2GRFR_a11{xx3,1} = [x1CON_2GRFR_ass_a11(xx1,:)];
        xs_1CON_2GRFR_a11{xx3,2} = [x3SIM_2GRFR_ass_a11(xx2,:)];
        xs_1CON_2GRFR_a11{xx3,3} = ssim(x1CON_2GRFR_ass_a11{xx1,4},x3SIM_2GRFR_ass_a11{xx2,4});
        xx3=xx3+1;
    end
end
%%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a12(:,1))
        xs_1CON_2GRFR_a12{xx3,1} = [x1CON_2GRFR_ass_a12(xx1,:)];
        xs_1CON_2GRFR_a12{xx3,2} = [x3SIM_2GRFR_ass_a12(xx2,:)];
        xs_1CON_2GRFR_a12{xx3,3} = ssim(x1CON_2GRFR_ass_a12{xx1,4},x3SIM_2GRFR_ass_a12{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a13(:,1))
        xs_1CON_2GRFR_a13{xx3,1} = [x1CON_2GRFR_ass_a13(xx1,:)];
        xs_1CON_2GRFR_a13{xx3,2} = [x3SIM_2GRFR_ass_a13(xx2,:)];
        xs_1CON_2GRFR_a13{xx3,3} = ssim(x1CON_2GRFR_ass_a13{xx1,4},x3SIM_2GRFR_ass_a13{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a14(:,1))
        xs_1CON_2GRFR_a14{xx3,1} = [x1CON_2GRFR_ass_a14(xx1,:)];
        xs_1CON_2GRFR_a14{xx3,2} = [x3SIM_2GRFR_ass_a14(xx2,:)];
        xs_1CON_2GRFR_a14{xx3,3} = ssim(x1CON_2GRFR_ass_a14{xx1,4},x3SIM_2GRFR_ass_a14{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a15(:,1))
        xs_1CON_2GRFR_a15{xx3,1} = [x1CON_2GRFR_ass_a15(xx1,:)];
        xs_1CON_2GRFR_a15{xx3,2} = [x3SIM_2GRFR_ass_a15(xx2,:)];
        xs_1CON_2GRFR_a15{xx3,3} = ssim(x1CON_2GRFR_ass_a15{xx1,4},x3SIM_2GRFR_ass_a15{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a16(:,1))
        xs_1CON_2GRFR_a16{xx3,1} = [x1CON_2GRFR_ass_a16(xx1,:)];
        xs_1CON_2GRFR_a16{xx3,2} = [x3SIM_2GRFR_ass_a16(xx2,:)];
        xs_1CON_2GRFR_a16{xx3,3} = ssim(x1CON_2GRFR_ass_a16{xx1,4},x3SIM_2GRFR_ass_a16{xx2,4});
        xx3=xx3+1;
    end
end




%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a01(:,1))
        xs_2GR2_1FRGR_a01{xx3,1} = [x2GR2_1FRGR_ass_a01(xx1,:)];
        xs_2GR2_1FRGR_a01{xx3,2} = [x3SIM_1FRGR_ass_a01(xx2,:)];
        xs_2GR2_1FRGR_a01{xx3,3} = ssim(x2GR2_1FRGR_ass_a01{xx1,4},x3SIM_1FRGR_ass_a01{xx2,4});
        xx3=xx3+1;
    end
end
%%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a02(:,1))
        xs_2GR2_1FRGR_a02{xx3,1} = [x2GR2_1FRGR_ass_a02(xx1,:)];
        xs_2GR2_1FRGR_a02{xx3,2} = [x3SIM_1FRGR_ass_a02(xx2,:)];
        xs_2GR2_1FRGR_a02{xx3,3} = ssim(x2GR2_1FRGR_ass_a02{xx1,4},x3SIM_1FRGR_ass_a02{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a03(:,1))
        xs_2GR2_1FRGR_a03{xx3,1} = [x2GR2_1FRGR_ass_a03(xx1,:)];
        xs_2GR2_1FRGR_a03{xx3,2} = [x3SIM_1FRGR_ass_a03(xx2,:)];
        xs_2GR2_1FRGR_a03{xx3,3} = ssim(x2GR2_1FRGR_ass_a03{xx1,4},x3SIM_1FRGR_ass_a03{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a04(:,1))
        xs_2GR2_1FRGR_a04{xx3,1} = [x2GR2_1FRGR_ass_a04(xx1,:)];
        xs_2GR2_1FRGR_a04{xx3,2} = [x3SIM_1FRGR_ass_a04(xx2,:)];
        xs_2GR2_1FRGR_a04{xx3,3} = ssim(x2GR2_1FRGR_ass_a04{xx1,4},x3SIM_1FRGR_ass_a04{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a05(:,1))
        xs_2GR2_1FRGR_a05{xx3,1} = [x2GR2_1FRGR_ass_a05(xx1,:)];
        xs_2GR2_1FRGR_a05{xx3,2} = [x3SIM_1FRGR_ass_a05(xx2,:)];
        xs_2GR2_1FRGR_a05{xx3,3} = ssim(x2GR2_1FRGR_ass_a05{xx1,4},x3SIM_1FRGR_ass_a05{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_1FRGR_ass_a06(:,1))
        xs_2GR2_1FRGR_a06{xx3,1} = [x2GR2_1FRGR_ass_a06(xx1,:)];
        xs_2GR2_1FRGR_a06{xx3,2} = [x3SIM_1FRGR_ass_a06(xx2,:)];
        xs_2GR2_1FRGR_a06{xx3,3} = ssim(x2GR2_1FRGR_ass_a06{xx1,4},x3SIM_1FRGR_ass_a06{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a11(:,1))
        xs_2GR2_2GRFR_a11{xx3,1} = [x2GR2_2GRFR_ass_a11(xx1,:)];
        xs_2GR2_2GRFR_a11{xx3,2} = [x3SIM_2GRFR_ass_a11(xx2,:)];
        xs_2GR2_2GRFR_a11{xx3,3} = ssim(x2GR2_2GRFR_ass_a11{xx1,4},x3SIM_2GRFR_ass_a11{xx2,4});
        xx3=xx3+1;
    end
end
%%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a12(:,1))
        xs_2GR2_2GRFR_a12{xx3,1} = [x2GR2_2GRFR_ass_a12(xx1,:)];
        xs_2GR2_2GRFR_a12{xx3,2} = [x3SIM_2GRFR_ass_a12(xx2,:)];
        xs_2GR2_2GRFR_a12{xx3,3} = ssim(x2GR2_2GRFR_ass_a12{xx1,4},x3SIM_2GRFR_ass_a12{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a13(:,1))
        xs_2GR2_2GRFR_a13{xx3,1} = [x2GR2_2GRFR_ass_a13(xx1,:)];
        xs_2GR2_2GRFR_a13{xx3,2} = [x3SIM_2GRFR_ass_a13(xx2,:)];
        xs_2GR2_2GRFR_a13{xx3,3} = ssim(x2GR2_2GRFR_ass_a13{xx1,4},x3SIM_2GRFR_ass_a13{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a14(:,1))
        xs_2GR2_2GRFR_a14{xx3,1} = [x2GR2_2GRFR_ass_a14(xx1,:)];
        xs_2GR2_2GRFR_a14{xx3,2} = [x3SIM_2GRFR_ass_a14(xx2,:)];
        xs_2GR2_2GRFR_a14{xx3,3} = ssim(x2GR2_2GRFR_ass_a14{xx1,4},x3SIM_2GRFR_ass_a14{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a15(:,1))
        xs_2GR2_2GRFR_a15{xx3,1} = [x2GR2_2GRFR_ass_a15(xx1,:)];
        xs_2GR2_2GRFR_a15{xx3,2} = [x3SIM_2GRFR_ass_a15(xx2,:)];
        xs_2GR2_2GRFR_a15{xx3,3} = ssim(x2GR2_2GRFR_ass_a15{xx1,4},x3SIM_2GRFR_ass_a15{xx2,4});
        xx3=xx3+1;
    end
end
%%%
xx3=1;
for xx1 =1
    for xx2 = 1:numel(x3SIM_2GRFR_ass_a16(:,1))
        xs_2GR2_2GRFR_a16{xx3,1} = [x2GR2_2GRFR_ass_a16(xx1,:)];
        xs_2GR2_2GRFR_a16{xx3,2} = [x3SIM_2GRFR_ass_a16(xx2,:)];
        xs_2GR2_2GRFR_a16{xx3,3} = ssim(x2GR2_2GRFR_ass_a16{xx1,4},x3SIM_2GRFR_ass_a16{xx2,4});
        xx3=xx3+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%
% sortrows
%%%%%%%%%%%%%%%%%%%%%
xss_1CON_1FRGR_a01 = sortrows(xs_1CON_1FRGR_a01,3,'descend');
xss_1CON_1FRGR_a02= sortrows(xs_1CON_1FRGR_a02,3,'descend');
xss_1CON_1FRGR_a03= sortrows(xs_1CON_1FRGR_a03,3,'descend');
xss_1CON_1FRGR_a04= sortrows(xs_1CON_1FRGR_a04,3,'descend');
xss_1CON_1FRGR_a05 = sortrows(xs_1CON_1FRGR_a05,3,'descend');
xss_1CON_1FRGR_a06 = sortrows(xs_1CON_1FRGR_a06,3,'descend');
%%%
xss_1CON_2GRFR_a11 = sortrows(xs_1CON_2GRFR_a11,3,'descend');
xss_1CON_2GRFR_a12= sortrows(xs_1CON_2GRFR_a12,3,'descend');
xss_1CON_2GRFR_a13= sortrows(xs_1CON_2GRFR_a13,3,'descend');
xss_1CON_2GRFR_a14= sortrows(xs_1CON_2GRFR_a14,3,'descend');
xss_1CON_2GRFR_a15 = sortrows(xs_1CON_2GRFR_a15,3,'descend');
xss_1CON_2GRFR_a16 = sortrows(xs_1CON_2GRFR_a16,3,'descend');
%%%%%
%%%%%%%%%%
xss_2GR2_1FRGR_a01 = sortrows(xs_2GR2_1FRGR_a01,3,'descend');
xss_2GR2_1FRGR_a02= sortrows(xs_2GR2_1FRGR_a02,3,'descend');
xss_2GR2_1FRGR_a03= sortrows(xs_2GR2_1FRGR_a03,3,'descend');
xss_2GR2_1FRGR_a04= sortrows(xs_2GR2_1FRGR_a04,3,'descend');
xss_2GR2_1FRGR_a05 = sortrows(xs_2GR2_1FRGR_a05,3,'descend');
xss_2GR2_1FRGR_a06 = sortrows(xs_2GR2_1FRGR_a06,3,'descend');
%%%
xss_2GR2_2GRFR_a11 = sortrows(xs_2GR2_2GRFR_a11,3,'descend');
xss_2GR2_2GRFR_a12= sortrows(xs_2GR2_2GRFR_a12,3,'descend');
xss_2GR2_2GRFR_a13= sortrows(xs_2GR2_2GRFR_a13,3,'descend');
xss_2GR2_2GRFR_a14= sortrows(xs_2GR2_2GRFR_a14,3,'descend');
xss_2GR2_2GRFR_a15 = sortrows(xs_2GR2_2GRFR_a15,3,'descend');
xss_2GR2_2GRFR_a16 = sortrows(xs_2GR2_2GRFR_a16,3,'descend');
%%%%%%%%%%%%%%%%%%%%%%%%%
% 1:raw 2:simulation
% 3:SSIM 
% 4:n number differece / 5: media distance differece
% 6:n number raw from table / 7:n number sim from table
% 8:n number raw from density / 9:n number sim from density
% 10:ratio density / 11:ratio sim
% 12: RAW for whole density number to 100,000 
% 13: SIM for whole density number to 100,000 
% 14: SSIM between 12 and 13
%%%%%%%%%%%%%%%%%%%%%%%%%
% difference of n  numbers and mdian distance
xss_set = 100000;
%%%%%%%%%%%%%%%%
for xxx1 = 1:numel(xss_1CON_1FRGR_a01(:,1))
    xss_1CON_1FRGR_a01{xxx1,4}  = xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a01{xxx1,5}  = xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a01{xxx1,6}  = xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a01{xxx1,7}  = xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a01{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a01{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a01{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a01{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a01{xxx1,10}  = xss_1CON_1FRGR_a01{xxx1,1}{1,4};
    xss_1CON_1FRGR_a01{xxx1,11}  = xss_1CON_1FRGR_a01{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a01{xxx1,12}  = xss_1CON_1FRGR_a01{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a01{xxx1,13}  = (xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a01{xxx1,14}  = (xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a01{xxx1,15}  = (xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a01{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a01{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a01{xxx1,16} = mean([xss_1CON_1FRGR_a01{xxx1,12},xss_1CON_1FRGR_a01{xxx1,13},xss_1CON_1FRGR_a01{xxx1,14},xss_1CON_1FRGR_a01{xxx1,15}]);
%     xss_1CON_1FRGR_a01{xxx1,10}  = xss_set/xss_1CON_1FRGR_a01{xxx1,8};
%     xss_1CON_1FRGR_a01{xxx1,11}  = xss_set/xss_1CON_1FRGR_a01{xxx1,9};
%     xss_1CON_1FRGR_a01{xxx1,12}  = xss_1CON_1FRGR_a01{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a01{xxx1,10};
%     xss_1CON_1FRGR_a01{xxx1,13}  = xss_1CON_1FRGR_a01{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a01{xxx1,11};
%     xss_1CON_1FRGR_a01{xxx1,14}  = ssim( xss_1CON_1FRGR_a01{xxx1,12},xss_1CON_1FRGR_a01{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_1FRGR_a02(:,1))
    xss_1CON_1FRGR_a02{xxx1,4}  = xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a02{xxx1,5}  = xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a02{xxx1,6}  = xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a02{xxx1,7}  = xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a02{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a02{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a02{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a02{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a02{xxx1,10}  = xss_1CON_1FRGR_a02{xxx1,1}{1,4};
    xss_1CON_1FRGR_a02{xxx1,11}  = xss_1CON_1FRGR_a02{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a02{xxx1,12}  = xss_1CON_1FRGR_a02{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a02{xxx1,13}  = (xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a02{xxx1,14}  = (xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a02{xxx1,15}  = (xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a02{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a02{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a02{xxx1,16} = mean([xss_1CON_1FRGR_a02{xxx1,12},xss_1CON_1FRGR_a02{xxx1,13},xss_1CON_1FRGR_a02{xxx1,14},xss_1CON_1FRGR_a02{xxx1,15}]);
%     xss_1CON_1FRGR_a02{xxx1,10}  = xss_set/xss_1CON_1FRGR_a02{xxx1,8};
%     xss_1CON_1FRGR_a02{xxx1,11}  = xss_set/xss_1CON_1FRGR_a02{xxx1,9};
%     xss_1CON_1FRGR_a02{xxx1,12}  = xss_1CON_1FRGR_a02{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a02{xxx1,10};
%     xss_1CON_1FRGR_a02{xxx1,13}  = xss_1CON_1FRGR_a02{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a02{xxx1,11};
%     xss_1CON_1FRGR_a02{xxx1,14}  = ssim( xss_1CON_1FRGR_a02{xxx1,12},xss_1CON_1FRGR_a02{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_1FRGR_a03(:,1))
    xss_1CON_1FRGR_a03{xxx1,4}  = xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a03{xxx1,5}  = xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a03{xxx1,6}  = xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a03{xxx1,7}  = xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a03{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a03{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a03{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a03{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a03{xxx1,10}  = xss_1CON_1FRGR_a03{xxx1,1}{1,4};
    xss_1CON_1FRGR_a03{xxx1,11}  = xss_1CON_1FRGR_a03{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a03{xxx1,12}  = xss_1CON_1FRGR_a03{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a03{xxx1,13}  = (xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a03{xxx1,14}  = (xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a03{xxx1,15}  = (xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a03{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a03{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a03{xxx1,16} = mean([xss_1CON_1FRGR_a03{xxx1,12},xss_1CON_1FRGR_a03{xxx1,13},xss_1CON_1FRGR_a03{xxx1,14},xss_1CON_1FRGR_a03{xxx1,15}]);
%     xss_1CON_1FRGR_a03{xxx1,10}  = xss_set/xss_1CON_1FRGR_a03{xxx1,8};
%     xss_1CON_1FRGR_a03{xxx1,11}  = xss_set/xss_1CON_1FRGR_a03{xxx1,9};
%     xss_1CON_1FRGR_a03{xxx1,12}  = xss_1CON_1FRGR_a03{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a03{xxx1,10};
%     xss_1CON_1FRGR_a03{xxx1,13}  = xss_1CON_1FRGR_a03{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a03{xxx1,11};
%     xss_1CON_1FRGR_a03{xxx1,14}  = ssim( xss_1CON_1FRGR_a03{xxx1,12},xss_1CON_1FRGR_a03{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_1FRGR_a04(:,1))
    xss_1CON_1FRGR_a04{xxx1,4}  = xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a04{xxx1,5}  = xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a04{xxx1,6}  = xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a04{xxx1,7}  = xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a04{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a04{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a04{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a04{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a04{xxx1,10}  = xss_1CON_1FRGR_a04{xxx1,1}{1,4};
    xss_1CON_1FRGR_a04{xxx1,11}  = xss_1CON_1FRGR_a04{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a04{xxx1,12}  = xss_1CON_1FRGR_a04{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a04{xxx1,13}  = (xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a04{xxx1,14}  = (xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a04{xxx1,15}  = (xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a04{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a04{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a04{xxx1,16} = mean([xss_1CON_1FRGR_a04{xxx1,12},xss_1CON_1FRGR_a04{xxx1,13},xss_1CON_1FRGR_a04{xxx1,14},xss_1CON_1FRGR_a04{xxx1,15}]);
%     xss_1CON_1FRGR_a04{xxx1,10}  = xss_set/xss_1CON_1FRGR_a04{xxx1,8};
%     xss_1CON_1FRGR_a04{xxx1,11}  = xss_set/xss_1CON_1FRGR_a04{xxx1,9};
%     xss_1CON_1FRGR_a04{xxx1,12}  = xss_1CON_1FRGR_a04{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a04{xxx1,10};
%     xss_1CON_1FRGR_a04{xxx1,13}  = xss_1CON_1FRGR_a04{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a04{xxx1,11};
%     xss_1CON_1FRGR_a04{xxx1,14}  = ssim( xss_1CON_1FRGR_a04{xxx1,12},xss_1CON_1FRGR_a04{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_1FRGR_a05(:,1))
    xss_1CON_1FRGR_a05{xxx1,4}  = xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a05{xxx1,5}  = xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a05{xxx1,6}  = xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a05{xxx1,7}  = xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a05{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a05{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a05{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a05{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a05{xxx1,10}  = xss_1CON_1FRGR_a05{xxx1,1}{1,4};
    xss_1CON_1FRGR_a05{xxx1,11}  = xss_1CON_1FRGR_a05{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a05{xxx1,12}  = xss_1CON_1FRGR_a05{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a05{xxx1,13}  = (xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a05{xxx1,14}  = (xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a05{xxx1,15}  = (xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a05{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a05{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a05{xxx1,16} = mean([xss_1CON_1FRGR_a05{xxx1,12},xss_1CON_1FRGR_a05{xxx1,13},xss_1CON_1FRGR_a05{xxx1,14},xss_1CON_1FRGR_a05{xxx1,15}]);
%     xss_1CON_1FRGR_a05{xxx1,10}  = xss_set/xss_1CON_1FRGR_a05{xxx1,8};
%     xss_1CON_1FRGR_a05{xxx1,11}  = xss_set/xss_1CON_1FRGR_a05{xxx1,9};
%     xss_1CON_1FRGR_a05{xxx1,12}  = xss_1CON_1FRGR_a05{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a05{xxx1,10};
%     xss_1CON_1FRGR_a05{xxx1,13}  = xss_1CON_1FRGR_a05{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a05{xxx1,11};
%     xss_1CON_1FRGR_a05{xxx1,14}  = ssim( xss_1CON_1FRGR_a05{xxx1,12},xss_1CON_1FRGR_a05{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_1FRGR_a06(:,1))
    xss_1CON_1FRGR_a06{xxx1,4}  = xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,1}-xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a06{xxx1,5}  = xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,3};
    xss_1CON_1FRGR_a06{xxx1,6}  = xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,1};
    xss_1CON_1FRGR_a06{xxx1,7}  = xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,1};
    xss_1CON_1FRGR_a06{xxx1,8}  = sum(sum(xss_1CON_1FRGR_a06{xxx1,1}{1,1}{1,3}));
    xss_1CON_1FRGR_a06{xxx1,9}  = sum(sum(xss_1CON_1FRGR_a06{xxx1,2}{1,1}{1,3}));
    xss_1CON_1FRGR_a06{xxx1,10}  = xss_1CON_1FRGR_a06{xxx1,1}{1,4};
    xss_1CON_1FRGR_a06{xxx1,11}  = xss_1CON_1FRGR_a06{xxx1,2}{1,4};
    % SSIM
    xss_1CON_1FRGR_a06{xxx1,12}  = xss_1CON_1FRGR_a06{xxx1,3};
    % Pmean FR
    xss_1CON_1FRGR_a06{xxx1,13}  = (xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,2}-abs(xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,2}-xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,2}))/xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_1CON_1FRGR_a06{xxx1,14}  = (xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,3}-abs(xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,3}-xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,3}))/xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_1CON_1FRGR_a06{xxx1,15}  = (xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,4}-abs(xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,4}-xss_1CON_1FRGR_a06{xxx1,2}{1,3}{1,4}))/xss_1CON_1FRGR_a06{xxx1,1}{1,3}{1,4};
    % Smean
    xss_1CON_1FRGR_a06{xxx1,16} = mean([xss_1CON_1FRGR_a06{xxx1,12},xss_1CON_1FRGR_a06{xxx1,13},xss_1CON_1FRGR_a06{xxx1,14},xss_1CON_1FRGR_a06{xxx1,15}]);
%     xss_1CON_1FRGR_a06{xxx1,10}  = xss_set/xss_1CON_1FRGR_a06{xxx1,8};
%     xss_1CON_1FRGR_a06{xxx1,11}  = xss_set/xss_1CON_1FRGR_a06{xxx1,9};
%     xss_1CON_1FRGR_a06{xxx1,12}  = xss_1CON_1FRGR_a06{xxx1,1}{1,1}{1,3}.*xss_1CON_1FRGR_a06{xxx1,10};
%     xss_1CON_1FRGR_a06{xxx1,13}  = xss_1CON_1FRGR_a06{xxx1,2}{1,1}{1,3}.*xss_1CON_1FRGR_a06{xxx1,11};
%     xss_1CON_1FRGR_a06{xxx1,14}  = ssim( xss_1CON_1FRGR_a06{xxx1,12},xss_1CON_1FRGR_a06{xxx1,13});   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for xxx1 = 1:numel(xss_1CON_2GRFR_a11(:,1))
    xss_1CON_2GRFR_a11{xxx1,4}  = xss_1CON_2GRFR_a11{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a11{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a11{xxx1,5}  = xss_1CON_2GRFR_a11{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a11{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a11{xxx1,6}  = xss_1CON_2GRFR_a11{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a11{xxx1,7}  = xss_1CON_2GRFR_a11{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a11{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a11{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a11{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a11{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a11{xxx1,10}  = xss_1CON_2GRFR_a11{xxx1,1}{1,4};
    xss_1CON_2GRFR_a11{xxx1,11}  = xss_1CON_2GRFR_a11{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a11{xxx1,12}  = xss_1CON_2GRFR_a11{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a11{xxx1,13}  = (xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a11{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a11{xxx1,14}  = (xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a11{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a11{xxx1,15}  = (xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a11{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a11{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a11{xxx1,16} = mean([xss_1CON_2GRFR_a11{xxx1,12},xss_1CON_2GRFR_a11{xxx1,13},xss_1CON_2GRFR_a11{xxx1,14},xss_1CON_2GRFR_a11{xxx1,15}]);
%     xss_1CON_2GRFR_a11{xxx1,10}  = xss_set/xss_1CON_2GRFR_a11{xxx1,8};
%     xss_1CON_2GRFR_a11{xxx1,11}  = xss_set/xss_1CON_2GRFR_a11{xxx1,9};
%     xss_1CON_2GRFR_a11{xxx1,12}  = xss_1CON_2GRFR_a11{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a11{xxx1,10};
%     xss_1CON_2GRFR_a11{xxx1,13}  = xss_1CON_2GRFR_a11{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a11{xxx1,11};
%     xss_1CON_2GRFR_a11{xxx1,14}  = ssim( xss_1CON_2GRFR_a11{xxx1,12},xss_1CON_2GRFR_a11{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_2GRFR_a12(:,1))
    xss_1CON_2GRFR_a12{xxx1,4}  = xss_1CON_2GRFR_a12{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a12{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a12{xxx1,5}  = xss_1CON_2GRFR_a12{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a12{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a12{xxx1,6}  = xss_1CON_2GRFR_a12{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a12{xxx1,7}  = xss_1CON_2GRFR_a12{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a12{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a12{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a12{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a12{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a12{xxx1,10}  = xss_1CON_2GRFR_a12{xxx1,1}{1,4};
    xss_1CON_2GRFR_a12{xxx1,11}  = xss_1CON_2GRFR_a12{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a12{xxx1,12}  = xss_1CON_2GRFR_a12{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a12{xxx1,13}  = (xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a12{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a12{xxx1,14}  = (xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a12{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a12{xxx1,15}  = (xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a12{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a12{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a12{xxx1,16} = mean([xss_1CON_2GRFR_a12{xxx1,12},xss_1CON_2GRFR_a12{xxx1,13},xss_1CON_2GRFR_a12{xxx1,14},xss_1CON_2GRFR_a12{xxx1,15}]);
%     xss_1CON_2GRFR_a12{xxx1,10}  = xss_set/xss_1CON_2GRFR_a12{xxx1,8};
%     xss_1CON_2GRFR_a12{xxx1,11}  = xss_set/xss_1CON_2GRFR_a12{xxx1,9};
%     xss_1CON_2GRFR_a12{xxx1,12}  = xss_1CON_2GRFR_a12{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a12{xxx1,10};
%     xss_1CON_2GRFR_a12{xxx1,13}  = xss_1CON_2GRFR_a12{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a12{xxx1,11};
%     xss_1CON_2GRFR_a12{xxx1,14}  = ssim( xss_1CON_2GRFR_a12{xxx1,12},xss_1CON_2GRFR_a12{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_2GRFR_a13(:,1))
    xss_1CON_2GRFR_a13{xxx1,4}  = xss_1CON_2GRFR_a13{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a13{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a13{xxx1,5}  = xss_1CON_2GRFR_a13{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a13{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a13{xxx1,6}  = xss_1CON_2GRFR_a13{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a13{xxx1,7}  = xss_1CON_2GRFR_a13{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a13{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a13{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a13{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a13{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a13{xxx1,10}  = xss_1CON_2GRFR_a13{xxx1,1}{1,4};
    xss_1CON_2GRFR_a13{xxx1,11}  = xss_1CON_2GRFR_a13{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a13{xxx1,12}  = xss_1CON_2GRFR_a13{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a13{xxx1,13}  = (xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a13{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a13{xxx1,14}  = (xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a13{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a13{xxx1,15}  = (xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a13{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a13{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a13{xxx1,16} = mean([xss_1CON_2GRFR_a13{xxx1,12},xss_1CON_2GRFR_a13{xxx1,13},xss_1CON_2GRFR_a13{xxx1,14},xss_1CON_2GRFR_a13{xxx1,15}]);
%     xss_1CON_2GRFR_a13{xxx1,10}  = xss_set/xss_1CON_2GRFR_a13{xxx1,8};
%     xss_1CON_2GRFR_a13{xxx1,11}  = xss_set/xss_1CON_2GRFR_a13{xxx1,9};
%     xss_1CON_2GRFR_a13{xxx1,12}  = xss_1CON_2GRFR_a13{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a13{xxx1,10};
%     xss_1CON_2GRFR_a13{xxx1,13}  = xss_1CON_2GRFR_a13{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a13{xxx1,11};
%     xss_1CON_2GRFR_a13{xxx1,14}  = ssim( xss_1CON_2GRFR_a13{xxx1,12},xss_1CON_2GRFR_a13{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_2GRFR_a14(:,1))
    xss_1CON_2GRFR_a14{xxx1,4}  = xss_1CON_2GRFR_a14{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a14{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a14{xxx1,5}  = xss_1CON_2GRFR_a14{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a14{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a14{xxx1,6}  = xss_1CON_2GRFR_a14{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a14{xxx1,7}  = xss_1CON_2GRFR_a14{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a14{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a14{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a14{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a14{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a14{xxx1,10}  = xss_1CON_2GRFR_a14{xxx1,1}{1,4};
    xss_1CON_2GRFR_a14{xxx1,11}  = xss_1CON_2GRFR_a14{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a14{xxx1,12}  = xss_1CON_2GRFR_a14{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a14{xxx1,13}  = (xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a14{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a14{xxx1,14}  = (xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a14{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a14{xxx1,15}  = (xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a14{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a14{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a14{xxx1,16} = mean([xss_1CON_2GRFR_a14{xxx1,12},xss_1CON_2GRFR_a14{xxx1,13},xss_1CON_2GRFR_a14{xxx1,14},xss_1CON_2GRFR_a14{xxx1,15}]);
%     xss_1CON_2GRFR_a14{xxx1,10}  = xss_set/xss_1CON_2GRFR_a14{xxx1,8};
%     xss_1CON_2GRFR_a14{xxx1,11}  = xss_set/xss_1CON_2GRFR_a14{xxx1,9};
%     xss_1CON_2GRFR_a14{xxx1,12}  = xss_1CON_2GRFR_a14{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a14{xxx1,10};
%     xss_1CON_2GRFR_a14{xxx1,13}  = xss_1CON_2GRFR_a14{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a14{xxx1,11};
%     xss_1CON_2GRFR_a14{xxx1,14}  = ssim( xss_1CON_2GRFR_a14{xxx1,12},xss_1CON_2GRFR_a14{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_2GRFR_a15(:,1))
    xss_1CON_2GRFR_a15{xxx1,4}  = xss_1CON_2GRFR_a15{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a15{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a15{xxx1,5}  = xss_1CON_2GRFR_a15{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a15{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a15{xxx1,6}  = xss_1CON_2GRFR_a15{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a15{xxx1,7}  = xss_1CON_2GRFR_a15{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a15{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a15{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a15{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a15{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a15{xxx1,10}  = xss_1CON_2GRFR_a15{xxx1,1}{1,4};
    xss_1CON_2GRFR_a15{xxx1,11}  = xss_1CON_2GRFR_a15{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a15{xxx1,12}  = xss_1CON_2GRFR_a15{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a15{xxx1,13}  = (xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a15{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a15{xxx1,14}  = (xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a15{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a15{xxx1,15}  = (xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a15{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a15{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a15{xxx1,16} = mean([xss_1CON_2GRFR_a15{xxx1,12},xss_1CON_2GRFR_a15{xxx1,13},xss_1CON_2GRFR_a15{xxx1,14},xss_1CON_2GRFR_a15{xxx1,15}]);
%     xss_1CON_2GRFR_a15{xxx1,10}  = xss_set/xss_1CON_2GRFR_a15{xxx1,8};
%     xss_1CON_2GRFR_a15{xxx1,11}  = xss_set/xss_1CON_2GRFR_a15{xxx1,9};
%     xss_1CON_2GRFR_a15{xxx1,12}  = xss_1CON_2GRFR_a15{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a15{xxx1,10};
%     xss_1CON_2GRFR_a15{xxx1,13}  = xss_1CON_2GRFR_a15{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a15{xxx1,11};
%     xss_1CON_2GRFR_a15{xxx1,14}  = ssim( xss_1CON_2GRFR_a15{xxx1,12},xss_1CON_2GRFR_a15{xxx1,13});   
end
for xxx1 = 1:numel(xss_1CON_2GRFR_a16(:,1))
    xss_1CON_2GRFR_a16{xxx1,4}  = xss_1CON_2GRFR_a16{xxx1,1}{1,3}{1,1}-xss_1CON_2GRFR_a16{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a16{xxx1,5}  = xss_1CON_2GRFR_a16{xxx1,1}{1,3}{1,3}-xss_1CON_2GRFR_a16{xxx1,2}{1,3}{1,3};
    xss_1CON_2GRFR_a16{xxx1,6}  = xss_1CON_2GRFR_a16{xxx1,1}{1,3}{1,1};
    xss_1CON_2GRFR_a16{xxx1,7}  = xss_1CON_2GRFR_a16{xxx1,2}{1,3}{1,1};
    xss_1CON_2GRFR_a16{xxx1,8}  = sum(sum(xss_1CON_2GRFR_a16{xxx1,1}{1,1}{1,3}));
    xss_1CON_2GRFR_a16{xxx1,9}  = sum(sum(xss_1CON_2GRFR_a16{xxx1,2}{1,1}{1,3}));
    xss_1CON_2GRFR_a16{xxx1,10}  = xss_1CON_2GRFR_a16{xxx1,1}{1,4};
    xss_1CON_2GRFR_a16{xxx1,11}  = xss_1CON_2GRFR_a16{xxx1,2}{1,4};
    % SSIM
    xss_1CON_2GRFR_a16{xxx1,12}  = xss_1CON_2GRFR_a16{xxx1,3};
    % Pmean FR
    xss_1CON_2GRFR_a16{xxx1,13}  = (xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,2}-abs(xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,2}-xss_1CON_2GRFR_a16{xxx1,2}{1,3}{2,2}))/xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_1CON_2GRFR_a16{xxx1,14}  = (xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,3}-abs(xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,3}-xss_1CON_2GRFR_a16{xxx1,2}{1,3}{2,3}))/xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_1CON_2GRFR_a16{xxx1,15}  = (xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,4}-abs(xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,4}-xss_1CON_2GRFR_a16{xxx1,2}{1,3}{2,4}))/xss_1CON_2GRFR_a16{xxx1,1}{1,3}{2,4};
    % Smean
    xss_1CON_2GRFR_a16{xxx1,16} = mean([xss_1CON_2GRFR_a16{xxx1,12},xss_1CON_2GRFR_a16{xxx1,13},xss_1CON_2GRFR_a16{xxx1,14},xss_1CON_2GRFR_a16{xxx1,15}]);
%     xss_1CON_2GRFR_a16{xxx1,10}  = xss_set/xss_1CON_2GRFR_a16{xxx1,8};
%     xss_1CON_2GRFR_a16{xxx1,11}  = xss_set/xss_1CON_2GRFR_a16{xxx1,9};
%     xss_1CON_2GRFR_a16{xxx1,12}  = xss_1CON_2GRFR_a16{xxx1,1}{1,1}{1,3}.*xss_1CON_2GRFR_a16{xxx1,10};
%     xss_1CON_2GRFR_a16{xxx1,13}  = xss_1CON_2GRFR_a16{xxx1,2}{1,1}{1,3}.*xss_1CON_2GRFR_a16{xxx1,11};
%     xss_1CON_2GRFR_a16{xxx1,14}  = ssim( xss_1CON_2GRFR_a16{xxx1,12},xss_1CON_2GRFR_a16{xxx1,13});   
end
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a01(:,1))
%     xss_2GR2_1FRGR_a01{xxx1,4}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a01{xxx1,5}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,3};
% end
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a02(:,1))
%     xss_2GR2_1FRGR_a02{xxx1,4}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a02{xxx1,5}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,3};
% end
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a03(:,1))
%     xss_2GR2_1FRGR_a03{xxx1,4}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a03{xxx1,5}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,3};
% end
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a04(:,1))
%     xss_2GR2_1FRGR_a04{xxx1,4}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a04{xxx1,5}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,3};
% end
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a05(:,1))
%     xss_2GR2_1FRGR_a05{xxx1,4}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a05{xxx1,5}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,3};
% end
% for xxx1 = 1:numel(xss_2GR2_1FRGR_a06(:,1))
%     xss_2GR2_1FRGR_a06{xxx1,4}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,1};
%     xss_2GR2_1FRGR_a06{xxx1,5}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,3};
% end
% %%%%%%%%%%%%
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a11(:,1))
%     xss_2GR2_2GRFR_a11{xxx1,4}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a11{xxx1,5}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{2,3};
% end
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a12(:,1))
%     xss_2GR2_2GRFR_a12{xxx1,4}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a12{xxx1,5}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{2,3};
% end
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a13(:,1))
%     xss_2GR2_2GRFR_a13{xxx1,4}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a13{xxx1,5}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{2,3};
% end
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a14(:,1))
%     xss_2GR2_2GRFR_a14{xxx1,4}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a14{xxx1,5}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{2,3};
% end
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a15(:,1))
%     xss_2GR2_2GRFR_a15{xxx1,4}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a15{xxx1,5}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{2,3};
% end
% for xxx1 = 1:numel(xss_2GR2_2GRFR_a16(:,1))
%     xss_2GR2_2GRFR_a16{xxx1,4}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,1}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{2,1};
%     xss_2GR2_2GRFR_a16{xxx1,5}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{2,3};
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
for xxx1 = 1:numel(xss_2GR2_1FRGR_a01(:,1))
    xss_2GR2_1FRGR_a01{xxx1,4}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a01{xxx1,5}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a01{xxx1,6}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a01{xxx1,7}  = xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a01{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a01{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a01{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a01{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a01{xxx1,10}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a01{xxx1,11}  = xss_2GR2_1FRGR_a01{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a01{xxx1,12}  = xss_2GR2_1FRGR_a01{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a01{xxx1,13}  = (xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a01{xxx1,14}  = (xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a01{xxx1,15}  = (xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a01{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a01{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a01{xxx1,16} = mean([xss_2GR2_1FRGR_a01{xxx1,12},xss_2GR2_1FRGR_a01{xxx1,13},xss_2GR2_1FRGR_a01{xxx1,14},xss_2GR2_1FRGR_a01{xxx1,15}]);
%     xss_2GR2_1FRGR_a01{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a01{xxx1,8};
%     xss_2GR2_1FRGR_a01{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a01{xxx1,9};
%     xss_2GR2_1FRGR_a01{xxx1,12}  = xss_2GR2_1FRGR_a01{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a01{xxx1,10};
%     xss_2GR2_1FRGR_a01{xxx1,13}  = xss_2GR2_1FRGR_a01{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a01{xxx1,11};
%     xss_2GR2_1FRGR_a01{xxx1,14}  = ssim( xss_2GR2_1FRGR_a01{xxx1,12},xss_2GR2_1FRGR_a01{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_1FRGR_a02(:,1))
    xss_2GR2_1FRGR_a02{xxx1,4}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a02{xxx1,5}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a02{xxx1,6}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a02{xxx1,7}  = xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a02{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a02{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a02{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a02{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a02{xxx1,10}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a02{xxx1,11}  = xss_2GR2_1FRGR_a02{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a02{xxx1,12}  = xss_2GR2_1FRGR_a02{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a02{xxx1,13}  = (xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a02{xxx1,14}  = (xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a02{xxx1,15}  = (xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a02{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a02{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a02{xxx1,16} = mean([xss_2GR2_1FRGR_a02{xxx1,12},xss_2GR2_1FRGR_a02{xxx1,13},xss_2GR2_1FRGR_a02{xxx1,14},xss_2GR2_1FRGR_a02{xxx1,15}]);
%     xss_2GR2_1FRGR_a02{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a02{xxx1,8};
%     xss_2GR2_1FRGR_a02{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a02{xxx1,9};
%     xss_2GR2_1FRGR_a02{xxx1,12}  = xss_2GR2_1FRGR_a02{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a02{xxx1,10};
%     xss_2GR2_1FRGR_a02{xxx1,13}  = xss_2GR2_1FRGR_a02{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a02{xxx1,11};
%     xss_2GR2_1FRGR_a02{xxx1,14}  = ssim( xss_2GR2_1FRGR_a02{xxx1,12},xss_2GR2_1FRGR_a02{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_1FRGR_a03(:,1))
    xss_2GR2_1FRGR_a03{xxx1,4}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a03{xxx1,5}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a03{xxx1,6}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a03{xxx1,7}  = xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a03{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a03{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a03{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a03{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a03{xxx1,10}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a03{xxx1,11}  = xss_2GR2_1FRGR_a03{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a03{xxx1,12}  = xss_2GR2_1FRGR_a03{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a03{xxx1,13}  = (xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a03{xxx1,14}  = (xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a03{xxx1,15}  = (xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a03{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a03{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a03{xxx1,16} = mean([xss_2GR2_1FRGR_a03{xxx1,12},xss_2GR2_1FRGR_a03{xxx1,13},xss_2GR2_1FRGR_a03{xxx1,14},xss_2GR2_1FRGR_a03{xxx1,15}]);
%     xss_2GR2_1FRGR_a03{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a03{xxx1,8};
%     xss_2GR2_1FRGR_a03{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a03{xxx1,9};
%     xss_2GR2_1FRGR_a03{xxx1,12}  = xss_2GR2_1FRGR_a03{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a03{xxx1,10};
%     xss_2GR2_1FRGR_a03{xxx1,13}  = xss_2GR2_1FRGR_a03{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a03{xxx1,11};
%     xss_2GR2_1FRGR_a03{xxx1,14}  = ssim( xss_2GR2_1FRGR_a03{xxx1,12},xss_2GR2_1FRGR_a03{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_1FRGR_a04(:,1))
    xss_2GR2_1FRGR_a04{xxx1,4}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a04{xxx1,5}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a04{xxx1,6}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a04{xxx1,7}  = xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a04{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a04{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a04{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a04{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a04{xxx1,10}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a04{xxx1,11}  = xss_2GR2_1FRGR_a04{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a04{xxx1,12}  = xss_2GR2_1FRGR_a04{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a04{xxx1,13}  = (xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a04{xxx1,14}  = (xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a04{xxx1,15}  = (xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a04{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a04{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a04{xxx1,16} = mean([xss_2GR2_1FRGR_a04{xxx1,12},xss_2GR2_1FRGR_a04{xxx1,13},xss_2GR2_1FRGR_a04{xxx1,14},xss_2GR2_1FRGR_a04{xxx1,15}]);
%     xss_2GR2_1FRGR_a04{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a04{xxx1,8};
%     xss_2GR2_1FRGR_a04{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a04{xxx1,9};
%     xss_2GR2_1FRGR_a04{xxx1,12}  = xss_2GR2_1FRGR_a04{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a04{xxx1,10};
%     xss_2GR2_1FRGR_a04{xxx1,13}  = xss_2GR2_1FRGR_a04{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a04{xxx1,11};
%     xss_2GR2_1FRGR_a04{xxx1,14}  = ssim( xss_2GR2_1FRGR_a04{xxx1,12},xss_2GR2_1FRGR_a04{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_1FRGR_a05(:,1))
    xss_2GR2_1FRGR_a05{xxx1,4}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a05{xxx1,5}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a05{xxx1,6}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a05{xxx1,7}  = xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a05{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a05{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a05{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a05{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a05{xxx1,10}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a05{xxx1,11}  = xss_2GR2_1FRGR_a05{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a05{xxx1,12}  = xss_2GR2_1FRGR_a05{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a05{xxx1,13}  = (xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a05{xxx1,14}  = (xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a05{xxx1,15}  = (xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a05{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a05{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a05{xxx1,16} = mean([xss_2GR2_1FRGR_a05{xxx1,12},xss_2GR2_1FRGR_a05{xxx1,13},xss_2GR2_1FRGR_a05{xxx1,14},xss_2GR2_1FRGR_a05{xxx1,15}]);
%     xss_2GR2_1FRGR_a05{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a05{xxx1,8};
%     xss_2GR2_1FRGR_a05{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a05{xxx1,9};
%     xss_2GR2_1FRGR_a05{xxx1,12}  = xss_2GR2_1FRGR_a05{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a05{xxx1,10};
%     xss_2GR2_1FRGR_a05{xxx1,13}  = xss_2GR2_1FRGR_a05{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a05{xxx1,11};
%     xss_2GR2_1FRGR_a05{xxx1,14}  = ssim( xss_2GR2_1FRGR_a05{xxx1,12},xss_2GR2_1FRGR_a05{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_1FRGR_a06(:,1))
    xss_2GR2_1FRGR_a06{xxx1,4}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,1}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a06{xxx1,5}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,3};
    xss_2GR2_1FRGR_a06{xxx1,6}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,1};
    xss_2GR2_1FRGR_a06{xxx1,7}  = xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,1};
    xss_2GR2_1FRGR_a06{xxx1,8}  = sum(sum(xss_2GR2_1FRGR_a06{xxx1,1}{1,1}{1,3}));
    xss_2GR2_1FRGR_a06{xxx1,9}  = sum(sum(xss_2GR2_1FRGR_a06{xxx1,2}{1,1}{1,3}));
    xss_2GR2_1FRGR_a06{xxx1,10}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,4};
    xss_2GR2_1FRGR_a06{xxx1,11}  = xss_2GR2_1FRGR_a06{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_1FRGR_a06{xxx1,12}  = xss_2GR2_1FRGR_a06{xxx1,3};
    % Pmean FR
    xss_2GR2_1FRGR_a06{xxx1,13}  = (xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,2}-abs(xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,2}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,2}))/xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,2};
    % Pmedian FR
    xss_2GR2_1FRGR_a06{xxx1,14}  = (xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,3}-abs(xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,3}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,3}))/xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,3};
    % Psd FR
    xss_2GR2_1FRGR_a06{xxx1,15}  = (xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,4}-abs(xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,4}-xss_2GR2_1FRGR_a06{xxx1,2}{1,3}{1,4}))/xss_2GR2_1FRGR_a06{xxx1,1}{1,3}{1,4};
    % Smean
    xss_2GR2_1FRGR_a06{xxx1,16} = mean([xss_2GR2_1FRGR_a06{xxx1,12},xss_2GR2_1FRGR_a06{xxx1,13},xss_2GR2_1FRGR_a06{xxx1,14},xss_2GR2_1FRGR_a06{xxx1,15}]);
%     xss_2GR2_1FRGR_a06{xxx1,10}  = xss_set/xss_2GR2_1FRGR_a06{xxx1,8};
%     xss_2GR2_1FRGR_a06{xxx1,11}  = xss_set/xss_2GR2_1FRGR_a06{xxx1,9};
%     xss_2GR2_1FRGR_a06{xxx1,12}  = xss_2GR2_1FRGR_a06{xxx1,1}{1,1}{1,3}.*xss_2GR2_1FRGR_a06{xxx1,10};
%     xss_2GR2_1FRGR_a06{xxx1,13}  = xss_2GR2_1FRGR_a06{xxx1,2}{1,1}{1,3}.*xss_2GR2_1FRGR_a06{xxx1,11};
%     xss_2GR2_1FRGR_a06{xxx1,14}  = ssim( xss_2GR2_1FRGR_a06{xxx1,12},xss_2GR2_1FRGR_a06{xxx1,13});   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
for xxx1 = 1:numel(xss_2GR2_2GRFR_a11(:,1))
    xss_2GR2_2GRFR_a11{xxx1,4}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a11{xxx1,5}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a11{xxx1,6}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a11{xxx1,7}  = xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a11{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a11{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a11{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a11{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a11{xxx1,10}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a11{xxx1,11}  = xss_2GR2_2GRFR_a11{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a11{xxx1,12}  = xss_2GR2_2GRFR_a11{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a11{xxx1,13}  = (xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a11{xxx1,14}  = (xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a11{xxx1,15}  = (xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a11{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a11{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a11{xxx1,16} = mean([xss_2GR2_2GRFR_a11{xxx1,12},xss_2GR2_2GRFR_a11{xxx1,13},xss_2GR2_2GRFR_a11{xxx1,14},xss_2GR2_2GRFR_a11{xxx1,15}]);
%     xss_2GR2_2GRFR_a11{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a11{xxx1,8};
%     xss_2GR2_2GRFR_a11{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a11{xxx1,9};
%     xss_2GR2_2GRFR_a11{xxx1,12}  = xss_2GR2_2GRFR_a11{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a11{xxx1,10};
%     xss_2GR2_2GRFR_a11{xxx1,13}  = xss_2GR2_2GRFR_a11{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a11{xxx1,11};
%     xss_2GR2_2GRFR_a11{xxx1,14}  = ssim( xss_2GR2_2GRFR_a11{xxx1,12},xss_2GR2_2GRFR_a11{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_2GRFR_a12(:,1))
    xss_2GR2_2GRFR_a12{xxx1,4}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a12{xxx1,5}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a12{xxx1,6}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a12{xxx1,7}  = xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a12{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a12{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a12{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a12{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a12{xxx1,10}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a12{xxx1,11}  = xss_2GR2_2GRFR_a12{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a12{xxx1,12}  = xss_2GR2_2GRFR_a12{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a12{xxx1,13}  = (xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a12{xxx1,14}  = (xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a12{xxx1,15}  = (xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a12{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a12{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a12{xxx1,16} = mean([xss_2GR2_2GRFR_a12{xxx1,12},xss_2GR2_2GRFR_a12{xxx1,13},xss_2GR2_2GRFR_a12{xxx1,14},xss_2GR2_2GRFR_a12{xxx1,15}]);
%     xss_2GR2_2GRFR_a12{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a12{xxx1,8};
%     xss_2GR2_2GRFR_a12{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a12{xxx1,9};
%     xss_2GR2_2GRFR_a12{xxx1,12}  = xss_2GR2_2GRFR_a12{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a12{xxx1,10};
%     xss_2GR2_2GRFR_a12{xxx1,13}  = xss_2GR2_2GRFR_a12{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a12{xxx1,11};
%     xss_2GR2_2GRFR_a12{xxx1,14}  = ssim( xss_2GR2_2GRFR_a12{xxx1,12},xss_2GR2_2GRFR_a12{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_2GRFR_a13(:,1))
    xss_2GR2_2GRFR_a13{xxx1,4}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a13{xxx1,5}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a13{xxx1,6}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a13{xxx1,7}  = xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a13{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a13{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a13{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a13{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a13{xxx1,10}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a13{xxx1,11}  = xss_2GR2_2GRFR_a13{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a13{xxx1,12}  = xss_2GR2_2GRFR_a13{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a13{xxx1,13}  = (xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a13{xxx1,14}  = (xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a13{xxx1,15}  = (xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a13{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a13{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a13{xxx1,16} = mean([xss_2GR2_2GRFR_a13{xxx1,12},xss_2GR2_2GRFR_a13{xxx1,13},xss_2GR2_2GRFR_a13{xxx1,14},xss_2GR2_2GRFR_a13{xxx1,15}]);
%     xss_2GR2_2GRFR_a13{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a13{xxx1,8};
%     xss_2GR2_2GRFR_a13{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a13{xxx1,9};
%     xss_2GR2_2GRFR_a13{xxx1,12}  = xss_2GR2_2GRFR_a13{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a13{xxx1,10};
%     xss_2GR2_2GRFR_a13{xxx1,13}  = xss_2GR2_2GRFR_a13{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a13{xxx1,11};
%     xss_2GR2_2GRFR_a13{xxx1,14}  = ssim( xss_2GR2_2GRFR_a13{xxx1,12},xss_2GR2_2GRFR_a13{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_2GRFR_a14(:,1))
    xss_2GR2_2GRFR_a14{xxx1,4}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a14{xxx1,5}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a14{xxx1,6}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a14{xxx1,7}  = xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a14{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a14{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a14{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a14{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a14{xxx1,10}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a14{xxx1,11}  = xss_2GR2_2GRFR_a14{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a14{xxx1,12}  = xss_2GR2_2GRFR_a14{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a14{xxx1,13}  = (xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a14{xxx1,14}  = (xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a14{xxx1,15}  = (xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a14{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a14{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a14{xxx1,16} = mean([xss_2GR2_2GRFR_a14{xxx1,12},xss_2GR2_2GRFR_a14{xxx1,13},xss_2GR2_2GRFR_a14{xxx1,14},xss_2GR2_2GRFR_a14{xxx1,15}]);
%     xss_2GR2_2GRFR_a14{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a14{xxx1,8};
%     xss_2GR2_2GRFR_a14{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a14{xxx1,9};
%     xss_2GR2_2GRFR_a14{xxx1,12}  = xss_2GR2_2GRFR_a14{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a14{xxx1,10};
%     xss_2GR2_2GRFR_a14{xxx1,13}  = xss_2GR2_2GRFR_a14{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a14{xxx1,11};
%     xss_2GR2_2GRFR_a14{xxx1,14}  = ssim( xss_2GR2_2GRFR_a14{xxx1,12},xss_2GR2_2GRFR_a14{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_2GRFR_a15(:,1))
    xss_2GR2_2GRFR_a15{xxx1,4}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a15{xxx1,5}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a15{xxx1,6}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a15{xxx1,7}  = xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a15{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a15{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a15{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a15{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a15{xxx1,10}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a15{xxx1,11}  = xss_2GR2_2GRFR_a15{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a15{xxx1,12}  = xss_2GR2_2GRFR_a15{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a15{xxx1,13}  = (xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a15{xxx1,14}  = (xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a15{xxx1,15}  = (xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a15{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a15{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a15{xxx1,16} = mean([xss_2GR2_2GRFR_a15{xxx1,12},xss_2GR2_2GRFR_a15{xxx1,13},xss_2GR2_2GRFR_a15{xxx1,14},xss_2GR2_2GRFR_a15{xxx1,15}]);
%     xss_2GR2_2GRFR_a15{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a15{xxx1,8};
%     xss_2GR2_2GRFR_a15{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a15{xxx1,9};
%     xss_2GR2_2GRFR_a15{xxx1,12}  = xss_2GR2_2GRFR_a15{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a15{xxx1,10};
%     xss_2GR2_2GRFR_a15{xxx1,13}  = xss_2GR2_2GRFR_a15{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a15{xxx1,11};
%     xss_2GR2_2GRFR_a15{xxx1,14}  = ssim( xss_2GR2_2GRFR_a15{xxx1,12},xss_2GR2_2GRFR_a15{xxx1,13});   
end
for xxx1 = 1:numel(xss_2GR2_2GRFR_a16(:,1))
    xss_2GR2_2GRFR_a16{xxx1,4}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{1,1}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a16{xxx1,5}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{1,3}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{1,3};
    xss_2GR2_2GRFR_a16{xxx1,6}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{1,1};
    xss_2GR2_2GRFR_a16{xxx1,7}  = xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{1,1};
    xss_2GR2_2GRFR_a16{xxx1,8}  = sum(sum(xss_2GR2_2GRFR_a16{xxx1,1}{1,1}{1,3}));
    xss_2GR2_2GRFR_a16{xxx1,9}  = sum(sum(xss_2GR2_2GRFR_a16{xxx1,2}{1,1}{1,3}));
    xss_2GR2_2GRFR_a16{xxx1,10}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,4};
    xss_2GR2_2GRFR_a16{xxx1,11}  = xss_2GR2_2GRFR_a16{xxx1,2}{1,4};
    % SSIM
    xss_2GR2_2GRFR_a16{xxx1,12}  = xss_2GR2_2GRFR_a16{xxx1,3};
    % Pmean FR
    xss_2GR2_2GRFR_a16{xxx1,13}  = (xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,2}-abs(xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,2}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{2,2}))/xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,2};
    % Pmedian FR
    xss_2GR2_2GRFR_a16{xxx1,14}  = (xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,3}-abs(xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,3}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{2,3}))/xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,3};
    % Psd FR
    xss_2GR2_2GRFR_a16{xxx1,15}  = (xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,4}-abs(xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,4}-xss_2GR2_2GRFR_a16{xxx1,2}{1,3}{2,4}))/xss_2GR2_2GRFR_a16{xxx1,1}{1,3}{2,4};
    % Smean
    xss_2GR2_2GRFR_a16{xxx1,16} = mean([xss_2GR2_2GRFR_a16{xxx1,12},xss_2GR2_2GRFR_a16{xxx1,13},xss_2GR2_2GRFR_a16{xxx1,14},xss_2GR2_2GRFR_a16{xxx1,15}]);
%     xss_2GR2_2GRFR_a16{xxx1,10}  = xss_set/xss_2GR2_2GRFR_a16{xxx1,8};
%     xss_2GR2_2GRFR_a16{xxx1,11}  = xss_set/xss_2GR2_2GRFR_a16{xxx1,9};
%     xss_2GR2_2GRFR_a16{xxx1,12}  = xss_2GR2_2GRFR_a16{xxx1,1}{1,1}{1,3}.*xss_2GR2_2GRFR_a16{xxx1,10};
%     xss_2GR2_2GRFR_a16{xxx1,13}  = xss_2GR2_2GRFR_a16{xxx1,2}{1,1}{1,3}.*xss_2GR2_2GRFR_a16{xxx1,11};
%     xss_2GR2_2GRFR_a16{xxx1,14}  = ssim( xss_2GR2_2GRFR_a16{xxx1,12},xss_2GR2_2GRFR_a16{xxx1,13});   
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
% sortrows by set 100,000
%%%%%%%%%%%%%%%%%%%%%
xsss_1CON_1FRGR_a01 = sortrows(xss_1CON_1FRGR_a01,16,'descend');
xsss_1CON_1FRGR_a02= sortrows(xss_1CON_1FRGR_a02,16,'descend');
xsss_1CON_1FRGR_a03= sortrows(xss_1CON_1FRGR_a03,16,'descend');
xsss_1CON_1FRGR_a04= sortrows(xss_1CON_1FRGR_a04,16,'descend');
xsss_1CON_1FRGR_a05 = sortrows(xss_1CON_1FRGR_a05,16,'descend');
xsss_1CON_1FRGR_a06 = sortrows(xss_1CON_1FRGR_a06,16,'descend');
%%%
xsss_1CON_2GRFR_a11 = sortrows(xss_1CON_2GRFR_a11,16,'descend');
xsss_1CON_2GRFR_a12= sortrows(xss_1CON_2GRFR_a12,16,'descend');
xsss_1CON_2GRFR_a13= sortrows(xss_1CON_2GRFR_a13,16,'descend');
xsss_1CON_2GRFR_a14= sortrows(xss_1CON_2GRFR_a14,16,'descend');
xsss_1CON_2GRFR_a15 = sortrows(xss_1CON_2GRFR_a15,16,'descend');
xsss_1CON_2GRFR_a16 = sortrows(xss_1CON_2GRFR_a16,16,'descend');
%%%%%
%%%%%%%%%%
xsss_2GR2_1FRGR_a01 = sortrows(xss_2GR2_1FRGR_a01,16,'descend');
xsss_2GR2_1FRGR_a02= sortrows(xss_2GR2_1FRGR_a02,16,'descend');
xsss_2GR2_1FRGR_a03= sortrows(xss_2GR2_1FRGR_a03,16,'descend');
xsss_2GR2_1FRGR_a04= sortrows(xss_2GR2_1FRGR_a04,16,'descend');
xsss_2GR2_1FRGR_a05 = sortrows(xss_2GR2_1FRGR_a05,16,'descend');
xsss_2GR2_1FRGR_a06 = sortrows(xss_2GR2_1FRGR_a06,16,'descend');
%%%
xsss_2GR2_2GRFR_a11 = sortrows(xss_2GR2_2GRFR_a11,16,'descend');
xsss_2GR2_2GRFR_a12= sortrows(xss_2GR2_2GRFR_a12,16,'descend');
xsss_2GR2_2GRFR_a13= sortrows(xss_2GR2_2GRFR_a13,16,'descend');
xsss_2GR2_2GRFR_a14= sortrows(xss_2GR2_2GRFR_a14,16,'descend');
xsss_2GR2_2GRFR_a15 = sortrows(xss_2GR2_2GRFR_a15,16,'descend');
xsss_2GR2_2GRFR_a16 = sortrows(xss_2GR2_2GRFR_a16,16,'descend');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01:  2DP020   /   a03:1DP025  /   a05:4DP015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xy_name1 = xsss_1CON_1FRGR_a01{1,1}{1,2};
% xy_image_1raw =  strrep(xy_name1,'_wMean_bMedian_onlyImage_SD000.mat','.tif');
% xy_name2 = xsss_1CON_1FRGR_a01{1,2}{1,2};
% xy_image_2sim =  strrep(xy_name2,'_wMean_bMedian_onlyImage_SD000.mat','.tif');
% xy_image_3loc =  strrep(xy_name2,'21-Heatmap_Densioty__31_1FRserGRfix_HeatMap_2DP020_heatmap_densityplot_line_wMean_bMedian_onlyImage_SD000.mat','001-scatter-all.tif');

% a01 = '*FRserGRfix*DP020*SD000*.mat';
% a02 = '*FRserGRfix*DP020*SD000*.mat';
% a03 = '*FRserGRfix*DP025*SD000*.mat';
% a04 = '*FRserGRfix*DP025*SD000*.mat';
% a05 = '*FRserGRfix*DP015*SD000*.mat';
% a06 = '*FRserGRfix*DP015*SD000*.mat';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
tt2 = datetime('now');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% data analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File naming
xy_n001 = '1CON_1FRGR_2DP020';
xy_n002 = '1CON_1FRGR_2DP020';
xy_n003 = '1CON_1FRGR_1DP025';
xy_n004 = '1CON_1FRGR_1DP025';
xy_n005 = '1CON_1FRGR_4DP015';
xy_n006 = '1CON_1FRGR_4DP015';
%%%
xy_n011 = '1CON_2GRFR_2DP020';
xy_n012 = '1CON_2GRFR_2DP020';
xy_n013 = '1CON_2GRFR_1DP025';
xy_n014 = '1CON_2GRFR_1DP025';
xy_n015 = '1CON_2GRFR_4DP015';
xy_n016 = '1CON_2GRFR_4DP015';
%%%%%%%%
xy_n101 = '2GR2_1FRGR_2DP020';
xy_n102 = '2GR2_1FRGR_2DP020';
xy_n103 = '2GR2_1FRGR_1DP025';
xy_n104 = '2GR2_1FRGR_1DP025';
xy_n105 = '2GR2_1FRGR_4DP015';
xy_n106 = '2GR2_1FRGR_4DP015';
%%%
xy_n111 = '2GR2_2GRFR_2DP020';
xy_n112 = '2GR2_2GRFR_2DP020';
xy_n113 = '2GR2_2GRFR_1DP025';
xy_n114 = '2GR2_2GRFR_1DP025';
xy_n115 = '2GR2_2GRFR_4DP015';
xy_n116 = '2GR2_2GRFR_4DP015';
%%%%%%%%%%%%
%%%%%%%%%%%%
% number
% zzzN = numel(zzz_data(:,1));
% zzzN = 10;
% set(gcf,'visible','on')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '2DP020';
xxxn2 = '1FRserGRfix';xxxn3='31';
zzz_data = xsss_1CON_1FRGR_a01;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n001];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n001 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ]; 
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_1FRGR_a01;
% zzz_folder = [zFolderSave '\' xy_n001];
% zzz_name = [xy_n001 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n001 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a03
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '1DP025';
xxxn2 = '1FRserGRfix';xxxn3='31';
zzz_data = xsss_1CON_1FRGR_a03;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n003];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n003 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_1FRGR_a03;
% zzz_folder = [zFolderSave '\' xy_n003];
% zzz_name = [xy_n003 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n003 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '4DP015';
xxxn2 = '1FRserGRfix';xxxn3='31';
zzz_data = xsss_1CON_1FRGR_a05;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n005];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n005 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_1FRGR_a05;
% zzz_folder = [zFolderSave '\' xy_n005];
% zzz_name = [xy_n005 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n005 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '2DP020';
xxxn2 = '1GRserFRfix';xxxn3='32';
zzz_data = xsss_1CON_2GRFR_a11;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n011];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n011 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_2GRFR_a11;
% zzz_folder = [zFolderSave '\' xy_n011];
% zzz_name = [xy_n011 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n011 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a03
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '1DP025';
xxxn2 = '1GRserFRfix';xxxn3='32';
zzz_data = xsss_1CON_2GRFR_a13;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n013];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n013 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_2GRFR_a13;
% zzz_folder = [zFolderSave '\' xy_n013];
% zzz_name = [xy_n013 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n013 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '4DP015';
xxxn2 = '1GRserFRfix';xxxn3='32';
zzz_data = xsss_1CON_2GRFR_a15;
xxxs = length(zzz_data(1,10));
zzz_folder = [zFolderSave '\' xy_n015];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n015 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_1CON_2GRFR_a15;
% zzz_folder = [zFolderSave '\' xy_n015];
% zzz_name = [xy_n015 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n015 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
tt3 = datetime('now');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GR2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '2DP020';
xxxn2 = '1FRserGRfix';xxxn3='31';
xxxs = 20;
zzz_data = xsss_2GR2_1FRGR_a01;
zzz_folder = [zFolderSave '\' xy_n101];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n101 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_1FRGR_a01;
% zzz_folder = [zFolderSave '\' xy_n101];
% zzz_name = [xy_n101 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n101 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a03
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '1DP025';
xxxn2 = '1FRserGRfix';xxxn3='31';
xxxs = 25;
zzz_data = xsss_2GR2_1FRGR_a03;
zzz_folder = [zFolderSave '\' xy_n103];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n103 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_1FRGR_a03;
% zzz_folder = [zFolderSave '\' xy_n103];
% zzz_name = [xy_n103 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n103 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '4DP015';
xxxn2 = '1FRserGRfix';xxxn3='31';
xxxs = 15;
zzz_data = xsss_2GR2_1FRGR_a05;
zzz_folder = [zFolderSave '\' xy_n105];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n105 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_1FRGR_a05;
% zzz_folder = [zFolderSave '\' xy_n105];
% zzz_name = [xy_n105 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n105 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '2DP020';
xxxn2 = '1GRserFRfix';xxxn3='32';
xxxs = 20;
zzz_data = xsss_2GR2_2GRFR_a11;
zzz_folder = [zFolderSave '\' xy_n111];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n111 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_2GRFR_a11;
% zzz_folder = [zFolderSave '\' xy_n111];
% zzz_name = [xy_n111 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n111 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a03
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '1DP025';
xxxn2 = '1GRserFRfix';xxxn3='32';
xxxs = 25;
zzz_data = xsss_2GR2_2GRFR_a13;
zzz_folder = [zFolderSave '\' xy_n113];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n113 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_2GRFR_a13;
% zzz_folder = [zFolderSave '\' xy_n113];
% zzz_name = [xy_n113 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n113 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xxxn1 = '4DP015';
xxxn2 = '1GRserFRfix';xxxn3='32';
xxxs = 15;
zzz_data = xsss_2GR2_2GRFR_a15;
zzz_folder = [zFolderSave '\' xy_n115];
mkdir(zzz_folder)
for zzz=1:zzzN
    zzz_name = [xy_n115 '_1scaled_order_' num2str(zzz,'%03.0f') '_' ];
    zzz_import = zzz_data{zzz,2}{1,5};
    sim_comparison_04gcLBB_jet_Lo3_GF(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
end
clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%
% zzz_data = xss_2GR2_2GRFR_a15;
% zzz_folder = [zFolderSave '\' xy_n115];
% zzz_name = [xy_n115 '_2raw_order_'];
% for zzz=1:zzzN
%     zzz_name = [xy_n115 '_2raw_order_' num2str(zzz,'%03.0f') '_' ];
%     sim_comparison_04gcLBB_jet_Lo3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
% end
% clear zzz_data zzz_folder zzz_name zzz_import
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addpath D:\Downdata\00-NuclearEnvelope
% 
% xy_name1 = xsss_1CON_1FRGR_a05{1,1}{1,2};
% xy_image_1raw =  strrep(xy_name1,'_wMean_bMedian_onlyImage_SD000.mat','.tif');
% xy_name2 = xsss_1CON_1FRGR_a05{1,2}{1,2};
% xy_image_2sim =  strrep(xy_name2,'_wMean_bMedian_onlyImage_SD000.mat','.tif');
% xy_image_3loc =  strrep(xy_name2,'21-Heatmap_Densioty\21-Heatmap_Densioty__31_1FRserGRfix_HeatMap_4DP015_heatmap_densityplot_line_wMean_bMedian_onlyImage_SD000.mat','001-scatter-all.tif');
% xy_image_4SSIM_nS = xsss_1CON_1FRGR_a05{1,3};
% xy_image_5SSIM_S = xsss_1CON_1FRGR_a05{1,14};
% xy_image_6n_exp = xsss_1CON_1FRGR_a05{1,6};
% xy_image_7n_sim = xsss_1CON_1FRGR_a05{1,7};
% %%%%%%%%%%%%
% xy_name12 = xsss_1CON_1FRGR_a05{1,12};
% xy_name13 = xsss_1CON_1FRGR_a05{1,13};
% %%%%%%%%%%%%%%%%%%
% % Table 1
% xy_table_01E =  xsss_1CON_1FRGR_a05{1,1}{1,3};
% xy_table_02S =  xsss_1CON_1FRGR_a05{1,2}{1,3};
% xy_table_01E.Properties.RowNames = {'Exp_FR_search__GR_fix','Exp_GR_search__FR_fix'};
% xy_table_02S.Properties.RowNames = {'Sim_FR_search__GR_fix','Sim_GR_search__FR_fix'};
% xy_table_03All = [xy_table_01E;xy_table_02S];
% %%%%%
% x11name = [pwd '\' zFolderSave '\' xy_n005 '__2table_all'];
% save(x11name,'xy_table_03All');
% x11nameA = [x11name '.csv'];
% writetable(xy_table_03All,x11nameA,'WriteRowNames',true);
% x11nameA = [x11name '.txt'];
% writetable(xy_table_03All,x11nameA,'Delimiter','bar','WriteRowNames',true);
% %%%%%%%%%%%%%%%%%%
% % Table 2 - Location
% xy_table_11E =  cell2table({xsss_1CON_1FRGR_a05{1,1}{1,2}});
% x11nameA = [x11name '__1Exp_location.txt'];
% writetable(xy_table_11E,x11nameA,'Delimiter','bar','WriteRowNames',true);
% xy_table_12S =  cell2table({xsss_1CON_1FRGR_a05{1,2}{1,2}});
% x11nameA = [x11name '__2Sim_location.txt'];
% writetable(xy_table_12S,x11nameA,'Delimiter','bar','WriteRowNames',true);
% 
% %%%%%%%%%%%%%%
% % bar size
% p21bar = 10001;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(gcf,'units','centimeters','position',[0.2 1.5 45 25],'OuterPosition',[0.2 1.5 45 25])
% %%%%
% subplot(2,3,1,'position',[0.04 0.60 0.36 0.36])
% imshow(xy_image_1raw);
% text(.5,1,['Experiemnts  I_F_R / I_G   n: ',num2str(xy_image_6n_exp)],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')
% %%%%           
% subplot(2,3,2,'position',[0.29 0.60 0.36 0.36])
% imshow(xy_image_2sim);
% text(.5,1,['Simulation  I_F_R / I_G   SSIM: ',num2str(xy_image_4SSIM_nS),'  n: ' num2str(xy_image_7n_sim)],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')
% %%%%
% subplot(2,3,3,'position',[0.51 0.60 0.36 0.36])
% imshow(xy_image_3loc);
% text(.5,1,['Simulation  I_F_R and I_G'],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')
% %%%%
% subplot(2,3,4,'position',[0.04 0.18 0.36 0.36])      
% pcolor(xy_name12)
% shading interp
% colormap(jet(p21bar-1))
% axis square
% set(gca,'XTick',[1 10 20],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
% set(gca,'YTick',[1 10 20],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
% % colorbar
% colorbar('Ticks',[0],'TickLabels',{})
% % colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% text(.5,1,['Experiemnts (scaled)  I_F_R / I_G'],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')
% %%%%
% subplot(2,3,5,'position',[0.29 0.18 0.36 0.36])      
% pcolor(xy_name13)
% shading interp
% colormap(jet(p21bar-1))
% axis square
% set(gca,'XTick',[1 10 20],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
% set(gca,'YTick',[1 10 20],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
% % colorbar
% colorbar('Ticks',[0],'TickLabels',{})
% % colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% text(.5,1,['Simulation (scaled)  I_F_R / I_G   SSIM: ',num2str(xy_image_5SSIM_S)],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')     
% %%%%
% subplot(2,3,6,'position',[0.51 0.18 0.36 0.36])
% imshow(xy_image_3loc);
% text(.5,1,['Simulation  I_F_R and I_G'],...
%                 'horiz','center',...
%                 'vert','bottom',...
%                 'units','normalized')      
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%
% % Save file
% set(gcf, 'paperpositionmode', 'auto');
% eF4name2 = [pwd '\' zFolderSave '\' xy_n005 '__1densitymap'];
% % export_fig(eF4name2,'-tiff','-m1');
% % print(gcf,'-dtiff','-r300',eF4name2)
% export_fig(eF4name2,'-tiff','-m1','-transparent');
% close gcf;
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% %%%%%%%%%%%%%%%%%%%%
% % Table 2
% xsss_table = xsss_1CON_1FRGR_a01;
% xsss_tableN = xy_n001;
% %%%%
% xxxy_table_21E = table(cell2mat(xsss_table(:,12)),cell2mat(xsss_table(:,13)),...
%     cell2mat(xsss_table(:,14)),cell2mat(xsss_table(:,15)),...
%     cell2mat(xsss_table(:,16)),...
%     'VariableNames',{'SSIM','Ratio_mean','Ratio_median','Ratio_SD','SSIM_mean'});
% %%%%%
% x11name = [pwd '\' zFolderSave  '\' xsss_tableN '_All_SSIM_table'];
% % save(x11name,'xxxy_table_21E');
% x11nameA = [x11name '.csv'];
% writetable(xxxy_table_21E,x11nameA,'WriteRowNames',true);
% x11nameA = [x11name '.txt'];
% writetable(xxxy_table_21E,x11nameA,'Delimiter','bar','WriteRowNames',true);
% clear xsss_table xsss_tableN
% %%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xsss_table_all = {xsss_1CON_1FRGR_a01,xsss_1CON_1FRGR_a03,xsss_1CON_1FRGR_a05,...
    xsss_1CON_2GRFR_a11,xsss_1CON_2GRFR_a13,xsss_1CON_2GRFR_a15,...
    xsss_2GR2_1FRGR_a01,xsss_2GR2_1FRGR_a03,xsss_2GR2_1FRGR_a05,...
    xsss_2GR2_2GRFR_a11,xsss_2GR2_2GRFR_a13,xsss_2GR2_2GRFR_a15};
xsss_tableN_all = {xy_n001,xy_n003,xy_n005,...
    xy_n011,xy_n013,xy_n015,...
    xy_n101,xy_n103,xy_n105,...
    xy_n111,xy_n113,xy_n115};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% import data
for zzz=1:numel(xsss_table_all)
    for zzz2=1:numel(xsss_table_all{1,zzz}(:,1))
        zzz_import = xsss_table_all{1, zzz}{zzz2, 2}{1,5};
        xz_Location = zzz_import;
        xz1 = importdata(xz_Location);
        xsss_table2{zzz,1}{zzz2,1} = xz1.s_1FR_9inshp_um;
        xsss_table2{zzz,1}{zzz2,2} = xz1.s_2GR_9inshp_um;
        xsss_table2{zzz,1}{zzz2,3} = xz1.s_1FR_1diameter;
        xsss_table2{zzz,1}{zzz2,4} = xz1.s_1FR_2hallow;
        xsss_table2{zzz,1}{zzz2,5} = xz1.s_2GR_1diameter;
        xsss_table2{zzz,1}{zzz2,6} = xz1.s_2GR_2hallow;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
mkdir([pwd '\' zFolderSave  '\' '0Table\'])
for xsss = 1:numel(xsss_table_all)
    %%%%%%%%%%%%%%%%%%%%
    % Table 2
    xsss_table = xsss_table_all{1,xsss};
    xsss_tableN = xsss_tableN_all{1,xsss};
    xsss_table2a = xsss_table2{xsss,1};
    %%%%
        for xsss = 1:numel(xsss_table_all{1,xsss}(:,1))
        % folder name: 35-Direct_001 d03
        xsss_tableEB(xsss,1) = extractBetween(cell2mat(xsss_table{xsss, 2}(1, 2)),[d03 '\'],"\21");
        end
    %%%%
    xxxy_table_21E = table(cell2mat(xsss_table(:,12)),cell2mat(xsss_table(:,13)),...
        cell2mat(xsss_table(:,14)),cell2mat(xsss_table(:,15)),...
        cell2mat(xsss_table(:,16)),xsss_tableEB,...
        'VariableNames',{'SSIM','Ratio_mean','Ratio_median','Ratio_SD','SSIM_mean','Location'});
    %%%%%
    %%%%%%%%%%%%%%%%%

    %%%%%%%%
    %%%%%%%%%%%%
    xxxy_table_22E = table(cell2mat(xsss_table(:,16)),cell2mat(xsss_table(:,12)),...
        cell2mat(xsss_table2a(:,3)),cell2mat(xsss_table2a(:,4)),(cell2mat(xsss_table2a(:,3))+cell2mat(xsss_table2a(:,4)))./2,...
        cell2mat(xsss_table2a(:,5)),cell2mat(xsss_table2a(:,6)),(cell2mat(xsss_table2a(:,5))+cell2mat(xsss_table2a(:,6)))./2,...
        (cell2mat(xsss_table2a(:,5))+cell2mat(xsss_table2a(:,6)))./2-(cell2mat(xsss_table2a(:,3))+cell2mat(xsss_table2a(:,4)))./2,...
        'VariableNames',{'SSIM_mean','SSIM',...
        'I_FR Diamter','I_FR Hollow Diameter','I_FR Centre Diameter',...
        'I_GR Diamter','I_GR Hollow Diameter','I_GR Centre Diameter',...
        'I_GCD - I_FRCD'});
    %%%%%%
    x11name = [pwd '\' zFolderSave  '\' '0Table\' xsss_tableN '_All_SSIM_table_1'];
    % save(x11name,'xxxy_table_21E');
    x11nameA = [x11name '.csv'];
    writetable(xxxy_table_21E,x11nameA,'WriteRowNames',true);
    x11nameA = [x11name '.txt'];
    writetable(xxxy_table_21E,x11nameA,'Delimiter','bar','WriteRowNames',true);
    %%%%
    x12name = [pwd '\' zFolderSave  '\' '0Table\' xsss_tableN '_All_SSIM_table_2'];
    % save(x11name,'xxxy_table_21E');
    x12nameA = [x12name '.csv'];
    writetable(xxxy_table_22E,x12nameA,'WriteRowNames',true);
    x12nameA = [x12name '.txt'];
    writetable(xxxy_table_22E,x12nameA,'Delimiter','bar','WriteRowNames',true);
    %%%%
    clear xsss_table xsss_tableN xxxy_table_21E xsss_tableEB xsss_table2a xxxy_table_22E
    %%%%%%%%%%%%%%%%%%%%%%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Save Data
F10name = [pwd '\' zFolderSave  '\99_all_data'];
save(F10name,'-v7.3')
%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
tt4 = datetime('now');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
tt5 = datetime('now');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% working time
tt6d12 = tt2 - tt1;
tt6d23 = tt3 - tt2;
tt6d34 = tt4 - tt3;
tt6d45 = tt5 - tt4;
tt6dAll = tt5 - tt1;
tt12 = tt6d12 + tt6d23;
tt123 = tt12 + tt6d34;

tt71 = [tt1; tt2; tt3; tt4; tt5];
tt72 = [0; tt6d12; tt6d23; tt6d34; tt6d45];
tt73 = [0; tt6d12; tt12; tt123; tt6dAll];

Differece = tt72;
Cumulative = tt73;
Data = {string(tt1);string(tt2);string(tt3);string(tt4);string(tt5)};
tTable = table(Data,Differece,Cumulative);

% export excel data and table 
F12name = [pwd '\' zFolderSave '\00_working_time'];
writetable(tTable,F12name,'Delimiter','\t','WriteRowNames',true)



% % Figure hide
% set(0,'DefaultFigureVisible','off');
% % set(gcf,'visible','on')

% xs_1FRGR_a01_0S = cell2mat(xs_1FRGR_a01(:,3));
% [xs_1FRGR_a01_1max,xs_1FRGR_a01_2ide]= max(xs_1FRGR_a01_0S,5);
% 
% xs_1FRGR_a01_3sort = sort(xs_1FRGR_a01,3,'descend');

%%%%%



    
        
        




%%%%%%%%%%%
% similirity
% zz_ssimval = ssim(zz,zz4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a01 = '*FRserGRfix*DP020*SD000*.mat';
% a02 = '*FRserGRfix*DP020*SD000*.mat';
% a03 = '*FRserGRfix*DP025*SD000*.mat';
% a04 = '*FRserGRfix*DP025*SD000*.mat';
% a05 = '*FRserGRfix*DP015*SD000*.mat';
% a06 = '*FRserGRfix*DP015*SD000*.mat';
% %%%%
% a11 = '*GRserFRfix*DP020*SD000*.mat';
% a12 = '*GRserFRfix*DP020*SD000*.mat';
% a13 = '*GRserFRfix*DP025*SD000*.mat';
% a14 = '*GRserFRfix*DP025*SD000*.mat';
% a15 = '*GRserFRfix*DP015*SD000*.mat';
% a16 = '*GRserFRfix*DP015*SD000*.mat';


