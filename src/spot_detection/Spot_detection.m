%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SEL after IM processing

repoRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(fullfile(repoRoot,'common'));
addpath(fullfile(repoRoot,'..','third_party'));
check_dependencies();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% scaled images
aImage1FG = '01-FR';
aImage2GR = '01-GR';
aImage3BF = '01-BF';
% spot count (trackmate)
% aSpot1FG = '52-TM-FR-CANDLE-M03';
% aSpot2GR = '53-TM-GR-CANDLE-M03';
aSpot1FG = '02-FR-TM';
aSpot2GR = '02-GR-TM';
% ROI 
aROI = '02-ROI';
% Selection
% vSe6ROI_1R100_um_06FR_GR
% <0.55 / >0.95 

% CMOS
zPM = 15.4862;
% 1 frame time
FTi = 0.019;
% Area
dArea = 0.120;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%
% % mkdir(cSave);
% % cSave2 = [cSave '\'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import All (image and trackmate)
%%%%%%%%%%%%%%%%%%%%%%%
% FR: nup50 / GR: nup98
% 1: FR(16units)    2:GR(16units)    3: Spot FR(trackmate)      4: Spot GR(trackmate)
% 5: ROI(FIJI)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FR
a01 = [pwd '\' aImage1FG '\*.tif'];
b1ass = dir(a01);
b1assCell = struct2cell(b1ass)';
b1aFullPath = b1ass.folder;  
for aa1=1:numel(b1ass)
    aCheckName1 = [b1aFullPath '\' b1assCell{aa1,1}]; 
    bData11_FR{aa1,1} = importdata(aCheckName1);
end
% GR
a02 = [pwd '\' aImage2GR '\*.tif'];
b2ass = dir(a02);
b2assCell = struct2cell(b2ass)';
b2aFullPath = b2ass.folder;  
for aa1=1:numel(b2ass)
    aCheckName1 = [b2aFullPath '\' b2assCell{aa1,1}]; 
    bData12_GR{aa1,1} = importdata(aCheckName1);
end
% BF
a03 = [pwd '\' aImage3BF '\*.tif'];
b3ass = dir(a03);
b3assCell = struct2cell(b3ass)';
b3aFullPath = b3ass.folder;  
for aa1=1:numel(b3ass)
    aCheckName1 = [b3aFullPath '\' b3assCell{aa1,1}]; 
    bData10_BF{aa1,1} = importdata(aCheckName1);
end
% FR spot
a03 = [pwd '\' aSpot1FG '\*.xml'];
b3ass = dir(a03);
b3assCell = struct2cell(b3ass)';
b3aFullPath = b3ass.folder;  
for aa1=1:numel(b3ass)
    aCheckName1 = [b3aFullPath '\' b3assCell{aa1,1}]; 
    bData13_FFR{aa1,1} = trackmateSpots(aCheckName1);   
    bData13_FFRsp{aa1,1} = [table2array(bData13_FFR{aa1,1}(:,10)),table2array(bData13_FFR{aa1,1}(:,11))];
    bData13_FFRIntensityMedian{aa1,1} = [bData13_FFR{aa1,1}(:,7)];
    bData13_FFRIntensityMean{aa1,1} = [bData13_FFR{aa1,1}(:,6)];
    bData13_FFRIntensityTotal{aa1,1} = [bData13_FFR{aa1,1}(:,17)];
    bData13_FFRIntensitySTD{aa1,1} = [bData13_FFR{aa1,1}(:,16)];
end
% GR spot
a04 = [pwd '\' aSpot2GR '\*.xml'];
b4ass = dir(a04);
b4assCell = struct2cell(b4ass)';
b4aFullPath = b4ass.folder;  
for aa1=1:numel(b4ass)
    aCheckName1 = [b4aFullPath '\' b4assCell{aa1,1}]; 
    bData14_FGR{aa1,1} = trackmateSpots(aCheckName1);   
    bData14_FGRsp{aa1,1} = [table2array(bData14_FGR{aa1,1}(:,10)),table2array(bData14_FGR{aa1,1}(:,11))];
    bData14_FGRIntensityMedian{aa1,1} = [bData14_FGR{aa1,1}(:,7)];
    bData14_FGRIntensityMean{aa1,1} = [bData14_FGR{aa1,1}(:,6)];
    bData14_FGRIntensityTotal{aa1,1} = [bData14_FGR{aa1,1}(:,17)];
    bData14_FGRIntensitySTD{aa1,1} = [bData14_FGR{aa1,1}(:,16)];
end
% ROI - pixel
a05 = [pwd '\' aROI '\*.roi'];
b5ass = dir(a05);
b5assCell = struct2cell(b5ass)';
b5aFullPath = b5ass.folder;  
for aa1=1:numel(b5ass)
    aCheckName1 = [b5aFullPath '\' b5assCell{aa1,1}]; 
    bData15_ROI{aa1,1} = ReadImageJROI(aCheckName1);  
    bData15_ROImn{aa1,1} = bData15_ROI{aa1,1}.mnCoordinates;
end
% ROI+ending
bData16_ROImne = bData15_ROImn;
for aa2=1:numel(bData15_ROImn)
    bData16_ROImne{aa2,1}(end+1,:) = bData15_ROImn{aa2,1}(1,:);
end
%%%%%%%%%%%%%%%%%%%%%%%%
% ROI size reduction
% xt = A*x+(1-A)*mean(x(1:end-1))
% yt = A*y+(1-A)*mean(y(1:end-1))
%%%%%%%%%%%%%%%%%%%%%%
% 90% size
A=0.9;
for aa2=1:numel(bData16_ROImne)
    for aa3=numel(bData16_ROImne{aa2,1}(:,1))
        x = bData16_ROImne{aa2,1}(:,1);
        y = bData16_ROImne{aa2,1}(:,2);
        xt = A*x+(1-A)*mean(x(1:end-1));
        yt = A*y+(1-A)*mean(y(1:end-1));
        bData16_ROImne_R90{aa2,1} = [xt,yt];
    end
end
% 85% size
A=0.85;
for aa2=1:numel(bData16_ROImne)
    for aa3=numel(bData16_ROImne{aa2,1}(:,1))
        x = bData16_ROImne{aa2,1}(:,1);
        y = bData16_ROImne{aa2,1}(:,2);
        xt = A*x+(1-A)*mean(x(1:end-1));
        yt = A*y+(1-A)*mean(y(1:end-1));
        bData16_ROImne_R85{aa2,1} = [xt,yt];
    end
end
% 80% size
A=0.8;
for aa2=1:numel(bData16_ROImne)
    for aa3=numel(bData16_ROImne{aa2,1}(:,1))
        x = bData16_ROImne{aa2,1}(:,1);
        y = bData16_ROImne{aa2,1}(:,2);
        xt = A*x+(1-A)*mean(x(1:end-1));
        yt = A*y+(1-A)*mean(y(1:end-1));
        bData16_ROImne_R80{aa2,1} = [xt,yt];
    end
end

% 70% size
A=0.7;
for aa2=1:numel(bData16_ROImne)
    for aa3=numel(bData16_ROImne{aa2,1}(:,1))
        x = bData16_ROImne{aa2,1}(:,1);
        y = bData16_ROImne{aa2,1}(:,2);
        xt = A*x+(1-A)*mean(x(1:end-1));
        yt = A*y+(1-A)*mean(y(1:end-1));
        bData16_ROImne_R70{aa2,1} = [xt,yt];
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Position alinement
%  
%  GR has more number, all GR position to - x31_1GRFR_1R100_serZP_nm_3Median
% aAli = x31_1GRFR_1R100_serZP_um_3Median;
% aAli = [-0.0515604014911304, 0.0361530781750652];
if exist('aAli') == 1
    bData13_FFRsp_raw = bData13_FFRsp;
    bData13_FFRsp = cellfun(@(x) x-aAli,bData13_FFRsp,'un',0);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data
% 1:FR image  2:GR image  3:FRspot  4:GRspot  
% 5:FRmedian  6:GRmedian  7:FRmean  8:FRmean
% 9:FRtotal 10:GRtotal  11:FRstd  12:GRstd 
% 13:ROI  14:ROI+ending
bData21_all = [bData10_BF,...
    bData11_FR,bData12_GR,bData13_FFRsp,bData13_FFR,bData14_FGRsp,bData14_FGR,...
    bData13_FFRIntensityMedian,bData14_FGRIntensityMedian,bData13_FFRIntensityMean,bData14_FGRIntensityMean,...
    bData13_FFRIntensityTotal,bData14_FGRIntensityTotal,bData13_FFRIntensitySTD,bData14_FGRIntensitySTD,...
    bData15_ROI,bData15_ROImn,bData16_ROImne,...
    bData16_ROImne_R70,bData16_ROImne_R80,bData16_ROImne_R85,bData16_ROImne_R90];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
% Selection (remove extreme case)
% 20,25,38,41,42,50
%%%%%%%%%%%%%%%%
% Selection = [20,25,38,41,42,50];
if exist('Selection') == 1
    for ee=fliplr(Selection)
        bData10_BF(ee,:) = [];
        bData11_FR(ee,:) = [];
        bData12_GR(ee,:) = [];
        bData13_FFRsp(ee,:) = [];
        bData13_FFR(ee,:) = [];
        bData14_FGRsp(ee,:) = [];
        bData14_FGR(ee,:) = [];
        bData13_FFRIntensityMedian(ee,:) = [];
        bData14_FGRIntensityMedian(ee,:) = [];
        bData13_FFRIntensityMean(ee,:) = [];
        bData14_FGRIntensityMean(ee,:) = [];
        bData13_FFRIntensityTotal(ee,:) = [];
        bData14_FGRIntensityTotal(ee,:) = [];
        bData13_FFRIntensitySTD(ee,:) = [];
        bData14_FGRIntensitySTD(ee,:) = [];
        bData15_ROI(ee,:) = [];
        bData15_ROImn(ee,:) = [];
        bData16_ROImne(ee,:) = [];
        bData16_ROImne_R70(ee,:) = [];
        bData16_ROImne_R80(ee,:) = [];
        bData16_ROImne_R85(ee,:) = [];
        bData16_ROImne_R90(ee,:) = [];
    end
    bData21_all_SEC = [bData10_BF,...
    bData11_FR,bData12_GR,bData13_FFRsp,bData13_FFR,bData14_FGRsp,bData14_FGR,...
    bData13_FFRIntensityMedian,bData14_FGRIntensityMedian,bData13_FFRIntensityMean,bData14_FGRIntensityMean,...
    bData13_FFRIntensityTotal,bData14_FGRIntensityTotal,bData13_FFRIntensitySTD,bData14_FGRIntensitySTD,...
    bData15_ROI,bData15_ROImn,bData16_ROImne,...
    bData16_ROImne_R70,bData16_ROImne_R80,bData16_ROImne_R85,bData16_ROImne_R90];
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TrackingLEE5NCIraw2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selection in Nuclear pore -> all single molecule
%%%%%%%%%%%%%%%%%%%%
% ROI
vSe1ROI=bData16_ROImne;
vSe1ROI_R70=bData16_ROImne_R70;
vSe1ROI_R80=bData16_ROImne_R80;
vSe1ROI_R85=bData16_ROImne_R85;
vSe1ROI_R90=bData16_ROImne_R90;
% FR/GR => um to pixel (zPM)
vSe1FR=cellfun(@(x) x*zPM,bData13_FFRsp,'un',0);
vSe2GR=cellfun(@(x) x*zPM,bData14_FGRsp,'un',0);
vSe1FR_R70=vSe1FR;vSe2GR_R70=vSe2GR;
vSe1FR_R80=vSe1FR;vSe2GR_R80=vSe2GR;
vSe1FR_R85=vSe1FR;vSe2GR_R85=vSe2GR;
vSe1FR_R90=vSe1FR;vSe2GR_R90=vSe2GR;
% intensityMean / intensityMedian / intensitySTD / intensityTotal
vSe3_1FR__IntensityMean_1R100=cellfun(@(x) table2array(x),bData13_FFRIntensityMean,'un',0);
vSe3_1FR__IntensityMean_2R090=cellfun(@(x) table2array(x),bData13_FFRIntensityMean,'un',0);
vSe3_1FR__IntensityMean_3R085=cellfun(@(x) table2array(x),bData13_FFRIntensityMean,'un',0);
vSe3_1FR__IntensityMean_4R080=cellfun(@(x) table2array(x),bData13_FFRIntensityMean,'un',0);
vSe3_1FR__IntensityMean_5R070=cellfun(@(x) table2array(x),bData13_FFRIntensityMean,'un',0);
vSe3_1FR__IntensityMedian_1R100=cellfun(@(x) table2array(x),bData13_FFRIntensityMedian,'un',0);
vSe3_1FR__IntensityMedian_2R090=cellfun(@(x) table2array(x),bData13_FFRIntensityMedian,'un',0);
vSe3_1FR__IntensityMedian_3R085=cellfun(@(x) table2array(x),bData13_FFRIntensityMedian,'un',0);
vSe3_1FR__IntensityMedian_4R080=cellfun(@(x) table2array(x),bData13_FFRIntensityMedian,'un',0);
vSe3_1FR__IntensityMedian_5R070=cellfun(@(x) table2array(x),bData13_FFRIntensityMedian,'un',0);
vSe3_1FR__IntensitySTD_1R100=cellfun(@(x) table2array(x),bData13_FFRIntensitySTD,'un',0);
vSe3_1FR__IntensitySTD_2R090=cellfun(@(x) table2array(x),bData13_FFRIntensitySTD,'un',0);
vSe3_1FR__IntensitySTD_3R085=cellfun(@(x) table2array(x),bData13_FFRIntensitySTD,'un',0);
vSe3_1FR__IntensitySTD_4R080=cellfun(@(x) table2array(x),bData13_FFRIntensitySTD,'un',0);
vSe3_1FR__IntensitySTD_5R070=cellfun(@(x) table2array(x),bData13_FFRIntensitySTD,'un',0);
vSe3_1FR__IntensityTotal_1R100=cellfun(@(x) table2array(x),bData13_FFRIntensityTotal,'un',0);
vSe3_1FR__IntensityTotal_2R090=cellfun(@(x) table2array(x),bData13_FFRIntensityTotal,'un',0);
vSe3_1FR__IntensityTotal_3R085=cellfun(@(x) table2array(x),bData13_FFRIntensityTotal,'un',0);
vSe3_1FR__IntensityTotal_4R080=cellfun(@(x) table2array(x),bData13_FFRIntensityTotal,'un',0);
vSe3_1FR__IntensityTotal_5R070=cellfun(@(x) table2array(x),bData13_FFRIntensityTotal,'un',0);
%%%
vSe3_2GR__IntensityMean_1R100=cellfun(@(x) table2array(x),bData14_FGRIntensityMean,'un',0);
vSe3_2GR__IntensityMean_2R090=cellfun(@(x) table2array(x),bData14_FGRIntensityMean,'un',0);
vSe3_2GR__IntensityMean_3R085=cellfun(@(x) table2array(x),bData14_FGRIntensityMean,'un',0);
vSe3_2GR__IntensityMean_4R080=cellfun(@(x) table2array(x),bData14_FGRIntensityMean,'un',0);
vSe3_2GR__IntensityMean_5R070=cellfun(@(x) table2array(x),bData14_FGRIntensityMean,'un',0);
vSe3_2GR__IntensityMedian_1R100=cellfun(@(x) table2array(x),bData14_FGRIntensityMedian,'un',0);
vSe3_2GR__IntensityMedian_2R090=cellfun(@(x) table2array(x),bData14_FGRIntensityMedian,'un',0);
vSe3_2GR__IntensityMedian_3R085=cellfun(@(x) table2array(x),bData14_FGRIntensityMedian,'un',0);
vSe3_2GR__IntensityMedian_4R080=cellfun(@(x) table2array(x),bData14_FGRIntensityMedian,'un',0);
vSe3_2GR__IntensityMedian_5R070=cellfun(@(x) table2array(x),bData14_FGRIntensityMedian,'un',0);
vSe3_2GR__IntensitySTD_1R100=cellfun(@(x) table2array(x),bData14_FGRIntensitySTD,'un',0);
vSe3_2GR__IntensitySTD_2R090=cellfun(@(x) table2array(x),bData14_FGRIntensitySTD,'un',0);
vSe3_2GR__IntensitySTD_3R085=cellfun(@(x) table2array(x),bData14_FGRIntensitySTD,'un',0);
vSe3_2GR__IntensitySTD_4R080=cellfun(@(x) table2array(x),bData14_FGRIntensitySTD,'un',0);
vSe3_2GR__IntensitySTD_5R070=cellfun(@(x) table2array(x),bData14_FGRIntensitySTD,'un',0);
vSe3_2GR__IntensityTotal_1R100=cellfun(@(x) table2array(x),bData14_FGRIntensityTotal,'un',0);
vSe3_2GR__IntensityTotal_2R090=cellfun(@(x) table2array(x),bData14_FGRIntensityTotal,'un',0);
vSe3_2GR__IntensityTotal_3R085=cellfun(@(x) table2array(x),bData14_FGRIntensityTotal,'un',0);
vSe3_2GR__IntensityTotal_4R080=cellfun(@(x) table2array(x),bData14_FGRIntensityTotal,'un',0);
vSe3_2GR__IntensityTotal_5R070=cellfun(@(x) table2array(x),bData14_FGRIntensityTotal,'un',0);
%%%%%%%%%%%%%
% alphashape and inshape
for bb=1:numel(vSe1ROI)
    vSe2shp = alphaShape(vSe1ROI{bb,1}(:,1),vSe1ROI{bb,1}(:,2));
    % remove empty shape
    vSe2shp.Alpha = vSe2shp.Alpha*3;
    [vSe3tf_1FR vSe3ID_1FR] = inShape(vSe2shp,vSe1FR{bb,1}(:,1),vSe1FR{bb,1}(:,2));
    [vSe3tf_2GR vSe3ID_2GR] = inShape(vSe2shp,vSe2GR{bb,1}(:,1),vSe2GR{bb,1}(:,2));
    %%%%%%%%%%%%%
    nn2=1;
    for nn1 = 1:numel(vSe3tf_1FR)
        if vSe3tf_1FR(nn1,1) == 1
            vSe4_1pos_1FR{bb,1}(nn2,:) = vSe1FR{bb,1}(nn1,:);
            vSe4_1FR__IntensityMean_1R100{bb,1}(nn2,:) = vSe3_1FR__IntensityMean_1R100{bb,1}(nn1,:);
            vSe4_1FR__IntensityMedian_1R100{bb,1}(nn2,:) = vSe3_1FR__IntensityMedian_1R100{bb,1}(nn1,:);
            vSe4_1FR__IntensitySTD_1R100{bb,1}(nn2,:) = vSe3_1FR__IntensitySTD_1R100{bb,1}(nn1,:);
            vSe4_1FR__IntensityTotal_1R100{bb,1}(nn2,:) = vSe3_1FR__IntensityTotal_1R100{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_1FR{bb,1}(1:end,1)) == 0
        vSe4_1pos_1FR = []
        vSe4_1FR__IntensityMean_1R100 = [];
        vSe4_1FR__IntensityMedian_1R100 = [];
        vSe4_1FR__IntensitySTD_1R100 = [];
        vSe4_1FR__IntensityTotal_1R100 = [];    
    end  
    %%%%%%%%%
    nn2=1;
     for nn1 = 1:numel(vSe3tf_2GR)
        if vSe3tf_2GR(nn1,1) == 1
            vSe4_1pos_2GR{bb,1}(nn2,:) = vSe2GR{bb,1}(nn1,:);
            vSe4_2GR__IntensityMean_1R100{bb,1}(nn2,:) = vSe3_2GR__IntensityMean_1R100{bb,1}(nn1,:);
            vSe4_2GR__IntensityMedian_1R100{bb,1}(nn2,:) = vSe3_2GR__IntensityMedian_1R100{bb,1}(nn1,:);
            vSe4_2GR__IntensitySTD_1R100{bb,1}(nn2,:) = vSe3_2GR__IntensitySTD_1R100{bb,1}(nn1,:);
            vSe4_2GR__IntensityTotal_1R100{bb,1}(nn2,:) = vSe3_2GR__IntensityTotal_1R100{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_2GR{bb,1}(1:end,1)) == 0
        vSe4_1pos_2GR = [];
        vSe4_2GR__IntensityMean_1R100 = [];
        vSe4_2GR__IntensityMedian_1R100 = [];
        vSe4_2GR__IntensitySTD_1R100 = [];
        vSe4_2GR__IntensityTotal_1R100 = [];  
    end  
end

%%%%%%%%%%%%%
% alphashape and inshape 90%
for bb=1:numel(vSe1ROI_R90)
    vSe2shp_R90 = alphaShape(vSe1ROI_R90{bb,1}(:,1),vSe1ROI_R90{bb,1}(:,2));
    % remove empty shape
    vSe2shp_R90.Alpha = vSe2shp_R90.Alpha*3;
    [vSe3tf_1FR_R90 vSe3ID_1FR_R90] = inShape(vSe2shp_R90,vSe1FR_R90{bb,1}(:,1),vSe1FR_R90{bb,1}(:,2));
    [vSe3tf_2GR_R90 vSe3ID_2GR_R90] = inShape(vSe2shp_R90,vSe2GR_R90{bb,1}(:,1),vSe2GR_R90{bb,1}(:,2));
    %%%%%%%%%%%%%
    nn2=1;
    for nn1 = 1:numel(vSe3tf_1FR_R90)
        if vSe3tf_1FR_R90(nn1,1) == 1
            vSe4_1pos_1FR_R90{bb,1}(nn2,:) = vSe1FR_R90{bb,1}(nn1,:);
            vSe4_1FR__IntensityMean_2R090{bb,1}(nn2,:) = vSe3_1FR__IntensityMean_2R090{bb,1}(nn1,:);
            vSe4_1FR__IntensityMedian_2R090{bb,1}(nn2,:) = vSe3_1FR__IntensityMedian_2R090{bb,1}(nn1,:);
            vSe4_1FR__IntensitySTD_2R090{bb,1}(nn2,:) = vSe3_1FR__IntensitySTD_2R090{bb,1}(nn1,:);
            vSe4_1FR__IntensityTotal_2R090{bb,1}(nn2,:) = vSe3_1FR__IntensityTotal_2R090{bb,1}(nn1,:);
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_1FR_R90{bb,1}(1:end,1)) == 0
        vSe4_1pos_1FR_R90 = [];
        vSe4_1FR__IntensityMean_2R090 = [];
        vSe4_1FR__IntensityMedian_2R090 = [];
        vSe4_1FR__IntensitySTD_2R090 = [];
        vSe4_1FR__IntensityTotal_2R090 = [];    
    end  
    %%%%%%%%%
    nn2=1;
     for nn1 = 1:numel(vSe3tf_2GR_R90)
        if vSe3tf_2GR_R90(nn1,1) == 1
            vSe4_1pos_2GR_R90{bb,1}(nn2,:) = vSe2GR_R90{bb,1}(nn1,:);
            vSe4_2GR__IntensityMean_2R090{bb,1}(nn2,:) = vSe3_2GR__IntensityMean_2R090{bb,1}(nn1,:);
            vSe4_2GR__IntensityMedian_2R090{bb,1}(nn2,:) = vSe3_2GR__IntensityMedian_2R090{bb,1}(nn1,:);
            vSe4_2GR__IntensitySTD_2R090{bb,1}(nn2,:) = vSe3_2GR__IntensitySTD_2R090{bb,1}(nn1,:);
            vSe4_2GR__IntensityTotal_2R090{bb,1}(nn2,:) = vSe3_2GR__IntensityTotal_2R090{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_2GR_R90{bb,1}(1:end,1)) == 0
        vSe4_1pos_2GR_R90 = [];
        vSe4_2GR__IntensityMean_2R090 = [];
        vSe4_2GR__IntensityMedian_2R090 = [];
        vSe4_2GR__IntensitySTD_2R090 = [];
        vSe4_2GR__IntensityTotal_2R090 = [];  
    end  
end

%%%%%%%%%%%%%
% alphashape and inshape 85%
for bb=1:numel(vSe1ROI_R85)
    vSe2shp_R85 = alphaShape(vSe1ROI_R85{bb,1}(:,1),vSe1ROI_R85{bb,1}(:,2));
    % remove empty shape
    vSe2shp_R85.Alpha = vSe2shp_R85.Alpha*3;
    [vSe3tf_1FR_R85 vSe3ID_1FR_R85] = inShape(vSe2shp_R85,vSe1FR_R85{bb,1}(:,1),vSe1FR_R85{bb,1}(:,2));
    [vSe3tf_2GR_R85 vSe3ID_2GR_R85] = inShape(vSe2shp_R85,vSe2GR_R85{bb,1}(:,1),vSe2GR_R85{bb,1}(:,2));
    %%%%%%%%%%%%%
    nn2=1;
    for nn1 = 1:numel(vSe3tf_1FR_R85)
        if vSe3tf_1FR_R85(nn1,1) == 1
            vSe4_1pos_1FR_R85{bb,1}(nn2,:) = vSe1FR_R85{bb,1}(nn1,:);
            vSe4_1FR__IntensityMean_3R085{bb,1}(nn2,:) = vSe3_1FR__IntensityMean_3R085{bb,1}(nn1,:);
            vSe4_1FR__IntensityMedian_3R085{bb,1}(nn2,:) = vSe3_1FR__IntensityMedian_3R085{bb,1}(nn1,:);
            vSe4_1FR__IntensitySTD_3R085{bb,1}(nn2,:) = vSe3_1FR__IntensitySTD_3R085{bb,1}(nn1,:);
            vSe4_1FR__IntensityTotal_3R085{bb,1}(nn2,:) = vSe3_1FR__IntensityTotal_3R085{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_1FR_R85{bb,1}(1:end,1)) == 0
        vSe4_1FR__IntensityMean_3R085 = [];
        vSe4_1FR__IntensityMedian_3R085 = [];
        vSe4_1FR__IntensitySTD_3R085 = [];
        vSe4_1FR__IntensityTotal_3R085 = [];   
        vSe4_1pos_1FR_R85 = [];
    end  
    %%%%%%%%%
    nn2=1;
     for nn1 = 1:numel(vSe3tf_2GR_R85)
        if vSe3tf_2GR_R85(nn1,1) == 1
            vSe4_1pos_2GR_R85{bb,1}(nn2,:) = vSe2GR_R85{bb,1}(nn1,:);
            vSe4_2GR__IntensityMean_3R085{bb,1}(nn2,:) = vSe3_2GR__IntensityMean_3R085{bb,1}(nn1,:);
            vSe4_2GR__IntensityMedian_3R085{bb,1}(nn2,:) = vSe3_2GR__IntensityMedian_3R085{bb,1}(nn1,:);
            vSe4_2GR__IntensitySTD_3R085{bb,1}(nn2,:) = vSe3_2GR__IntensitySTD_3R085{bb,1}(nn1,:);
            vSe4_2GR__IntensityTotal_3R085{bb,1}(nn2,:) = vSe3_2GR__IntensityTotal_3R085{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_2GR_R85{bb,1}(1:end,1)) == 0
        vSe4_1pos_2GR_R85 = [];
        vSe4_2GR__IntensityMean_3R085 = [];
        vSe4_2GR__IntensityMedian_3R085 = [];
        vSe4_2GR__IntensitySTD_3R085 = [];
        vSe4_2GR__IntensityTotal_3R085 = [];  
    end  
end

%%%%%%%%%%%%%
% alphashape and inshape 80%
for bb=1:numel(vSe1ROI_R80)
    vSe2shp_R80 = alphaShape(vSe1ROI_R80{bb,1}(:,1),vSe1ROI_R80{bb,1}(:,2));
    % remove empty shape
    vSe2shp_R80.Alpha = vSe2shp_R80.Alpha*3;
    [vSe3tf_1FR_R80 vSe3ID_1FR_R80] = inShape(vSe2shp_R80,vSe1FR_R80{bb,1}(:,1),vSe1FR_R80{bb,1}(:,2));
    [vSe3tf_2GR_R80 vSe3ID_2GR_R80] = inShape(vSe2shp_R80,vSe2GR_R80{bb,1}(:,1),vSe2GR_R80{bb,1}(:,2));
    %%%%%%%%%%%%%
    nn2=1;
    for nn1 = 1:numel(vSe3tf_1FR_R80)
        if vSe3tf_1FR_R80(nn1,1) == 1
            vSe4_1pos_1FR_R80{bb,1}(nn2,:) = vSe1FR_R80{bb,1}(nn1,:);
            vSe4_1FR__IntensityMean_4R080{bb,1}(nn2,:) = vSe3_1FR__IntensityMean_4R080{bb,1}(nn1,:);
            vSe4_1FR__IntensityMedian_4R080{bb,1}(nn2,:) = vSe3_1FR__IntensityMedian_4R080{bb,1}(nn1,:);
            vSe4_1FR__IntensitySTD_4R080{bb,1}(nn2,:) = vSe3_1FR__IntensitySTD_4R080{bb,1}(nn1,:);
            vSe4_1FR__IntensityTotal_4R080{bb,1}(nn2,:) = vSe3_1FR__IntensityTotal_4R080{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_1FR_R80{bb,1}(1:end,1)) == 0
        vSe4_1pos_1FR_R80 = [];
        vSe4_1FR__IntensityMean_4R080 = [];
        vSe4_1FR__IntensityMedian_4R080 = [];
        vSe4_1FR__IntensitySTD_4R080 = [];
        vSe4_1FR__IntensityTotal_4R080 = [];    
    end  
    %%%%%%%%%
    nn2=1;
     for nn1 = 1:numel(vSe3tf_2GR_R80)
        if vSe3tf_2GR_R80(nn1,1) == 1
            vSe4_1pos_2GR_R80{bb,1}(nn2,:) = vSe2GR_R80{bb,1}(nn1,:);
            vSe4_2GR__IntensityMean_4R080{bb,1}(nn2,:) = vSe3_2GR__IntensityMean_4R080{bb,1}(nn1,:);
            vSe4_2GR__IntensityMedian_4R080{bb,1}(nn2,:) = vSe3_2GR__IntensityMedian_4R080{bb,1}(nn1,:);
            vSe4_2GR__IntensitySTD_4R080{bb,1}(nn2,:) = vSe3_2GR__IntensitySTD_4R080{bb,1}(nn1,:);
            vSe4_2GR__IntensityTotal_4R080{bb,1}(nn2,:) = vSe3_2GR__IntensityTotal_4R080{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_2GR_R80{bb,1}(1:end,1)) == 0
        vSe4_1pos_2GR_R80 = [];
        vSe4_2GR__IntensityMean_4R080 = [];
        vSe4_2GR__IntensityMedian_4R080 = [];
        vSe4_2GR__IntensitySTD_4R080 = [];
        vSe4_2GR__IntensityTotal_4R080 = []; 
    end  
end

%%%%%%%%%%%%%
% alphashape and inshape 70%
for bb=1:numel(vSe1ROI_R70)
    vSe2shp_R70 = alphaShape(vSe1ROI_R70{bb,1}(:,1),vSe1ROI_R70{bb,1}(:,2));
    % remove empty shape
    vSe2shp_R70.Alpha = vSe2shp_R70.Alpha*3;
    [vSe3tf_1FR_R70 vSe3ID_1FR_R70] = inShape(vSe2shp_R70,vSe1FR_R70{bb,1}(:,1),vSe1FR_R70{bb,1}(:,2));
    [vSe3tf_2GR_R70 vSe3ID_2GR_R70] = inShape(vSe2shp_R70,vSe2GR_R70{bb,1}(:,1),vSe2GR_R70{bb,1}(:,2));
    %%%%%%%%%%%%%
    nn2=1;
    for nn1 = 1:numel(vSe3tf_1FR_R70)
        if vSe3tf_1FR_R70(nn1,1) == 1
            vSe4_1pos_1FR_R70{bb,1}(nn2,:) = vSe1FR_R70{bb,1}(nn1,:);
            vSe4_1FR__IntensityMean_5R070{bb,1}(nn2,:) = vSe3_1FR__IntensityMean_5R070{bb,1}(nn1,:);
            vSe4_1FR__IntensityMedian_5R070{bb,1}(nn2,:) = vSe3_1FR__IntensityMedian_5R070{bb,1}(nn1,:);
            vSe4_1FR__IntensitySTD_5R070{bb,1}(nn2,:) = vSe3_1FR__IntensitySTD_5R070{bb,1}(nn1,:);
            vSe4_1FR__IntensityTotal_5R070{bb,1}(nn2,:) = vSe3_1FR__IntensityTotal_5R070{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_1FR_R70{bb,1}(1:end,1)) == 0
        vSe4_1pos_1FR_R70 = [];
        vSe4_1FR__IntensityMean_5R070 = [];
        vSe4_1FR__IntensityMedian_5R070 = [];
        vSe4_1FR__IntensitySTD_5R070 = [];
        vSe4_1FR__IntensityTotal_5R070 = [];    
    end  
    %%%%%%%%%
    nn2=1;
     for nn1 = 1:numel(vSe3tf_2GR_R70)
        if vSe3tf_2GR_R70(nn1,1) == 1
            vSe4_1pos_2GR_R70{bb,1}(nn2,:) = vSe2GR_R70{bb,1}(nn1,:);
            vSe4_2GR__IntensityMean_5R070{bb,1}(nn2,:) = vSe3_2GR__IntensityMean_5R070{bb,1}(nn1,:);
            vSe4_2GR__IntensityMedian_5R070{bb,1}(nn2,:) = vSe3_2GR__IntensityMedian_5R070{bb,1}(nn1,:);
            vSe4_2GR__IntensitySTD_5R070{bb,1}(nn2,:) = vSe3_2GR__IntensitySTD_5R070{bb,1}(nn1,:);
            vSe4_2GR__IntensityTotal_5R070{bb,1}(nn2,:) = vSe3_2GR__IntensityTotal_5R070{bb,1}(nn1,:); 
            nn2 = nn2+1;
        end
    end
    if sum(vSe4_1pos_2GR_R70{bb,1}(1:end,1)) == 0
        vSe4_1pos_2GR_R70 = [];
        vSe4_2GR__IntensityMean_5R070 = [];
        vSe4_2GR__IntensityMedian_5R070 = [];
        vSe4_2GR__IntensitySTD_5R070 = [];
        vSe4_2GR__IntensityTotal_5R070 = []; 
    end  
end

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% raw image
%%%%%%%%%%%%%%%%%
cSpotN1 = '11-Spot-100p';
vSe1ROI_D = vSe1ROI;
vSe4_1pos_2GR_D = vSe4_1pos_2GR;
vSe4_1pos_1FR_D = vSe4_1pos_1FR;
vSe2GR_D = vSe2GR;
vSe1FR_D = vSe1FR;
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%    
mkdir([pwd '\' cSpotN1]);
    legend off
    imshow(bData10_BF{bb,1},'InitialMagnification', 'fit');
    hold on;
    % image size
    set(gcf,'units','centimeters','position',[1 2 24 24],'paperposition',[1 2 24 24]);
    set(gca,'units','centimeters','position',[0 0 24 24]);
    %%%%%%%%%
    line(vSe1ROI_D{bb,1}(:,1),vSe1ROI_D{bb,1}(:,2),'LineWidth',1,'color','yellow','LineStyle','--');
    hold on;
    %%%%%%%%
    % only nulcear for FR/GR
    scatter(vSe4_1pos_2GR_D{bb,1}(:,1),vSe4_1pos_2GR_D{bb,1}(:,2),8,'green','filled');
    scatter(vSe4_1pos_1FR_D{bb,1}(:,1),vSe4_1pos_1FR_D{bb,1}(:,2),10,'magenta');
    % number to str
    bbs = num2str(bb,'%04.f');
    % save image
    F32name = [pwd '\' cSpotN1 '\11_all_detection__' bbs '_1NC'];
    set(gcf, 'paperpositionmode', 'auto');
    export_fig(F32name,'-tiff','-m5');
    %%%%%%%%%%%%%%%%%%%%%%
    % all
    scatter(vSe2GR_D{bb,1}(:,1),vSe2GR_D{bb,1}(:,2),8,'green','filled');
    scatter(vSe1FR_D{bb,1}(:,1),vSe1FR_D{bb,1}(:,2),10,'magenta');
    % save image
    F32name = [pwd '\' cSpotN1 '\11_all_detection__' bbs '_2Allarea'];
    set(gcf, 'paperpositionmode', 'auto');
    export_fig(F32name,'-tiff','-m5');
    close gcf
% end
clear vSe1ROI_D vSe4_1pos_2GR_D vSe4_1pos_1FR_D vSe2GR_D vSe1FR_D
%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table
%%%%%%%%%
% area from ROI (pixel to um)
%%%%%%%%%%%%%
% pixel to um
vSe5ROI_1R100_um=cellfun(@(x) x/zPM,vSe1ROI,'un',0);
vSe5ROI_2R090_um=cellfun(@(x) x/zPM,vSe1ROI_R90,'un',0);
vSe5ROI_3R085_um=cellfun(@(x) x/zPM,vSe1ROI_R85,'un',0);
vSe5ROI_4R080_um=cellfun(@(x) x/zPM,vSe1ROI_R80,'un',0);
vSe5ROI_5R070_um=cellfun(@(x) x/zPM,vSe1ROI_R70,'un',0);
%%%
vSe5pos_1FR_1R100_um=cellfun(@(x) x/zPM,vSe4_1pos_1FR,'un',0);
vSe5pos_1FR_2R090_um=cellfun(@(x) x/zPM,vSe4_1pos_1FR_R90,'un',0);
vSe5pos_1FR_3R085_um=cellfun(@(x) x/zPM,vSe4_1pos_1FR_R85,'un',0);
vSe5pos_1FR_4R080_um=cellfun(@(x) x/zPM,vSe4_1pos_1FR_R80,'un',0);
vSe5pos_1FR_5R070_um=cellfun(@(x) x/zPM,vSe4_1pos_1FR_R70,'un',0);
%%%
vSe5pos_2GR_1R100_um=cellfun(@(x) x/zPM,vSe4_1pos_2GR,'un',0);
vSe5pos_2GR_2R090_um=cellfun(@(x) x/zPM,vSe4_1pos_2GR_R90,'un',0);
vSe5pos_2GR_3R085_um=cellfun(@(x) x/zPM,vSe4_1pos_2GR_R85,'un',0);
vSe5pos_2GR_4R080_um=cellfun(@(x) x/zPM,vSe4_1pos_2GR_R80,'un',0);
vSe5pos_2GR_5R070_um=cellfun(@(x) x/zPM,vSe4_1pos_2GR_R70,'un',0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 100% ROI
%%%%%%%%%%%%%%
% 1:area - um^2 // 2:spot number FR // 3:spot number GR
% 4: FR/area // 5: GR/area // 6:FR/GR // 7:GR/FR
% FR 8-15 // GR 16-23
% 8:intensityMean // 9:intensityMedium // 10:intensitySTD // 11:intensitySE
% 12:intensityTotalMean  //  13:intensityTotalMedian
% 14:intensityTotalSTD // 15:intensityTotalSE
for vv1=1:numel(vSe5ROI_1R100_um)
    vSe6ROI_1R100_um_01area(vv1,1) = polyarea(vSe5ROI_1R100_um{vv1,1}(:,1),vSe5ROI_1R100_um{vv1,1}(:,2));
    vSe6ROI_1R100_um_02spFR(vv1,1) = numel(vSe5pos_1FR_1R100_um{vv1,1}(:,1));
    vSe6ROI_1R100_um_03spGR(vv1,1) = numel(vSe5pos_2GR_1R100_um{vv1,1}(:,1));  
    vSe6ROI_1R100_um_04FR_area(vv1,1) = numel(vSe5pos_1FR_1R100_um{vv1,1}(:,1))/polyarea(vSe5ROI_1R100_um{vv1,1}(:,1),vSe5ROI_1R100_um{vv1,1}(:,2));
    vSe6ROI_1R100_um_05GR_area(vv1,1) = numel(vSe5pos_2GR_1R100_um{vv1,1}(:,1))/polyarea(vSe5ROI_1R100_um{vv1,1}(:,1),vSe5ROI_1R100_um{vv1,1}(:,2));
    vSe6ROI_1R100_um_06FR_GR(vv1,1) = numel(vSe5pos_1FR_1R100_um{vv1,1}(:,1))/numel(vSe5pos_2GR_1R100_um{vv1,1}(:,1)); 
    vSe6ROI_1R100_um_07GR_FR(vv1,1) = numel(vSe5pos_2GR_1R100_um{vv1,1}(:,1))/numel(vSe5pos_1FR_1R100_um{vv1,1}(:,1));
    
end
vSe6ROI_1R100_um_08_1FR_intensityMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_09_1FR_intensityMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityMedian_1R100,'un',0);
vSe6ROI_1R100_um_10_1FR_intensitySTD = cellfun(@(x) std(x),vSe4_1FR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_11_1FR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_12_1FR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_13_1FR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_14_1FR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_1FR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_15_1FR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityTotal_1R100,'un',0);
%%%
vSe6ROI_1R100_um_16_2GR_intensityMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_17_2GR_intensityMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityMedian_1R100,'un',0);
vSe6ROI_1R100_um_18_2GR_intensitySTD = cellfun(@(x) std(x),vSe4_2GR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_19_2GR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityMean_1R100,'un',0);
vSe6ROI_1R100_um_20_2GR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_21_2GR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_22_2GR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_2GR__IntensityTotal_1R100,'un',0);
vSe6ROI_1R100_um_23_2GR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityTotal_1R100,'un',0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinlge value (calculate by all data not by single cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 31: all FR // 32: all GR // 33: all area
% 34: FR/GR // 35: GR/FR // 36: FR/area // 37:  GR//area 
% FR 41-48 // GR 51-48
% 41: all intensityMean // 42: all intensicyMedian
% 43: all intensitySTD // 44: all intensitySE
% 45: all intensityTotalMean // 46: all intensityTotalMedian
% 47: all intensityTotalSTD // 48: all intensityTotalSE
%%%%%%%%%%%%%%%
vSe6ROI_1R100_um_31A_FR = length(cell2mat(vSe5pos_1FR_1R100_um));
vSe6ROI_1R100_um_32A_GR = length(cell2mat(vSe5pos_2GR_1R100_um));
vSe6ROI_1R100_um_33A_area = sum(vSe6ROI_1R100_um_01area);
vSe6ROI_1R100_um_34AFR_GR = vSe6ROI_1R100_um_31A_FR/vSe6ROI_1R100_um_32A_GR;
vSe6ROI_1R100_um_35AGR_FR = vSe6ROI_1R100_um_32A_GR/vSe6ROI_1R100_um_31A_FR;
vSe6ROI_1R100_um_36AspFR_area = vSe6ROI_1R100_um_31A_FR/vSe6ROI_1R100_um_33A_area;
vSe6ROI_1R100_um_37AspGR_area = vSe6ROI_1R100_um_32A_GR/vSe6ROI_1R100_um_33A_area;
%%%
vSe6ROI_1R100_um_41A_1FR_intensityMean = mean(cell2mat(vSe4_1FR__IntensityMean_1R100));
vSe6ROI_1R100_um_42A_1FR_intensityMedian = median(cell2mat(vSe4_1FR__IntensityMedian_1R100));
vSe6ROI_1R100_um_43A_1FR_intensitySTD = std(cell2mat(vSe4_1FR__IntensityMean_1R100));
vSe6ROI_1R100_um_44A_1FR_intensitySE = std(cell2mat(vSe4_1FR__IntensityMean_1R100))/sqrt(length(cell2mat(vSe4_1FR__IntensityMean_1R100)));
%%%
vSe6ROI_1R100_um_45A_1FR_intensityTotalMean = mean(cell2mat(vSe4_1FR__IntensityTotal_1R100));
vSe6ROI_1R100_um_46A_1FR_intensityTotalMedian = median(cell2mat(vSe4_1FR__IntensityTotal_1R100));
vSe6ROI_1R100_um_47A_1FR_intensityTotalSTD = std(cell2mat(vSe4_1FR__IntensityMedian_1R100));
vSe6ROI_1R100_um_48A_1FR_intensityTotalSE = std(cell2mat(vSe4_1FR__IntensityMedian_1R100))/sqrt(length(cell2mat(vSe4_1FR__IntensityMedian_1R100)));
%%%%%%%%%%%
vSe6ROI_1R100_um_51A_2GR_intensityMean = mean(cell2mat(vSe4_2GR__IntensityMean_1R100));
vSe6ROI_1R100_um_52A_2GR_intensityMedian = median(cell2mat(vSe4_2GR__IntensityMedian_1R100));
vSe6ROI_1R100_um_53A_2GR_intensitySTD = std(cell2mat(vSe4_2GR__IntensityMean_1R100));
vSe6ROI_1R100_um_54A_2GR_intensitySE = std(cell2mat(vSe4_2GR__IntensityMean_1R100))/sqrt(length(cell2mat(vSe4_2GR__IntensityMean_1R100)));
%%%
vSe6ROI_1R100_um_55A_2GR_intensityTotalMean = mean(cell2mat(vSe4_2GR__IntensityTotal_1R100));
vSe6ROI_1R100_um_56A_2GR_intensityTotalMedian = median(cell2mat(vSe4_2GR__IntensityTotal_1R100));
vSe6ROI_1R100_um_57A_2GR_intensityTotalSTD = std(cell2mat(vSe4_2GR__IntensityMedian_1R100));
vSe6ROI_1R100_um_58A_2GR_intensityTotalSE = std(cell2mat(vSe4_2GR__IntensityMedian_1R100))/sqrt(length(cell2mat(vSe4_2GR__IntensityMedian_1R100)));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 90% ROI
%%%%%%%%%%%%%%
% 1:area - um^2 // 2:spot number FR // 3:spot number GR
% 4: FR/area // 5: GR/area // 6:FR/GR // 7:GR/FR
% FR 8-15 // GR 16-23
% 8:intensityMean // 9:intensityMedium // 10:intensitySTD // 11:intensitySE
% 12:intensityTotalMean  //  13:intensityTotalMedian
% 14:intensityTotalSTD // 15:intensityTotalSE
for vv1=1:numel(vSe5ROI_2R090_um)
    vSe6ROI_2R090_um_01area(vv1,1) = polyarea(vSe5ROI_2R090_um{vv1,1}(:,1),vSe5ROI_2R090_um{vv1,1}(:,2));
    vSe6ROI_2R090_um_02spFR(vv1,1) = numel(vSe5pos_1FR_2R090_um{vv1,1}(:,1));
    vSe6ROI_2R090_um_03spGR(vv1,1) = numel(vSe5pos_2GR_2R090_um{vv1,1}(:,1));  
    vSe6ROI_2R090_um_04FR_area(vv1,1) = numel(vSe5pos_1FR_2R090_um{vv1,1}(:,1))/polyarea(vSe5ROI_2R090_um{vv1,1}(:,1),vSe5ROI_2R090_um{vv1,1}(:,2));
    vSe6ROI_2R090_um_05GR_area(vv1,1) = numel(vSe5pos_2GR_2R090_um{vv1,1}(:,1))/polyarea(vSe5ROI_2R090_um{vv1,1}(:,1),vSe5ROI_2R090_um{vv1,1}(:,2));
    vSe6ROI_2R090_um_06FR_GR(vv1,1) = numel(vSe5pos_1FR_2R090_um{vv1,1}(:,1))/numel(vSe5pos_2GR_2R090_um{vv1,1}(:,1)); 
    vSe6ROI_2R090_um_07GR_FR(vv1,1) = numel(vSe5pos_2GR_2R090_um{vv1,1}(:,1))/numel(vSe5pos_1FR_2R090_um{vv1,1}(:,1));
    
end
vSe6ROI_2R090_um_08_1FR_intensityMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_09_1FR_intensityMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityMedian_2R090,'un',0);
vSe6ROI_2R090_um_10_1FR_intensitySTD = cellfun(@(x) std(x),vSe4_1FR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_11_1FR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_12_1FR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_13_1FR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_14_1FR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_1FR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_15_1FR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityTotal_2R090,'un',0);
%%%
vSe6ROI_2R090_um_16_2GR_intensityMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_17_2GR_intensityMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityMedian_2R090,'un',0);
vSe6ROI_2R090_um_18_2GR_intensitySTD = cellfun(@(x) std(x),vSe4_2GR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_19_2GR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityMean_2R090,'un',0);
vSe6ROI_2R090_um_20_2GR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_21_2GR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_22_2GR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_2GR__IntensityTotal_2R090,'un',0);
vSe6ROI_2R090_um_23_2GR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityTotal_2R090,'un',0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinlge value (calculate by all data not by single cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 31: all FR // 32: all GR // 33: all area
% 34: FR/GR // 35: GR/FR // 36: FR/area // 37:  GR//area 
% FR 41-48 // GR 51-48
% 41: all intensityMean // 42: all intensicyMedian
% 43: all intensitySTD // 44: all intensitySE
% 45: all intensityTotalMean // 46: all intensityTotalMedian
% 47: all intensityTotalSTD // 48: all intensityTotalSE
%%%%%%%%%%%%%%%
vSe6ROI_2R090_um_31A_FR = length(cell2mat(vSe5pos_1FR_2R090_um));
vSe6ROI_2R090_um_32A_GR = length(cell2mat(vSe5pos_2GR_2R090_um));
vSe6ROI_2R090_um_33A_area = sum(vSe6ROI_2R090_um_01area);
vSe6ROI_2R090_um_34AFR_GR = vSe6ROI_2R090_um_31A_FR/vSe6ROI_2R090_um_32A_GR;
vSe6ROI_2R090_um_35AGR_FR = vSe6ROI_2R090_um_32A_GR/vSe6ROI_2R090_um_31A_FR;
vSe6ROI_2R090_um_36AspFR_area = vSe6ROI_2R090_um_31A_FR/vSe6ROI_2R090_um_33A_area;
vSe6ROI_2R090_um_37AspGR_area = vSe6ROI_2R090_um_32A_GR/vSe6ROI_2R090_um_33A_area;
%%%
vSe6ROI_2R090_um_41A_1FR_intensityMean = mean(cell2mat(vSe4_1FR__IntensityMean_2R090));
vSe6ROI_2R090_um_42A_1FR_intensityMedian = median(cell2mat(vSe4_1FR__IntensityMedian_2R090));
vSe6ROI_2R090_um_43A_1FR_intensitySTD = std(cell2mat(vSe4_1FR__IntensityMean_2R090));
vSe6ROI_2R090_um_44A_1FR_intensitySE = std(cell2mat(vSe4_1FR__IntensityMean_2R090))/sqrt(length(cell2mat(vSe4_1FR__IntensityMean_2R090)));
%%%
vSe6ROI_2R090_um_45A_1FR_intensityTotalMean = mean(cell2mat(vSe4_1FR__IntensityTotal_2R090));
vSe6ROI_2R090_um_46A_1FR_intensityTotalMedian = median(cell2mat(vSe4_1FR__IntensityTotal_2R090));
vSe6ROI_2R090_um_47A_1FR_intensityTotalSTD = std(cell2mat(vSe4_1FR__IntensityMedian_2R090));
vSe6ROI_2R090_um_48A_1FR_intensityTotalSE = std(cell2mat(vSe4_1FR__IntensityMedian_2R090))/sqrt(length(cell2mat(vSe4_1FR__IntensityMedian_2R090)));
%%%%%%%%%%%
vSe6ROI_2R090_um_51A_2GR_intensityMean = mean(cell2mat(vSe4_2GR__IntensityMean_2R090));
vSe6ROI_2R090_um_52A_2GR_intensityMedian = median(cell2mat(vSe4_2GR__IntensityMedian_2R090));
vSe6ROI_2R090_um_53A_2GR_intensitySTD = std(cell2mat(vSe4_2GR__IntensityMean_2R090));
vSe6ROI_2R090_um_54A_2GR_intensitySE = std(cell2mat(vSe4_2GR__IntensityMean_2R090))/sqrt(length(cell2mat(vSe4_2GR__IntensityMean_2R090)));
%%%
vSe6ROI_2R090_um_55A_2GR_intensityTotalMean = mean(cell2mat(vSe4_2GR__IntensityTotal_2R090));
vSe6ROI_2R090_um_56A_2GR_intensityTotalMedian = median(cell2mat(vSe4_2GR__IntensityTotal_2R090));
vSe6ROI_2R090_um_57A_2GR_intensityTotalSTD = std(cell2mat(vSe4_2GR__IntensityMedian_2R090));
vSe6ROI_2R090_um_58A_2GR_intensityTotalSE = std(cell2mat(vSe4_2GR__IntensityMedian_2R090))/sqrt(length(cell2mat(vSe4_2GR__IntensityMedian_2R090)));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 85% ROI
%%%%%%%%%%%%%%
% 1:area - um^2 // 2:spot number FR // 3:spot number GR
% 4: FR/area // 5: GR/area // 6:FR/GR // 7:GR/FR
% FR 8-15 // GR 16-23
% 8:intensityMean // 9:intensityMedium // 10:intensitySTD // 11:intensitySE
% 12:intensityTotalMean  //  13:intensityTotalMedian
% 14:intensityTotalSTD // 15:intensityTotalSE
for vv1=1:numel(vSe5ROI_3R085_um)
    vSe6ROI_3R085_um_01area(vv1,1) = polyarea(vSe5ROI_3R085_um{vv1,1}(:,1),vSe5ROI_3R085_um{vv1,1}(:,2));
    vSe6ROI_3R085_um_02spFR(vv1,1) = numel(vSe5pos_1FR_3R085_um{vv1,1}(:,1));
    vSe6ROI_3R085_um_03spGR(vv1,1) = numel(vSe5pos_2GR_3R085_um{vv1,1}(:,1));  
    vSe6ROI_3R085_um_04FR_area(vv1,1) = numel(vSe5pos_1FR_3R085_um{vv1,1}(:,1))/polyarea(vSe5ROI_3R085_um{vv1,1}(:,1),vSe5ROI_3R085_um{vv1,1}(:,2));
    vSe6ROI_3R085_um_05GR_area(vv1,1) = numel(vSe5pos_2GR_3R085_um{vv1,1}(:,1))/polyarea(vSe5ROI_3R085_um{vv1,1}(:,1),vSe5ROI_3R085_um{vv1,1}(:,2));
    vSe6ROI_3R085_um_06FR_GR(vv1,1) = numel(vSe5pos_1FR_3R085_um{vv1,1}(:,1))/numel(vSe5pos_2GR_3R085_um{vv1,1}(:,1)); 
    vSe6ROI_3R085_um_07GR_FR(vv1,1) = numel(vSe5pos_2GR_3R085_um{vv1,1}(:,1))/numel(vSe5pos_1FR_3R085_um{vv1,1}(:,1));
    
end
vSe6ROI_3R085_um_08_1FR_intensityMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_09_1FR_intensityMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityMedian_3R085,'un',0);
vSe6ROI_3R085_um_10_1FR_intensitySTD = cellfun(@(x) std(x),vSe4_1FR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_11_1FR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_12_1FR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_13_1FR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_14_1FR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_1FR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_15_1FR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityTotal_3R085,'un',0);
%%%
vSe6ROI_3R085_um_16_2GR_intensityMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_17_2GR_intensityMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityMedian_3R085,'un',0);
vSe6ROI_3R085_um_18_2GR_intensitySTD = cellfun(@(x) std(x),vSe4_2GR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_19_2GR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityMean_3R085,'un',0);
vSe6ROI_3R085_um_20_2GR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_21_2GR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_22_2GR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_2GR__IntensityTotal_3R085,'un',0);
vSe6ROI_3R085_um_23_2GR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityTotal_3R085,'un',0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinlge value (calculate by all data not by single cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 31: all FR // 32: all GR // 33: all area
% 34: FR/GR // 35: GR/FR // 36: FR/area // 37:  GR//area 
% FR 41-48 // GR 51-48
% 41: all intensityMean // 42: all intensicyMedian
% 43: all intensitySTD // 44: all intensitySE
% 45: all intensityTotalMean // 46: all intensityTotalMedian
% 47: all intensityTotalSTD // 48: all intensityTotalSE
%%%%%%%%%%%%%%%
vSe6ROI_3R085_um_31A_FR = length(cell2mat(vSe5pos_1FR_3R085_um));
vSe6ROI_3R085_um_32A_GR = length(cell2mat(vSe5pos_2GR_3R085_um));
vSe6ROI_3R085_um_33A_area = sum(vSe6ROI_3R085_um_01area);
vSe6ROI_3R085_um_34AFR_GR = vSe6ROI_3R085_um_31A_FR/vSe6ROI_3R085_um_32A_GR;
vSe6ROI_3R085_um_35AGR_FR = vSe6ROI_3R085_um_32A_GR/vSe6ROI_3R085_um_31A_FR;
vSe6ROI_3R085_um_36AspFR_area = vSe6ROI_3R085_um_31A_FR/vSe6ROI_3R085_um_33A_area;
vSe6ROI_3R085_um_37AspGR_area = vSe6ROI_3R085_um_32A_GR/vSe6ROI_3R085_um_33A_area;
%%%
vSe6ROI_3R085_um_41A_1FR_intensityMean = mean(cell2mat(vSe4_1FR__IntensityMean_3R085));
vSe6ROI_3R085_um_42A_1FR_intensityMedian = median(cell2mat(vSe4_1FR__IntensityMedian_3R085));
vSe6ROI_3R085_um_43A_1FR_intensitySTD = std(cell2mat(vSe4_1FR__IntensityMean_3R085));
vSe6ROI_3R085_um_44A_1FR_intensitySE = std(cell2mat(vSe4_1FR__IntensityMean_3R085))/sqrt(length(cell2mat(vSe4_1FR__IntensityMean_3R085)));
%%%
vSe6ROI_3R085_um_45A_1FR_intensityTotalMean = mean(cell2mat(vSe4_1FR__IntensityTotal_3R085));
vSe6ROI_3R085_um_46A_1FR_intensityTotalMedian = median(cell2mat(vSe4_1FR__IntensityTotal_3R085));
vSe6ROI_3R085_um_47A_1FR_intensityTotalSTD = std(cell2mat(vSe4_1FR__IntensityMedian_3R085));
vSe6ROI_3R085_um_48A_1FR_intensityTotalSE = std(cell2mat(vSe4_1FR__IntensityMedian_3R085))/sqrt(length(cell2mat(vSe4_1FR__IntensityMedian_3R085)));
%%%%%%%%%%%
vSe6ROI_3R085_um_51A_2GR_intensityMean = mean(cell2mat(vSe4_2GR__IntensityMean_3R085));
vSe6ROI_3R085_um_52A_2GR_intensityMedian = median(cell2mat(vSe4_2GR__IntensityMedian_3R085));
vSe6ROI_3R085_um_53A_2GR_intensitySTD = std(cell2mat(vSe4_2GR__IntensityMean_3R085));
vSe6ROI_3R085_um_54A_2GR_intensitySE = std(cell2mat(vSe4_2GR__IntensityMean_3R085))/sqrt(length(cell2mat(vSe4_2GR__IntensityMean_3R085)));
%%%
vSe6ROI_3R085_um_55A_2GR_intensityTotalMean = mean(cell2mat(vSe4_2GR__IntensityTotal_3R085));
vSe6ROI_3R085_um_56A_2GR_intensityTotalMedian = median(cell2mat(vSe4_2GR__IntensityTotal_3R085));
vSe6ROI_3R085_um_57A_2GR_intensityTotalSTD = std(cell2mat(vSe4_2GR__IntensityMedian_3R085));
vSe6ROI_3R085_um_58A_2GR_intensityTotalSE = std(cell2mat(vSe4_2GR__IntensityMedian_3R085))/sqrt(length(cell2mat(vSe4_2GR__IntensityMedian_3R085)));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 80% ROI
%%%%%%%%%%%%%%
% 1:area - um^2 // 2:spot number FR // 3:spot number GR
% 4: FR/area // 5: GR/area // 6:FR/GR // 7:GR/FR
% FR 8-15 // GR 16-23
% 8:intensityMean // 9:intensityMedium // 10:intensitySTD // 11:intensitySE
% 12:intensityTotalMean  //  13:intensityTotalMedian
% 14:intensityTotalSTD // 15:intensityTotalSE
for vv1=1:numel(vSe5ROI_4R080_um)
    vSe6ROI_4R080_um_01area(vv1,1) = polyarea(vSe5ROI_4R080_um{vv1,1}(:,1),vSe5ROI_4R080_um{vv1,1}(:,2));
    vSe6ROI_4R080_um_02spFR(vv1,1) = numel(vSe5pos_1FR_4R080_um{vv1,1}(:,1));
    vSe6ROI_4R080_um_03spGR(vv1,1) = numel(vSe5pos_2GR_4R080_um{vv1,1}(:,1));  
    vSe6ROI_4R080_um_04FR_area(vv1,1) = numel(vSe5pos_1FR_4R080_um{vv1,1}(:,1))/polyarea(vSe5ROI_4R080_um{vv1,1}(:,1),vSe5ROI_4R080_um{vv1,1}(:,2));
    vSe6ROI_4R080_um_05GR_area(vv1,1) = numel(vSe5pos_2GR_4R080_um{vv1,1}(:,1))/polyarea(vSe5ROI_4R080_um{vv1,1}(:,1),vSe5ROI_4R080_um{vv1,1}(:,2));
    vSe6ROI_4R080_um_06FR_GR(vv1,1) = numel(vSe5pos_1FR_4R080_um{vv1,1}(:,1))/numel(vSe5pos_2GR_4R080_um{vv1,1}(:,1)); 
    vSe6ROI_4R080_um_07GR_FR(vv1,1) = numel(vSe5pos_2GR_4R080_um{vv1,1}(:,1))/numel(vSe5pos_1FR_4R080_um{vv1,1}(:,1));
    
end
vSe6ROI_4R080_um_08_1FR_intensityMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_09_1FR_intensityMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityMedian_4R080,'un',0);
vSe6ROI_4R080_um_10_1FR_intensitySTD = cellfun(@(x) std(x),vSe4_1FR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_11_1FR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_12_1FR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_13_1FR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_14_1FR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_1FR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_15_1FR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityTotal_4R080,'un',0);
%%%
vSe6ROI_4R080_um_16_2GR_intensityMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_17_2GR_intensityMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityMedian_4R080,'un',0);
vSe6ROI_4R080_um_18_2GR_intensitySTD = cellfun(@(x) std(x),vSe4_2GR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_19_2GR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityMean_4R080,'un',0);
vSe6ROI_4R080_um_20_2GR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_21_2GR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_22_2GR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_2GR__IntensityTotal_4R080,'un',0);
vSe6ROI_4R080_um_23_2GR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityTotal_4R080,'un',0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinlge value (calculate by all data not by single cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 31: all FR // 32: all GR // 33: all area
% 34: FR/GR // 35: GR/FR // 36: FR/area // 37:  GR//area 
% FR 41-48 // GR 51-48
% 41: all intensityMean // 42: all intensicyMedian
% 43: all intensitySTD // 44: all intensitySE
% 45: all intensityTotalMean // 46: all intensityTotalMedian
% 47: all intensityTotalSTD // 48: all intensityTotalSE
%%%%%%%%%%%%%%%
vSe6ROI_4R080_um_31A_FR = length(cell2mat(vSe5pos_1FR_4R080_um));
vSe6ROI_4R080_um_32A_GR = length(cell2mat(vSe5pos_2GR_4R080_um));
vSe6ROI_4R080_um_33A_area = sum(vSe6ROI_4R080_um_01area);
vSe6ROI_4R080_um_34AFR_GR = vSe6ROI_4R080_um_31A_FR/vSe6ROI_4R080_um_32A_GR;
vSe6ROI_4R080_um_35AGR_FR = vSe6ROI_4R080_um_32A_GR/vSe6ROI_4R080_um_31A_FR;
vSe6ROI_4R080_um_36AspFR_area = vSe6ROI_4R080_um_31A_FR/vSe6ROI_4R080_um_33A_area;
vSe6ROI_4R080_um_37AspGR_area = vSe6ROI_4R080_um_32A_GR/vSe6ROI_4R080_um_33A_area;
%%%
vSe6ROI_4R080_um_41A_1FR_intensityMean = mean(cell2mat(vSe4_1FR__IntensityMean_4R080));
vSe6ROI_4R080_um_42A_1FR_intensityMedian = median(cell2mat(vSe4_1FR__IntensityMedian_4R080));
vSe6ROI_4R080_um_43A_1FR_intensitySTD = std(cell2mat(vSe4_1FR__IntensityMean_4R080));
vSe6ROI_4R080_um_44A_1FR_intensitySE = std(cell2mat(vSe4_1FR__IntensityMean_4R080))/sqrt(length(cell2mat(vSe4_1FR__IntensityMean_4R080)));
%%%
vSe6ROI_4R080_um_45A_1FR_intensityTotalMean = mean(cell2mat(vSe4_1FR__IntensityTotal_4R080));
vSe6ROI_4R080_um_46A_1FR_intensityTotalMedian = median(cell2mat(vSe4_1FR__IntensityTotal_4R080));
vSe6ROI_4R080_um_47A_1FR_intensityTotalSTD = std(cell2mat(vSe4_1FR__IntensityMedian_4R080));
vSe6ROI_4R080_um_48A_1FR_intensityTotalSE = std(cell2mat(vSe4_1FR__IntensityMedian_4R080))/sqrt(length(cell2mat(vSe4_1FR__IntensityMedian_4R080)));
%%%%%%%%%%%
vSe6ROI_4R080_um_51A_2GR_intensityMean = mean(cell2mat(vSe4_2GR__IntensityMean_4R080));
vSe6ROI_4R080_um_52A_2GR_intensityMedian = median(cell2mat(vSe4_2GR__IntensityMedian_4R080));
vSe6ROI_4R080_um_53A_2GR_intensitySTD = std(cell2mat(vSe4_2GR__IntensityMean_4R080));
vSe6ROI_4R080_um_54A_2GR_intensitySE = std(cell2mat(vSe4_2GR__IntensityMean_4R080))/sqrt(length(cell2mat(vSe4_2GR__IntensityMean_4R080)));
%%%
vSe6ROI_4R080_um_55A_2GR_intensityTotalMean = mean(cell2mat(vSe4_2GR__IntensityTotal_4R080));
vSe6ROI_4R080_um_56A_2GR_intensityTotalMedian = median(cell2mat(vSe4_2GR__IntensityTotal_4R080));
vSe6ROI_4R080_um_57A_2GR_intensityTotalSTD = std(cell2mat(vSe4_2GR__IntensityMedian_4R080));
vSe6ROI_4R080_um_58A_2GR_intensityTotalSE = std(cell2mat(vSe4_2GR__IntensityMedian_4R080))/sqrt(length(cell2mat(vSe4_2GR__IntensityMedian_4R080)));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 70% ROI
%%%%%%%%%%%%%%
% 1:area - um^2 // 2:spot number FR // 3:spot number GR
% 4: FR/area // 5: GR/area // 6:FR/GR // 7:GR/FR
% FR 8-15 // GR 16-23
% 8:intensityMean // 9:intensityMedium // 10:intensitySTD // 11:intensitySE
% 12:intensityTotalMean  //  13:intensityTotalMedian
% 14:intensityTotalSTD // 15:intensityTotalSE
for vv1=1:numel(vSe5ROI_5R070_um)
    vSe6ROI_5R070_um_01area(vv1,1) = polyarea(vSe5ROI_5R070_um{vv1,1}(:,1),vSe5ROI_5R070_um{vv1,1}(:,2));
    vSe6ROI_5R070_um_02spFR(vv1,1) = numel(vSe5pos_1FR_5R070_um{vv1,1}(:,1));
    vSe6ROI_5R070_um_03spGR(vv1,1) = numel(vSe5pos_2GR_5R070_um{vv1,1}(:,1));  
    vSe6ROI_5R070_um_04FR_area(vv1,1) = numel(vSe5pos_1FR_5R070_um{vv1,1}(:,1))/polyarea(vSe5ROI_5R070_um{vv1,1}(:,1),vSe5ROI_5R070_um{vv1,1}(:,2));
    vSe6ROI_5R070_um_05GR_area(vv1,1) = numel(vSe5pos_2GR_5R070_um{vv1,1}(:,1))/polyarea(vSe5ROI_5R070_um{vv1,1}(:,1),vSe5ROI_5R070_um{vv1,1}(:,2));
    vSe6ROI_5R070_um_06FR_GR(vv1,1) = numel(vSe5pos_1FR_5R070_um{vv1,1}(:,1))/numel(vSe5pos_2GR_5R070_um{vv1,1}(:,1)); 
    vSe6ROI_5R070_um_07GR_FR(vv1,1) = numel(vSe5pos_2GR_5R070_um{vv1,1}(:,1))/numel(vSe5pos_1FR_5R070_um{vv1,1}(:,1));
    
end
vSe6ROI_5R070_um_08_1FR_intensityMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_09_1FR_intensityMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityMedian_5R070,'un',0);
vSe6ROI_5R070_um_10_1FR_intensitySTD = cellfun(@(x) std(x),vSe4_1FR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_11_1FR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_12_1FR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_1FR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_13_1FR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_1FR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_14_1FR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_1FR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_15_1FR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_1FR__IntensityTotal_5R070,'un',0);
%%%
vSe6ROI_5R070_um_16_2GR_intensityMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_17_2GR_intensityMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityMedian_5R070,'un',0);
vSe6ROI_5R070_um_18_2GR_intensitySTD = cellfun(@(x) std(x),vSe4_2GR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_19_2GR_intensitySE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityMean_5R070,'un',0);
vSe6ROI_5R070_um_20_2GR_intensityTotalMean = cellfun(@(x) mean(x),vSe4_2GR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_21_2GR_intensityTotalMedian = cellfun(@(x) median(x),vSe4_2GR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_22_2GR_intensityTotalSTD = cellfun(@(x) std(x),vSe4_2GR__IntensityTotal_5R070,'un',0);
vSe6ROI_5R070_um_23_2GR_intensityTotalSE = cellfun(@(x) std(x)/sqrt(length(x)),vSe4_2GR__IntensityTotal_5R070,'un',0);







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sinlge value (calculate by all data not by single cell)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 31: all FR // 32: all GR // 33: all area
% 34: FR/GR // 35: GR/FR // 36: FR/area // 37:  GR//area 
% FR 41-48 // GR 51-48
% 41: all intensityMean // 42: all intensicyMedian
% 43: all intensitySTD // 44: all intensitySE
% 45: all intensityTotalMean // 46: all intensityTotalMedian
% 47: all intensityTotalSTD // 48: all intensityTotalSE
%%%%%%%%%%%%%%%
vSe6ROI_5R070_um_31A_FR = length(cell2mat(vSe5pos_1FR_5R070_um));
vSe6ROI_5R070_um_32A_GR = length(cell2mat(vSe5pos_2GR_5R070_um));
vSe6ROI_5R070_um_33A_area = sum(vSe6ROI_5R070_um_01area);
vSe6ROI_5R070_um_34AFR_GR = vSe6ROI_5R070_um_31A_FR/vSe6ROI_5R070_um_32A_GR;
vSe6ROI_5R070_um_35AGR_FR = vSe6ROI_5R070_um_32A_GR/vSe6ROI_5R070_um_31A_FR;
vSe6ROI_5R070_um_36AspFR_area = vSe6ROI_5R070_um_31A_FR/vSe6ROI_5R070_um_33A_area;
vSe6ROI_5R070_um_37AspGR_area = vSe6ROI_5R070_um_32A_GR/vSe6ROI_5R070_um_33A_area;
%%%
vSe6ROI_5R070_um_41A_1FR_intensityMean = mean(cell2mat(vSe4_1FR__IntensityMean_5R070));
vSe6ROI_5R070_um_42A_1FR_intensityMedian = median(cell2mat(vSe4_1FR__IntensityMedian_5R070));
vSe6ROI_5R070_um_43A_1FR_intensitySTD = std(cell2mat(vSe4_1FR__IntensityMean_5R070));
vSe6ROI_5R070_um_44A_1FR_intensitySE = std(cell2mat(vSe4_1FR__IntensityMean_5R070))/sqrt(length(cell2mat(vSe4_1FR__IntensityMean_5R070)));
%%%
vSe6ROI_5R070_um_45A_1FR_intensityTotalMean = mean(cell2mat(vSe4_1FR__IntensityTotal_5R070));
vSe6ROI_5R070_um_46A_1FR_intensityTotalMedian = median(cell2mat(vSe4_1FR__IntensityTotal_5R070));
vSe6ROI_5R070_um_47A_1FR_intensityTotalSTD = std(cell2mat(vSe4_1FR__IntensityMedian_5R070));
vSe6ROI_5R070_um_48A_1FR_intensityTotalSE = std(cell2mat(vSe4_1FR__IntensityMedian_5R070))/sqrt(length(cell2mat(vSe4_1FR__IntensityMedian_5R070)));
%%%%%%%%%%%
vSe6ROI_5R070_um_51A_2GR_intensityMean = mean(cell2mat(vSe4_2GR__IntensityMean_5R070));
vSe6ROI_5R070_um_52A_2GR_intensityMedian = median(cell2mat(vSe4_2GR__IntensityMedian_5R070));
vSe6ROI_5R070_um_53A_2GR_intensitySTD = std(cell2mat(vSe4_2GR__IntensityMean_5R070));
vSe6ROI_5R070_um_54A_2GR_intensitySE = std(cell2mat(vSe4_2GR__IntensityMean_5R070))/sqrt(length(cell2mat(vSe4_2GR__IntensityMean_5R070)));
%%%
vSe6ROI_5R070_um_55A_2GR_intensityTotalMean = mean(cell2mat(vSe4_2GR__IntensityTotal_5R070));
vSe6ROI_5R070_um_56A_2GR_intensityTotalMedian = median(cell2mat(vSe4_2GR__IntensityTotal_5R070));
vSe6ROI_5R070_um_57A_2GR_intensityTotalSTD = std(cell2mat(vSe4_2GR__IntensityMedian_5R070));
vSe6ROI_5R070_um_58A_2GR_intensityTotalSE = std(cell2mat(vSe4_2GR__IntensityMedian_5R070))/sqrt(length(cell2mat(vSe4_2GR__IntensityMedian_5R070)));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%













%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nearest distance
%%%%%%%%%%%%%%%%%
% FR position um
vSe7ND_1FR_1R100_um_1D = vSe5pos_1FR_1R100_um;
vSe7ND_1FR_2R090_um_1D = vSe5pos_1FR_2R090_um;
vSe7ND_1FR_3R085_um_1D = vSe5pos_1FR_3R085_um;
vSe7ND_1FR_4R080_um_1D = vSe5pos_1FR_4R080_um;
vSe7ND_1FR_5R070_um_1D = vSe5pos_1FR_5R070_um;
% GR position um
vSe7ND_2GR_1R100_um_1D = vSe5pos_2GR_1R100_um;
vSe7ND_2GR_2R090_um_1D = vSe5pos_2GR_2R090_um;
vSe7ND_2GR_3R085_um_1D = vSe5pos_2GR_3R085_um;
vSe7ND_2GR_4R080_um_1D = vSe5pos_2GR_4R080_um;
vSe7ND_2GR_5R070_um_1D = vSe5pos_2GR_5R070_um;

%%%%%%%%%%%%%%%%%%
% 100% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_1FR_1R100_um_1D)
    [vSe7ND_3FRGR_1R100_um_2Rplace{vv,1},vSe7ND_3FRGR_1R100_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_1R100_um_1D{vv,1},vSe7ND_2GR_1R100_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3FRGR_1R100_um_2Rplace)
    vSe7ND_3FRGR_1R100_um_3positions{vv2,1} = vSe7ND_2GR_1R100_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3FRGR_1R100_um_2Rplace{vv2,1})
        vv4=vSe7ND_3FRGR_1R100_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3FRGR_1R100_um_3positions{vv2,2}(vv3,:) =  vSe7ND_1FR_1R100_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_1R100_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_1FR_1R100_um_1D{vv2,1}(vv4,:),vSe7ND_2GR_1R100_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_1R100_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_1FR_1R100_um_1D{vv2,1}(vv4,:), vSe7ND_2GR_1R100_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_1R100_um_3positions{vv2,5}(vv3,:) = vSe7ND_2GR_1R100_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_1R100_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_1R100_um_3positions{vv2,6}(vv3,:) = (vSe7ND_2GR_1R100_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_1R100_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3FRGR_1R100_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3FRGR_1R100_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3FRGR_1R100_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3FRGR_1R100_um_3positions{vv2,8} = sum(vSe7ND_3FRGR_1R100_um_3positions{vv2,7});
    vSe7ND_3FRGR_1R100_um_3positions{vv2,9} = vSe7ND_3FRGR_1R100_um_3positions{vv2,8}/numel(vSe7ND_3FRGR_1R100_um_3positions{vv2,7})*100;
    vSe7ND_3FRGR_1R100_um_3positions{vv2,10} = mean(vSe7ND_3FRGR_1R100_um_3positions{vv2,3});
    vSe7ND_3FRGR_1R100_um_3positions{vv2,11} = median(vSe7ND_3FRGR_1R100_um_3positions{vv2,3});
    vSe7ND_3FRGR_1R100_um_3positions{vv2,12} = std(vSe7ND_3FRGR_1R100_um_3positions{vv2,3});
    vSe7ND_3FRGR_1R100_um_3positions{vv2,13} = std(vSe7ND_3FRGR_1R100_um_3positions{vv2,3})/sqrt(length(vSe7ND_3FRGR_1R100_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_1R100_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3)));
vSe7ND_3FRGR_1R100_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3)));
vSe7ND_3FRGR_1R100_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3)));
vSe7ND_3FRGR_1R100_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3)));
vSe7ND_3FRGR_1R100_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3FRGR_1R100_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,7)));
vSe7ND_3FRGR_1R100_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,8)));
vSe7ND_3FRGR_1R100_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3FRGR_1R100_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3FRGR_1R100_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3FRGR_1R100_um_5onlyMC = vSe7ND_3FRGR_1R100_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3FRGR_1R100_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3FRGR_1R100_um_5onlyMCdata = vSe7ND_3FRGR_1R100_um_5onlyMC;
for vv2=1
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,7});
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,9} = vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,11} = median(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,12} = std(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,13} = std(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3FRGR_1R100_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_1R100_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_1R100_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_1R100_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_1R100_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_1R100_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 90% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_1FR_2R090_um_1D)
    [vSe7ND_3FRGR_2R090_um_2Rplace{vv,1},vSe7ND_3FRGR_2R090_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_2R090_um_1D{vv,1},vSe7ND_2GR_2R090_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
for vv2=1:numel(vSe7ND_3FRGR_2R090_um_2Rplace)
    vSe7ND_3FRGR_2R090_um_3positions{vv2,1} = vSe7ND_2GR_2R090_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3FRGR_2R090_um_2Rplace{vv2,1})
        vv4=vSe7ND_3FRGR_2R090_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3FRGR_2R090_um_3positions{vv2,2}(vv3,:) =  vSe7ND_1FR_2R090_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_2R090_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_1FR_2R090_um_1D{vv2,1}(vv4,:),vSe7ND_2GR_2R090_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_2R090_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_1FR_2R090_um_1D{vv2,1}(vv4,:), vSe7ND_2GR_2R090_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_2R090_um_3positions{vv2,5}(vv3,:) = vSe7ND_2GR_2R090_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_2R090_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_2R090_um_3positions{vv2,6}(vv3,:) = (vSe7ND_2GR_2R090_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_2R090_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3FRGR_2R090_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3FRGR_2R090_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3FRGR_2R090_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3FRGR_2R090_um_3positions{vv2,8} = sum(vSe7ND_3FRGR_2R090_um_3positions{vv2,7});
    vSe7ND_3FRGR_2R090_um_3positions{vv2,9} = vSe7ND_3FRGR_2R090_um_3positions{vv2,8}/numel(vSe7ND_3FRGR_2R090_um_3positions{vv2,7})*100;
    vSe7ND_3FRGR_2R090_um_3positions{vv2,10} = mean(vSe7ND_3FRGR_2R090_um_3positions{vv2,3});
    vSe7ND_3FRGR_2R090_um_3positions{vv2,11} = median(vSe7ND_3FRGR_2R090_um_3positions{vv2,3});
    vSe7ND_3FRGR_2R090_um_3positions{vv2,12} = std(vSe7ND_3FRGR_2R090_um_3positions{vv2,3});
    vSe7ND_3FRGR_2R090_um_3positions{vv2,13} = std(vSe7ND_3FRGR_2R090_um_3positions{vv2,3})/sqrt(length(vSe7ND_3FRGR_2R090_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_2R090_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3)));
vSe7ND_3FRGR_2R090_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3)));
vSe7ND_3FRGR_2R090_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3)));
vSe7ND_3FRGR_2R090_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3)));
vSe7ND_3FRGR_2R090_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3FRGR_2R090_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,7)));
vSe7ND_3FRGR_2R090_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,8)));
vSe7ND_3FRGR_2R090_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3FRGR_2R090_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3FRGR_2R090_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3FRGR_2R090_um_5onlyMC = vSe7ND_3FRGR_2R090_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3FRGR_2R090_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3FRGR_2R090_um_5onlyMCdata = vSe7ND_3FRGR_2R090_um_5onlyMC;
for vv2=1
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,7});
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,9} = vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,11} = median(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,12} = std(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,13} = std(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3FRGR_2R090_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_2R090_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_2R090_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_2R090_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_2R090_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_2R090_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_2R090_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 85% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_1FR_3R085_um_1D)
    [vSe7ND_3FRGR_3R085_um_2Rplace{vv,1},vSe7ND_3FRGR_3R085_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_3R085_um_1D{vv,1},vSe7ND_2GR_3R085_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
for vv2=1:numel(vSe7ND_3FRGR_3R085_um_2Rplace)
    vSe7ND_3FRGR_3R085_um_3positions{vv2,1} = vSe7ND_2GR_3R085_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3FRGR_3R085_um_2Rplace{vv2,1})
        vv4=vSe7ND_3FRGR_3R085_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3FRGR_3R085_um_3positions{vv2,2}(vv3,:) =  vSe7ND_1FR_3R085_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_3R085_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_1FR_3R085_um_1D{vv2,1}(vv4,:),vSe7ND_2GR_3R085_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_3R085_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_1FR_3R085_um_1D{vv2,1}(vv4,:), vSe7ND_2GR_3R085_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_3R085_um_3positions{vv2,5}(vv3,:) = vSe7ND_2GR_3R085_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_3R085_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_3R085_um_3positions{vv2,6}(vv3,:) = (vSe7ND_2GR_3R085_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_3R085_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3FRGR_3R085_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3FRGR_3R085_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3FRGR_3R085_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3FRGR_3R085_um_3positions{vv2,8} = sum(vSe7ND_3FRGR_3R085_um_3positions{vv2,7});
    vSe7ND_3FRGR_3R085_um_3positions{vv2,9} = vSe7ND_3FRGR_3R085_um_3positions{vv2,8}/numel(vSe7ND_3FRGR_3R085_um_3positions{vv2,7})*100;
    vSe7ND_3FRGR_3R085_um_3positions{vv2,10} = mean(vSe7ND_3FRGR_3R085_um_3positions{vv2,3});
    vSe7ND_3FRGR_3R085_um_3positions{vv2,11} = median(vSe7ND_3FRGR_3R085_um_3positions{vv2,3});
    vSe7ND_3FRGR_3R085_um_3positions{vv2,12} = std(vSe7ND_3FRGR_3R085_um_3positions{vv2,3});
    vSe7ND_3FRGR_3R085_um_3positions{vv2,13} = std(vSe7ND_3FRGR_3R085_um_3positions{vv2,3})/sqrt(length(vSe7ND_3FRGR_3R085_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_3R085_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3)));
vSe7ND_3FRGR_3R085_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3)));
vSe7ND_3FRGR_3R085_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3)));
vSe7ND_3FRGR_3R085_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3)));
vSe7ND_3FRGR_3R085_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3FRGR_3R085_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,7)));
vSe7ND_3FRGR_3R085_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,8)));
vSe7ND_3FRGR_3R085_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3FRGR_3R085_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3FRGR_3R085_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3FRGR_3R085_um_5onlyMC = vSe7ND_3FRGR_3R085_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3FRGR_3R085_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3FRGR_3R085_um_5onlyMCdata = vSe7ND_3FRGR_3R085_um_5onlyMC;
for vv2=1
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,7});
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,9} = vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,11} = median(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,12} = std(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,13} = std(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3FRGR_3R085_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_3R085_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_3R085_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_3R085_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_3R085_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_3R085_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_3R085_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 80% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_1FR_4R080_um_1D)
    [vSe7ND_3FRGR_4R080_um_2Rplace{vv,1},vSe7ND_3FRGR_4R080_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_4R080_um_1D{vv,1},vSe7ND_2GR_4R080_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
for vv2=1:numel(vSe7ND_3FRGR_4R080_um_2Rplace)
    vSe7ND_3FRGR_4R080_um_3positions{vv2,1} = vSe7ND_2GR_4R080_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3FRGR_4R080_um_2Rplace{vv2,1})
        vv4=vSe7ND_3FRGR_4R080_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3FRGR_4R080_um_3positions{vv2,2}(vv3,:) =  vSe7ND_1FR_4R080_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_4R080_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_1FR_4R080_um_1D{vv2,1}(vv4,:),vSe7ND_2GR_4R080_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_4R080_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_1FR_4R080_um_1D{vv2,1}(vv4,:), vSe7ND_2GR_4R080_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_4R080_um_3positions{vv2,5}(vv3,:) = vSe7ND_2GR_4R080_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_4R080_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_4R080_um_3positions{vv2,6}(vv3,:) = (vSe7ND_2GR_4R080_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_4R080_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3FRGR_4R080_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3FRGR_4R080_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3FRGR_4R080_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3FRGR_4R080_um_3positions{vv2,8} = sum(vSe7ND_3FRGR_4R080_um_3positions{vv2,7});
    vSe7ND_3FRGR_4R080_um_3positions{vv2,9} = vSe7ND_3FRGR_4R080_um_3positions{vv2,8}/numel(vSe7ND_3FRGR_4R080_um_3positions{vv2,7})*100;
    vSe7ND_3FRGR_4R080_um_3positions{vv2,10} = mean(vSe7ND_3FRGR_4R080_um_3positions{vv2,3});
    vSe7ND_3FRGR_4R080_um_3positions{vv2,11} = median(vSe7ND_3FRGR_4R080_um_3positions{vv2,3});
    vSe7ND_3FRGR_4R080_um_3positions{vv2,12} = std(vSe7ND_3FRGR_4R080_um_3positions{vv2,3});
    vSe7ND_3FRGR_4R080_um_3positions{vv2,13} = std(vSe7ND_3FRGR_4R080_um_3positions{vv2,3})/sqrt(length(vSe7ND_3FRGR_4R080_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_4R080_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3)));
vSe7ND_3FRGR_4R080_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3)));
vSe7ND_3FRGR_4R080_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3)));
vSe7ND_3FRGR_4R080_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3)));
vSe7ND_3FRGR_4R080_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3FRGR_4R080_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,7)));
vSe7ND_3FRGR_4R080_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,8)));
vSe7ND_3FRGR_4R080_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3FRGR_4R080_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3FRGR_4R080_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3FRGR_4R080_um_5onlyMC = vSe7ND_3FRGR_4R080_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3FRGR_4R080_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3FRGR_4R080_um_5onlyMCdata = vSe7ND_3FRGR_4R080_um_5onlyMC;
for vv2=1
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,7});
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,9} = vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,11} = median(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,12} = std(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,13} = std(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3FRGR_4R080_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_4R080_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_4R080_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_4R080_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_4R080_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_4R080_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_4R080_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 70% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_1FR_5R070_um_1D)
    [vSe7ND_3FRGR_5R070_um_2Rplace{vv,1},vSe7ND_3FRGR_5R070_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_5R070_um_1D{vv,1},vSe7ND_2GR_5R070_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
for vv2=1:numel(vSe7ND_3FRGR_5R070_um_2Rplace)
    vSe7ND_3FRGR_5R070_um_3positions{vv2,1} = vSe7ND_2GR_5R070_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3FRGR_5R070_um_2Rplace{vv2,1})
        vv4=vSe7ND_3FRGR_5R070_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3FRGR_5R070_um_3positions{vv2,2}(vv3,:) =  vSe7ND_1FR_5R070_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_5R070_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_1FR_5R070_um_1D{vv2,1}(vv4,:),vSe7ND_2GR_5R070_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_5R070_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_1FR_5R070_um_1D{vv2,1}(vv4,:), vSe7ND_2GR_5R070_um_1D{vv2,1}(vv3,:));
        vSe7ND_3FRGR_5R070_um_3positions{vv2,5}(vv3,:) = vSe7ND_2GR_5R070_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_5R070_um_1D{vv2,1}(vv4,:);
        vSe7ND_3FRGR_5R070_um_3positions{vv2,6}(vv3,:) = (vSe7ND_2GR_5R070_um_1D{vv2,1}(vv3,:)-vSe7ND_1FR_5R070_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3FRGR_5R070_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3FRGR_5R070_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3FRGR_5R070_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3FRGR_5R070_um_3positions{vv2,8} = sum(vSe7ND_3FRGR_5R070_um_3positions{vv2,7});
    vSe7ND_3FRGR_5R070_um_3positions{vv2,9} = vSe7ND_3FRGR_5R070_um_3positions{vv2,8}/numel(vSe7ND_3FRGR_5R070_um_3positions{vv2,7})*100;
    vSe7ND_3FRGR_5R070_um_3positions{vv2,10} = mean(vSe7ND_3FRGR_5R070_um_3positions{vv2,3});
    vSe7ND_3FRGR_5R070_um_3positions{vv2,11} = median(vSe7ND_3FRGR_5R070_um_3positions{vv2,3});
    vSe7ND_3FRGR_5R070_um_3positions{vv2,12} = std(vSe7ND_3FRGR_5R070_um_3positions{vv2,3});
    vSe7ND_3FRGR_5R070_um_3positions{vv2,13} = std(vSe7ND_3FRGR_5R070_um_3positions{vv2,3})/sqrt(length(vSe7ND_3FRGR_5R070_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_5R070_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3)));
vSe7ND_3FRGR_5R070_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3)));
vSe7ND_3FRGR_5R070_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3)));
vSe7ND_3FRGR_5R070_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3)));
vSe7ND_3FRGR_5R070_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3FRGR_5R070_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,7)));
vSe7ND_3FRGR_5R070_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,8)));
vSe7ND_3FRGR_5R070_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3FRGR_5R070_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3FRGR_5R070_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3FRGR_5R070_um_5onlyMC = vSe7ND_3FRGR_5R070_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3FRGR_5R070_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3FRGR_5R070_um_5onlyMCdata = vSe7ND_3FRGR_5R070_um_5onlyMC;
for vv2=1
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,7});
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,9} = vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,11} = median(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,12} = std(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,13} = std(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3FRGR_5R070_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3FRGR_5R070_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_5R070_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_5R070_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_5R070_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3FRGR_5R070_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3FRGR_5R070_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
% GR/FR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% 100% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_2GR_1R100_um_1D)
    [vSe7ND_3GRFR_1R100_um_2Rplace{vv,1},vSe7ND_3GRFR_1R100_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_1R100_um_1D{vv,1},vSe7ND_1FR_1R100_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3GRFR_1R100_um_2Rplace)
    vSe7ND_3GRFR_1R100_um_3positions{vv2,1} = vSe7ND_1FR_1R100_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3GRFR_1R100_um_2Rplace{vv2,1})
        vv4=vSe7ND_3GRFR_1R100_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3GRFR_1R100_um_3positions{vv2,2}(vv3,:) =  vSe7ND_2GR_1R100_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_1R100_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_2GR_1R100_um_1D{vv2,1}(vv4,:),vSe7ND_1FR_1R100_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_1R100_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_2GR_1R100_um_1D{vv2,1}(vv4,:), vSe7ND_1FR_1R100_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_1R100_um_3positions{vv2,5}(vv3,:) = vSe7ND_1FR_1R100_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_1R100_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_1R100_um_3positions{vv2,6}(vv3,:) = (vSe7ND_1FR_1R100_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_1R100_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3GRFR_1R100_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3GRFR_1R100_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3GRFR_1R100_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3GRFR_1R100_um_3positions{vv2,8} = sum(vSe7ND_3GRFR_1R100_um_3positions{vv2,7});
    vSe7ND_3GRFR_1R100_um_3positions{vv2,9} = vSe7ND_3GRFR_1R100_um_3positions{vv2,8}/numel(vSe7ND_3GRFR_1R100_um_3positions{vv2,7})*100;
    vSe7ND_3GRFR_1R100_um_3positions{vv2,10} = mean(vSe7ND_3GRFR_1R100_um_3positions{vv2,3});
    vSe7ND_3GRFR_1R100_um_3positions{vv2,11} = median(vSe7ND_3GRFR_1R100_um_3positions{vv2,3});
    vSe7ND_3GRFR_1R100_um_3positions{vv2,12} = std(vSe7ND_3GRFR_1R100_um_3positions{vv2,3});
    vSe7ND_3GRFR_1R100_um_3positions{vv2,13} = std(vSe7ND_3GRFR_1R100_um_3positions{vv2,3})/sqrt(length(vSe7ND_3GRFR_1R100_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_1R100_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3)));
vSe7ND_3GRFR_1R100_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3)));
vSe7ND_3GRFR_1R100_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3)));
vSe7ND_3GRFR_1R100_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3)));
vSe7ND_3GRFR_1R100_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3GRFR_1R100_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,7)));
vSe7ND_3GRFR_1R100_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,8)));
vSe7ND_3GRFR_1R100_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3GRFR_1R100_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3GRFR_1R100_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3GRFR_1R100_um_5onlyMC = vSe7ND_3GRFR_1R100_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3GRFR_1R100_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3GRFR_1R100_um_5onlyMCdata = vSe7ND_3GRFR_1R100_um_5onlyMC;
for vv2=1
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,7});
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,9} = vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,11} = median(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,12} = std(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,13} = std(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3GRFR_1R100_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_1R100_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_1R100_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_1R100_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_1R100_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_1R100_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%
% 90% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_2GR_2R090_um_1D)
    [vSe7ND_3GRFR_2R090_um_2Rplace{vv,1},vSe7ND_3GRFR_2R090_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_2R090_um_1D{vv,1},vSe7ND_1FR_2R090_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3GRFR_2R090_um_2Rplace)
    vSe7ND_3GRFR_2R090_um_3positions{vv2,1} = vSe7ND_1FR_2R090_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3GRFR_2R090_um_2Rplace{vv2,1})
        vv4=vSe7ND_3GRFR_2R090_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3GRFR_2R090_um_3positions{vv2,2}(vv3,:) =  vSe7ND_2GR_2R090_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_2R090_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_2GR_2R090_um_1D{vv2,1}(vv4,:),vSe7ND_1FR_2R090_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_2R090_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_2GR_2R090_um_1D{vv2,1}(vv4,:), vSe7ND_1FR_2R090_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_2R090_um_3positions{vv2,5}(vv3,:) = vSe7ND_1FR_2R090_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_2R090_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_2R090_um_3positions{vv2,6}(vv3,:) = (vSe7ND_1FR_2R090_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_2R090_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3GRFR_2R090_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3GRFR_2R090_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3GRFR_2R090_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3GRFR_2R090_um_3positions{vv2,8} = sum(vSe7ND_3GRFR_2R090_um_3positions{vv2,7});
    vSe7ND_3GRFR_2R090_um_3positions{vv2,9} = vSe7ND_3GRFR_2R090_um_3positions{vv2,8}/numel(vSe7ND_3GRFR_2R090_um_3positions{vv2,7})*100;
    vSe7ND_3GRFR_2R090_um_3positions{vv2,10} = mean(vSe7ND_3GRFR_2R090_um_3positions{vv2,3});
    vSe7ND_3GRFR_2R090_um_3positions{vv2,11} = median(vSe7ND_3GRFR_2R090_um_3positions{vv2,3});
    vSe7ND_3GRFR_2R090_um_3positions{vv2,12} = std(vSe7ND_3GRFR_2R090_um_3positions{vv2,3});
    vSe7ND_3GRFR_2R090_um_3positions{vv2,13} = std(vSe7ND_3GRFR_2R090_um_3positions{vv2,3})/sqrt(length(vSe7ND_3GRFR_2R090_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_2R090_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3)));
vSe7ND_3GRFR_2R090_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3)));
vSe7ND_3GRFR_2R090_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3)));
vSe7ND_3GRFR_2R090_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3)));
vSe7ND_3GRFR_2R090_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3GRFR_2R090_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,7)));
vSe7ND_3GRFR_2R090_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,8)));
vSe7ND_3GRFR_2R090_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3GRFR_2R090_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3GRFR_2R090_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3GRFR_2R090_um_5onlyMC = vSe7ND_3GRFR_2R090_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3GRFR_2R090_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3GRFR_2R090_um_5onlyMCdata = vSe7ND_3GRFR_2R090_um_5onlyMC;
for vv2=1
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,7});
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,9} = vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,11} = median(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,12} = std(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,13} = std(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3GRFR_2R090_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_2R090_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_2R090_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_2R090_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_2R090_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_2R090_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_2R090_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%
% 85% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_2GR_3R085_um_1D)
    [vSe7ND_3GRFR_3R085_um_2Rplace{vv,1},vSe7ND_3GRFR_3R085_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_3R085_um_1D{vv,1},vSe7ND_1FR_3R085_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3GRFR_3R085_um_2Rplace)
    vSe7ND_3GRFR_3R085_um_3positions{vv2,1} = vSe7ND_1FR_3R085_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3GRFR_3R085_um_2Rplace{vv2,1})
        vv4=vSe7ND_3GRFR_3R085_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3GRFR_3R085_um_3positions{vv2,2}(vv3,:) =  vSe7ND_2GR_3R085_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_3R085_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_2GR_3R085_um_1D{vv2,1}(vv4,:),vSe7ND_1FR_3R085_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_3R085_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_2GR_3R085_um_1D{vv2,1}(vv4,:), vSe7ND_1FR_3R085_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_3R085_um_3positions{vv2,5}(vv3,:) = vSe7ND_1FR_3R085_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_3R085_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_3R085_um_3positions{vv2,6}(vv3,:) = (vSe7ND_1FR_3R085_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_3R085_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3GRFR_3R085_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3GRFR_3R085_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3GRFR_3R085_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3GRFR_3R085_um_3positions{vv2,8} = sum(vSe7ND_3GRFR_3R085_um_3positions{vv2,7});
    vSe7ND_3GRFR_3R085_um_3positions{vv2,9} = vSe7ND_3GRFR_3R085_um_3positions{vv2,8}/numel(vSe7ND_3GRFR_3R085_um_3positions{vv2,7})*100;
    vSe7ND_3GRFR_3R085_um_3positions{vv2,10} = mean(vSe7ND_3GRFR_3R085_um_3positions{vv2,3});
    vSe7ND_3GRFR_3R085_um_3positions{vv2,11} = median(vSe7ND_3GRFR_3R085_um_3positions{vv2,3});
    vSe7ND_3GRFR_3R085_um_3positions{vv2,12} = std(vSe7ND_3GRFR_3R085_um_3positions{vv2,3});
    vSe7ND_3GRFR_3R085_um_3positions{vv2,13} = std(vSe7ND_3GRFR_3R085_um_3positions{vv2,3})/sqrt(length(vSe7ND_3GRFR_3R085_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_3R085_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3)));
vSe7ND_3GRFR_3R085_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3)));
vSe7ND_3GRFR_3R085_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3)));
vSe7ND_3GRFR_3R085_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3)));
vSe7ND_3GRFR_3R085_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3GRFR_3R085_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,7)));
vSe7ND_3GRFR_3R085_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,8)));
vSe7ND_3GRFR_3R085_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3GRFR_3R085_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3GRFR_3R085_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3GRFR_3R085_um_5onlyMC = vSe7ND_3GRFR_3R085_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3GRFR_3R085_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3GRFR_3R085_um_5onlyMCdata = vSe7ND_3GRFR_3R085_um_5onlyMC;
for vv2=1
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,7});
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,9} = vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,11} = median(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,12} = std(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,13} = std(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3GRFR_3R085_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_3R085_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_3R085_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_3R085_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_3R085_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_3R085_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_3R085_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%
% 80% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_2GR_4R080_um_1D)
    [vSe7ND_3GRFR_4R080_um_2Rplace{vv,1},vSe7ND_3GRFR_4R080_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_4R080_um_1D{vv,1},vSe7ND_1FR_4R080_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3GRFR_4R080_um_2Rplace)
    vSe7ND_3GRFR_4R080_um_3positions{vv2,1} = vSe7ND_1FR_4R080_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3GRFR_4R080_um_2Rplace{vv2,1})
        vv4=vSe7ND_3GRFR_4R080_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3GRFR_4R080_um_3positions{vv2,2}(vv3,:) =  vSe7ND_2GR_4R080_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_4R080_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_2GR_4R080_um_1D{vv2,1}(vv4,:),vSe7ND_1FR_4R080_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_4R080_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_2GR_4R080_um_1D{vv2,1}(vv4,:), vSe7ND_1FR_4R080_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_4R080_um_3positions{vv2,5}(vv3,:) = vSe7ND_1FR_4R080_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_4R080_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_4R080_um_3positions{vv2,6}(vv3,:) = (vSe7ND_1FR_4R080_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_4R080_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3GRFR_4R080_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3GRFR_4R080_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3GRFR_4R080_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3GRFR_4R080_um_3positions{vv2,8} = sum(vSe7ND_3GRFR_4R080_um_3positions{vv2,7});
    vSe7ND_3GRFR_4R080_um_3positions{vv2,9} = vSe7ND_3GRFR_4R080_um_3positions{vv2,8}/numel(vSe7ND_3GRFR_4R080_um_3positions{vv2,7})*100;
    vSe7ND_3GRFR_4R080_um_3positions{vv2,10} = mean(vSe7ND_3GRFR_4R080_um_3positions{vv2,3});
    vSe7ND_3GRFR_4R080_um_3positions{vv2,11} = median(vSe7ND_3GRFR_4R080_um_3positions{vv2,3});
    vSe7ND_3GRFR_4R080_um_3positions{vv2,12} = std(vSe7ND_3GRFR_4R080_um_3positions{vv2,3});
    vSe7ND_3GRFR_4R080_um_3positions{vv2,13} = std(vSe7ND_3GRFR_4R080_um_3positions{vv2,3})/sqrt(length(vSe7ND_3GRFR_4R080_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_4R080_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3)));
vSe7ND_3GRFR_4R080_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3)));
vSe7ND_3GRFR_4R080_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3)));
vSe7ND_3GRFR_4R080_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3)));
vSe7ND_3GRFR_4R080_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3GRFR_4R080_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,7)));
vSe7ND_3GRFR_4R080_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,8)));
vSe7ND_3GRFR_4R080_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3GRFR_4R080_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3GRFR_4R080_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3GRFR_4R080_um_5onlyMC = vSe7ND_3GRFR_4R080_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3GRFR_4R080_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3GRFR_4R080_um_5onlyMCdata = vSe7ND_3GRFR_4R080_um_5onlyMC;
for vv2=1
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,7});
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,9} = vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,11} = median(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,12} = std(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,13} = std(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3GRFR_4R080_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_4R080_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_4R080_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_4R080_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_4R080_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_4R080_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_4R080_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%
% 70% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
for vv=1:numel(vSe7ND_2GR_5R070_um_1D)
    [vSe7ND_3GRFR_5R070_um_2Rplace{vv,1},vSe7ND_3GRFR_5R070_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_5R070_um_1D{vv,1},vSe7ND_1FR_5R070_um_1D{vv,1},'k',1,'Distance','minkowski');
end
% 1:GR position / 2:nearest FR position / 3:distance / 4:angle / 5:set GR to zero (um) /
% 6:set GR to zero (nm)  / 7:distance above  (1) (x2 nuclear porediameter)
% 120(nuclear pore diameter)+200(diffraction limit)=320nm for detection => diffraction limit (Abbe Resolutionx,y = lamda/2NA ((NA = nsin())) 650 -> 218.1208 / 488 -> 163.7584
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distance
% dArea = 320;
for vv2=1:numel(vSe7ND_3GRFR_5R070_um_2Rplace)
    vSe7ND_3GRFR_5R070_um_3positions{vv2,1} = vSe7ND_1FR_5R070_um_1D{vv2,1};
    for vv3=1:numel(vSe7ND_3GRFR_5R070_um_2Rplace{vv2,1})
        vv4=vSe7ND_3GRFR_5R070_um_2Rplace{vv2,1}(vv3,1);
        vSe7ND_3GRFR_5R070_um_3positions{vv2,2}(vv3,:) =  vSe7ND_2GR_5R070_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_5R070_um_3positions{vv2,3}(vv3,:) = pointDistance2D(vSe7ND_2GR_5R070_um_1D{vv2,1}(vv4,:),vSe7ND_1FR_5R070_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_5R070_um_3positions{vv2,4}(vv3,:) = pointAngle2D(vSe7ND_2GR_5R070_um_1D{vv2,1}(vv4,:), vSe7ND_1FR_5R070_um_1D{vv2,1}(vv3,:));
        vSe7ND_3GRFR_5R070_um_3positions{vv2,5}(vv3,:) = vSe7ND_1FR_5R070_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_5R070_um_1D{vv2,1}(vv4,:);
        vSe7ND_3GRFR_5R070_um_3positions{vv2,6}(vv3,:) = (vSe7ND_1FR_5R070_um_1D{vv2,1}(vv3,:)-vSe7ND_2GR_5R070_um_1D{vv2,1}(vv4,:))*1000;
            if vSe7ND_3GRFR_5R070_um_3positions{vv2,3}(vv3,:) > dArea
                vSe7ND_3GRFR_5R070_um_3positions{vv2,7}(vv3,:) = 1;
            else  
                vSe7ND_3GRFR_5R070_um_3positions{vv2,7}(vv3,:) = 0;
            end
    end
    vSe7ND_3GRFR_5R070_um_3positions{vv2,8} = sum(vSe7ND_3GRFR_5R070_um_3positions{vv2,7});
    vSe7ND_3GRFR_5R070_um_3positions{vv2,9} = vSe7ND_3GRFR_5R070_um_3positions{vv2,8}/numel(vSe7ND_3GRFR_5R070_um_3positions{vv2,7})*100;
    vSe7ND_3GRFR_5R070_um_3positions{vv2,10} = mean(vSe7ND_3GRFR_5R070_um_3positions{vv2,3});
    vSe7ND_3GRFR_5R070_um_3positions{vv2,11} = median(vSe7ND_3GRFR_5R070_um_3positions{vv2,3});
    vSe7ND_3GRFR_5R070_um_3positions{vv2,12} = std(vSe7ND_3GRFR_5R070_um_3positions{vv2,3});
    vSe7ND_3GRFR_5R070_um_3positions{vv2,13} = std(vSe7ND_3GRFR_5R070_um_3positions{vv2,3})/sqrt(length(vSe7ND_3GRFR_5R070_um_3positions{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_5R070_um_4ApointDistance2D(1,1) = numel(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3)));
vSe7ND_3GRFR_5R070_um_4ApointDistance2D(1,2) = mean(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3)));
vSe7ND_3GRFR_5R070_um_4ApointDistance2D(1,3) = median(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3)));
vSe7ND_3GRFR_5R070_um_4ApointDistance2D(1,4) = std(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3)));
vSe7ND_3GRFR_5R070_um_4ApointDistance2D(1,5) = std(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,3))));
%%%%%%%%%%%%
% unmated case
% all number / all unmatch / percentage of unmatch
vSe7ND_3GRFR_5R070_um_4Aunmatch(1,1) = numel(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,7)));
vSe7ND_3GRFR_5R070_um_4Aunmatch(1,2) = sum(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,8)));
vSe7ND_3GRFR_5R070_um_4Aunmatch(1,3) = sum(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,8)))/numel(cell2mat(vSe7ND_3GRFR_5R070_um_3positions(:,7)))*100;
%%%%%%%%%%%%%%%%%
% only matched case (distance =< 320nm)
% only vSe7ND_3GRFR_5R070_um_3positions{vv2,7}(vv3,:) = 0;
vSe7ND_3GRFR_5R070_um_5onlyMC = vSe7ND_3GRFR_5R070_um_3positions(:,1:7);
for mm1=1
    for mm2=length(vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,1}):-1:1
        if vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,7}(mm2,1) == 1
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,1}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,2}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,3}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,4}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,5}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,6}(mm2,:) = [];
            vSe7ND_3GRFR_5R070_um_5onlyMC{mm1,7}(mm2,:) = [];       
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% add more analysis
% 8: numbers of over 240nm / 9: ummatched percentage 10 mean distance / 11: median distance
% 12: std distance / 13: SE distanc
vSe7ND_3GRFR_5R070_um_5onlyMCdata = vSe7ND_3GRFR_5R070_um_5onlyMC;
for vv2=1
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,8} = sum(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,7});
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,9} = vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,8}/numel(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,7})*100;
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,10} = mean(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,11} = median(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,12} = std(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,3});
    vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,13} = std(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,3})/sqrt(length(vSe7ND_3GRFR_5R070_um_5onlyMCdata{vv2,3}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% all data calculation not by a cell / distance
% number / mean / median / STD / SE
vSe7ND_3GRFR_5R070_um_6AdistanceMC(1,1) = numel(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_5R070_um_6AdistanceMC(1,2) = mean(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_5R070_um_6AdistanceMC(1,3) = median(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_5R070_um_6AdistanceMC(1,4) = std(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3)));
vSe7ND_3GRFR_5R070_um_6AdistanceMC(1,5) = std(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3)))/sqrt(length(cell2mat(vSe7ND_3GRFR_5R070_um_5onlyMCdata(:,3))));
%%%%%%%%%%%%
















%%%%%%%%%%%%%%%%%%%%%
% by LEE
%%%%%%%%%%%%%%%%%%%%%%%%%
% Data analysis
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
% 100
%%%%%%%%%%%%%%%%%%%%%%
% Table save
cSpotN1 = '11-Table-1R100';
%%%%%%%%%%%%
mkdir([pwd '\' cSpotN1]);
%%%%%%%%%%%%
% area
xData11__1area_1R100 = table(vSe6ROI_1R100_um_31A_FR,vSe6ROI_1R100_um_32A_GR,vSe6ROI_1R100_um_33A_area,...
    vSe6ROI_1R100_um_34AFR_GR,vSe6ROI_1R100_um_35AGR_FR,...
    vSe6ROI_1R100_um_36AspFR_area,vSe6ROI_1R100_um_37AspGR_area,...
    'VariableNames',{'FarRed_spots','Green_spots','Detection_Area_um2',...
    'FRsp__GRsp','GRsp__FRsp','FRsp__area','GRsp__area'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__11_area_spots'];
save(x11name,'xData11__1area_1R100');
x11nameA = [x11name '.csv'];
writetable(xData11__1area_1R100,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__1area_1R100,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%
% intensity
xData11__2intensity_1R100 = table([vSe6ROI_1R100_um_41A_1FR_intensityMean;vSe6ROI_1R100_um_51A_2GR_intensityMean],...
    [vSe6ROI_1R100_um_42A_1FR_intensityMedian;vSe6ROI_1R100_um_52A_2GR_intensityMedian],...
    [vSe6ROI_1R100_um_43A_1FR_intensitySTD;vSe6ROI_1R100_um_53A_2GR_intensitySTD],...
    [vSe6ROI_1R100_um_44A_1FR_intensitySE;vSe6ROI_1R100_um_54A_2GR_intensitySE],...
    [vSe6ROI_1R100_um_45A_1FR_intensityTotalMean;vSe6ROI_1R100_um_55A_2GR_intensityTotalMean],...
    [vSe6ROI_1R100_um_46A_1FR_intensityTotalMedian;vSe6ROI_1R100_um_56A_2GR_intensityTotalMedian],...
    [vSe6ROI_1R100_um_47A_1FR_intensityTotalSTD;vSe6ROI_1R100_um_57A_2GR_intensityTotalSTD],...
    [vSe6ROI_1R100_um_48A_1FR_intensityTotalSE;vSe6ROI_1R100_um_58A_2GR_intensityTotalSE],...
    'VariableNames',{'intensityMean','intensityMedian','intensitySTD','intensitySE'...
    'intensityTotalMean','intensityTotalMedian','intensityTotalSTD','intensityTotalSE'},...
    'RowNames',{'Far-red_spots','Green_spots'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__12_intensity'];
save(x11name,'xData11__2intensity_1R100');
x11nameA = [x11name '.csv'];
writetable(xData11__2intensity_1R100,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__2intensity_1R100,x11nameA,'Delimiter','bar','WriteRowNames',true);

% number / mean / median / STD / SE
%%%%%%%%%%%%%%%%
% distance um
xData11__3distance_1R100_um = table([vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,1);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,1)],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,2);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,2)],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,3);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,3)],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,4);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,4)],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,5);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,5)],...
    'VariableNames',{'fix_number','mean_distance_um','median_distance_um',...
    'STD_distance','SE_distance'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__13_distance_all_um'];
save(x11name,'xData11__3distance_1R100_um');
x11nameA = [x11name '.csv'];
writetable(xData11__3distance_1R100_um,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__3distance_1R100_um,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%
% distance nm
xData11__3distance_1R100_nm = table([vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,1);vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,1)],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,2)*1000;vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,2)*1000],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,3)*1000;vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,3)*1000],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,4)*1000;vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,4)*1000],...
    [vSe7ND_3FRGR_1R100_um_4ApointDistance2D(:,5)*1000;vSe7ND_3GRFR_1R100_um_4ApointDistance2D(:,5)*1000],...
    'VariableNames',{'fix_number','mean_distance_nm','median_distance_nm',...
    'STD_distance','SE_distance'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__14_distance_all_nm'];
save(x11name,'xData11__3distance_1R100_nm');
x11nameA = [x11name '.csv'];
writetable(xData11__3distance_1R100_nm,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__3distance_1R100_nm,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%
% matching percentage
xData11__4matching_1R100 = table([vSe7ND_3FRGR_1R100_um_4Aunmatch(:,1);vSe7ND_3GRFR_1R100_um_4Aunmatch(:,1)],...
    [vSe7ND_3FRGR_1R100_um_4Aunmatch(:,2);vSe7ND_3GRFR_1R100_um_4Aunmatch(:,2)],...
    [vSe7ND_3FRGR_1R100_um_4Aunmatch(:,3);vSe7ND_3GRFR_1R100_um_4Aunmatch(:,3)],...
    'VariableNames',{'fix_number','mismatching_number','mismatching_percentage',...
    },...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__15_matching_MD'];
save(x11name,'xData11__4matching_1R100');
x11nameA = [x11name '.csv'];
writetable(xData11__4matching_1R100,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__4matching_1R100,x11nameA,'Delimiter','bar','WriteRowNames',true);


%%%%%%%%%%%%%%%%
% matching distance um
xData11__5Mdistance_1R100_um = table([vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,1);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,1)],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,2);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,2)],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,3);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,3)],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,4);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,4)],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,5);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,5)],...
    'VariableNames',{'fix_number','mean_distance_um','median_distance_um',...
    'STD_distance','SE_distance'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__16_matching_distance_um'];
save(x11name,'xData11__5Mdistance_1R100_um');
x11nameA = [x11name '.csv'];
writetable(xData11__5Mdistance_1R100_um,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__5Mdistance_1R100_um,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%
% matching distance nm
xData11__5Mdistance_1R100_nm = table([vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,1);vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,1)],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,2)*1000;vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,2)*1000],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,3)*1000;vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,3)*1000],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,4)*1000;vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,4)*1000],...
    [vSe7ND_3FRGR_1R100_um_6AdistanceMC(:,5)*1000;vSe7ND_3GRFR_1R100_um_6AdistanceMC(:,5)*1000],...
    'VariableNames',{'fix_number','mean_distance_nm','median_distance_nm',...
    'STD_distance','SE_distance'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__17_matching_distance_nm'];
save(x11name,'xData11__5Mdistance_1R100_nm');
x11nameA = [x11name '.csv'];
writetable(xData11__5Mdistance_1R100_nm,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__5Mdistance_1R100_nm,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
% Single cell area data
xData11__6single_1R100 = table([vSe6ROI_1R100_um_01area],...
    [vSe6ROI_1R100_um_02spFR],[vSe6ROI_1R100_um_03spGR],...
    [vSe6ROI_1R100_um_04FR_area],[vSe6ROI_1R100_um_05GR_area],...
    [vSe6ROI_1R100_um_06FR_GR],[vSe6ROI_1R100_um_07GR_FR],...
    'VariableNames',{'area_um2',...
    'FR_spots_number','GR_spots_number',...
    'FR_spots_per_area_um2','GR_spots_per_area_um2',...
    'FR_GR','GR_FR'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__18_single_cell_position_data'];
save(x11name,'xData11__6single_1R100');
x11nameA = [x11name '.csv'];
writetable(xData11__6single_1R100,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__6single_1R100,x11nameA,'Delimiter','bar','WriteRowNames',true);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Lee
% density map!
% LEE_08_M20200529_SEL_ERROR_VE1_Median_aHM_30F
% Error bar! -> combined (control and GR20)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 100%
% set zero position (nm)
x31_1FRGR_1R100_serZP_nm_1location = cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMC(:,5))*1000;
x31_1FRGR_1R100_serZP_nm_2Mean = mean(x31_1FRGR_1R100_serZP_nm_1location);
x31_1FRGR_1R100_serZP_nm_3Median = median(x31_1FRGR_1R100_serZP_nm_1location);
x31_1FRGR_1R100_serZP_nm_4STD = std(x31_1FRGR_1R100_serZP_nm_1location);
x31_1FRGR_1R100_serZP_nm_5SE = std(x31_1FRGR_1R100_serZP_nm_1location)/sqrt(length(x31_1FRGR_1R100_serZP_nm_1location));
%%%
x31_1GRFR_1R100_serZP_nm_1location = cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMC(:,5))*1000;
x31_1GRFR_1R100_serZP_nm_2Mean = mean(x31_1GRFR_1R100_serZP_nm_1location);
x31_1GRFR_1R100_serZP_nm_3Median = median(x31_1GRFR_1R100_serZP_nm_1location);
x31_1GRFR_1R100_serZP_nm_4STD = std(x31_1GRFR_1R100_serZP_nm_1location);
x31_1GRFR_1R100_serZP_nm_5SE = std(x31_1GRFR_1R100_serZP_nm_1location)/sqrt(length(x31_1GRFR_1R100_serZP_nm_1location));
%%%%%%%%%%%%%%%%%
%%%
% set zero position (um)
x31_1FRGR_1R100_serZP_um_1location = cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMC(:,5));
x31_1FRGR_1R100_serZP_um_2Mean = mean(x31_1FRGR_1R100_serZP_um_1location);
x31_1FRGR_1R100_serZP_um_3Median = median(x31_1FRGR_1R100_serZP_um_1location);
x31_1FRGR_1R100_serZP_um_4STD = std(x31_1FRGR_1R100_serZP_um_1location);
x31_1FRGR_1R100_serZP_um_5SE = std(x31_1FRGR_1R100_serZP_um_1location)/sqrt(length(x31_1FRGR_1R100_serZP_um_1location));
%%%
x31_1GRFR_1R100_serZP_um_1location = cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMC(:,5));
x31_1GRFR_1R100_serZP_um_2Mean = mean(x31_1GRFR_1R100_serZP_um_1location);
x31_1GRFR_1R100_serZP_um_3Median = median(x31_1GRFR_1R100_serZP_um_1location);
x31_1GRFR_1R100_serZP_um_4STD = std(x31_1GRFR_1R100_serZP_um_1location);
x31_1GRFR_1R100_serZP_um_5SE = std(x31_1GRFR_1R100_serZP_um_1location)/sqrt(length(x31_1GRFR_1R100_serZP_um_1location));
%%%

%%%%%%%%%%%%%%%%
% set zero position (um) by scatter_kde
x32_1FRGR_1R100_serZP_um_1location_kde = cell2mat(vSe7ND_3FRGR_1R100_um_5onlyMC(:,5));
[x32_1FRGR_1R100_1x x32_1FRGR_1R100_2y x32_1FRGR_1R100_3c] = scatter_kde(x32_1FRGR_1R100_serZP_um_1location_kde(:,1),x32_1FRGR_1R100_serZP_um_1location_kde(:,2),'filled', 'MarkerSize', 10);
close gcf;
% density <10, <15, <20 // <30
x32_1FRGR_1R100_1x_1d10 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_1d10 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_1d10 = x32_1FRGR_1R100_3c;
x32_1FRGR_1R100_1x_2d15 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_2d15 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_2d15 = x32_1FRGR_1R100_3c;
x32_1FRGR_1R100_1x_3d20 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_3d20 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_3d20 = x32_1FRGR_1R100_3c;
x32_1FRGR_1R100_1x_4d30 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_4d30 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_4d30 = x32_1FRGR_1R100_3c;
x32_1FRGR_1R100_1x_5d05 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_5d05 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_5d05 = x32_1FRGR_1R100_3c;
x32_1FRGR_1R100_1x_6d03 = x32_1FRGR_1R100_1x;
x32_1FRGR_1R100_2y_6d03 = x32_1FRGR_1R100_2y;
x32_1FRGR_1R100_3c_6d03 = x32_1FRGR_1R100_3c;
%%%%
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    if x32_1FRGR_1R100_3c(zz1,1) < 10
        x32_1FRGR_1R100_1x_1d10(zz1,:) = [];
        x32_1FRGR_1R100_2y_1d10(zz1,:) = [];
        x32_1FRGR_1R100_3c_1d10(zz1,:) = [];
    end
end
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    if x32_1FRGR_1R100_3c(zz1,1) < 15
        x32_1FRGR_1R100_1x_2d15(zz1,:) = [];
        x32_1FRGR_1R100_2y_2d15(zz1,:) = [];
        x32_1FRGR_1R100_3c_2d15(zz1,:) = [];
    end
end
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    if x32_1FRGR_1R100_3c(zz1,1) < 20
        x32_1FRGR_1R100_1x_3d20(zz1,:) = [];
        x32_1FRGR_1R100_2y_3d20(zz1,:) = [];
        x32_1FRGR_1R100_3c_3d20(zz1,:) = [];
    end
end
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    % 30 is sometimes not working -> no matrix left
    if x32_1FRGR_1R100_3c(zz1,1) < 20
        x32_1FRGR_1R100_1x_4d30(zz1,:) = [];
        x32_1FRGR_1R100_2y_4d30(zz1,:) = [];
        x32_1FRGR_1R100_3c_4d30(zz1,:) = [];
    end
end
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    if x32_1FRGR_1R100_3c(zz1,1) < 5
        x32_1FRGR_1R100_1x_5d05(zz1,:) = [];
        x32_1FRGR_1R100_2y_5d05(zz1,:) = [];
        x32_1FRGR_1R100_3c_5d05(zz1,:) = [];
    end
end
for zz1 = numel(x32_1FRGR_1R100_3c):-1:1
    if x32_1FRGR_1R100_3c(zz1,1) < 3
        x32_1FRGR_1R100_1x_6d03(zz1,:) = [];
        x32_1FRGR_1R100_2y_6d03(zz1,:) = [];
        x32_1FRGR_1R100_3c_6d03(zz1,:) = [];
    end
end
x32_1FRGR_1R100_serZP_um_1location_1d10 = [x32_1FRGR_1R100_1x_1d10,x32_1FRGR_1R100_2y_1d10];
x32_1FRGR_1R100_serZP_um_2Mean_1d10 = mean(x32_1FRGR_1R100_serZP_um_1location_1d10);
x32_1FRGR_1R100_serZP_um_3Median_1d10 = median(x32_1FRGR_1R100_serZP_um_1location_1d10);
x32_1FRGR_1R100_serZP_um_4STD_1d10 = std(x32_1FRGR_1R100_serZP_um_1location_1d10);
x32_1FRGR_1R100_serZP_um_5SE_1d10 = std(x32_1FRGR_1R100_serZP_um_1location_1d10)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_1d10));
%%%
x32_1FRGR_1R100_serZP_um_1location_2d15 = [x32_1FRGR_1R100_1x_2d15,x32_1FRGR_1R100_2y_2d15];
x32_1FRGR_1R100_serZP_um_2Mean_2d15 = mean(x32_1FRGR_1R100_serZP_um_1location_2d15);
x32_1FRGR_1R100_serZP_um_3Median_2d15 = median(x32_1FRGR_1R100_serZP_um_1location_2d15);
x32_1FRGR_1R100_serZP_um_4STD_2d15 = std(x32_1FRGR_1R100_serZP_um_1location_2d15);
x32_1FRGR_1R100_serZP_um_5SE_2d15 = std(x32_1FRGR_1R100_serZP_um_1location_2d15)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_2d15));
%%%
x32_1FRGR_1R100_serZP_um_1location_3d20 = [x32_1FRGR_1R100_1x_3d20,x32_1FRGR_1R100_2y_3d20];
x32_1FRGR_1R100_serZP_um_2Mean_3d20 = mean(x32_1FRGR_1R100_serZP_um_1location_3d20);
x32_1FRGR_1R100_serZP_um_3Median_3d20 = median(x32_1FRGR_1R100_serZP_um_1location_3d20);
x32_1FRGR_1R100_serZP_um_4STD_3d20 = std(x32_1FRGR_1R100_serZP_um_1location_3d20);
x32_1FRGR_1R100_serZP_um_5SE_3d20 = std(x32_1FRGR_1R100_serZP_um_1location_3d20)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_3d20));
%%%
x32_1FRGR_1R100_serZP_um_1location_4d30 = [x32_1FRGR_1R100_1x_4d30,x32_1FRGR_1R100_2y_4d30];
x32_1FRGR_1R100_serZP_um_2Mean_4d30 = mean(x32_1FRGR_1R100_serZP_um_1location_4d30);
x32_1FRGR_1R100_serZP_um_3Median_4d30 = median(x32_1FRGR_1R100_serZP_um_1location_4d30);
x32_1FRGR_1R100_serZP_um_4STD_4d30 = std(x32_1FRGR_1R100_serZP_um_1location_4d30);
x32_1FRGR_1R100_serZP_um_5SE_4d30 = std(x32_1FRGR_1R100_serZP_um_1location_4d30)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_4d30));
%%%
x32_1FRGR_1R100_serZP_um_1location_5d05 = [x32_1FRGR_1R100_1x_5d05,x32_1FRGR_1R100_2y_5d05];
x32_1FRGR_1R100_serZP_um_2Mean_5d05 = mean(x32_1FRGR_1R100_serZP_um_1location_5d05);
x32_1FRGR_1R100_serZP_um_3Median_5d05 = median(x32_1FRGR_1R100_serZP_um_1location_5d05);
x32_1FRGR_1R100_serZP_um_4STD_5d05 = std(x32_1FRGR_1R100_serZP_um_1location_5d05);
x32_1FRGR_1R100_serZP_um_5SE_5d05 = std(x32_1FRGR_1R100_serZP_um_1location_5d05)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_5d05));
%%%
x32_1FRGR_1R100_serZP_um_1location_6d03 = [x32_1FRGR_1R100_1x_6d03,x32_1FRGR_1R100_2y_6d03];
x32_1FRGR_1R100_serZP_um_2Mean_6d03 = mean(x32_1FRGR_1R100_serZP_um_1location_6d03);
x32_1FRGR_1R100_serZP_um_3Median_6d03 = median(x32_1FRGR_1R100_serZP_um_1location_6d03);
x32_1FRGR_1R100_serZP_um_4STD_6d03 = std(x32_1FRGR_1R100_serZP_um_1location_6d03);
x32_1FRGR_1R100_serZP_um_5SE_6d03 = std(x32_1FRGR_1R100_serZP_um_1location_6d03)/sqrt(length(x32_1FRGR_1R100_serZP_um_1location_6d03));
%%%

%%%%%%%%%
% set zero position (um) by scatter_kde
x32_1GRFR_1R100_serZP_um_1location_kde = cell2mat(vSe7ND_3GRFR_1R100_um_5onlyMC(:,5));
[x32_1GRFR_1R100_1x x32_1GRFR_1R100_2y x32_1GRFR_1R100_3c] = scatter_kde(x32_1GRFR_1R100_serZP_um_1location_kde(:,1),x32_1GRFR_1R100_serZP_um_1location_kde(:,2),'filled', 'MarkerSize', 10);
close gcf;
% density <10, <15, <20 // <30
x32_1GRFR_1R100_1x_1d10 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_1d10 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_1d10 = x32_1GRFR_1R100_3c;
x32_1GRFR_1R100_1x_2d15 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_2d15 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_2d15 = x32_1GRFR_1R100_3c;
x32_1GRFR_1R100_1x_3d20 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_3d20 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_3d20 = x32_1GRFR_1R100_3c;
x32_1GRFR_1R100_1x_4d30 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_4d30 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_4d30 = x32_1GRFR_1R100_3c;
x32_1GRFR_1R100_1x_5d05 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_5d05 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_5d05 = x32_1GRFR_1R100_3c;
x32_1GRFR_1R100_1x_6d03 = x32_1GRFR_1R100_1x;
x32_1GRFR_1R100_2y_6d03 = x32_1GRFR_1R100_2y;
x32_1GRFR_1R100_3c_6d03 = x32_1GRFR_1R100_3c;
%%%%
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 10
        x32_1GRFR_1R100_1x_1d10(zz1,:) = [];
        x32_1GRFR_1R100_2y_1d10(zz1,:) = [];
        x32_1GRFR_1R100_3c_1d10(zz1,:) = [];
    end
end
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 15
        x32_1GRFR_1R100_1x_2d15(zz1,:) = [];
        x32_1GRFR_1R100_2y_2d15(zz1,:) = [];
        x32_1GRFR_1R100_3c_2d15(zz1,:) = [];
    end
end
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 20
        x32_1GRFR_1R100_1x_3d20(zz1,:) = [];
        x32_1GRFR_1R100_2y_3d20(zz1,:) = [];
        x32_1GRFR_1R100_3c_3d20(zz1,:) = [];
    end
end
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 20
        x32_1GRFR_1R100_1x_4d30(zz1,:) = [];
        x32_1GRFR_1R100_2y_4d30(zz1,:) = [];
        x32_1GRFR_1R100_3c_4d30(zz1,:) = [];
    end
end
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 5
        x32_1GRFR_1R100_1x_5d05(zz1,:) = [];
        x32_1GRFR_1R100_2y_5d05(zz1,:) = [];
        x32_1GRFR_1R100_3c_5d05(zz1,:) = [];
    end
end
for zz1 = numel(x32_1GRFR_1R100_3c):-1:1
    if x32_1GRFR_1R100_3c(zz1,1) < 3
        x32_1GRFR_1R100_1x_6d03(zz1,:) = [];
        x32_1GRFR_1R100_2y_6d03(zz1,:) = [];
        x32_1GRFR_1R100_3c_6d03(zz1,:) = [];
    end
end
x32_1GRFR_1R100_serZP_um_1location_1d10 = [x32_1GRFR_1R100_1x_1d10,x32_1GRFR_1R100_2y_1d10];
x32_1GRFR_1R100_serZP_um_2Mean_1d10 = mean(x32_1GRFR_1R100_serZP_um_1location_1d10);
x32_1GRFR_1R100_serZP_um_3Median_1d10 = median(x32_1GRFR_1R100_serZP_um_1location_1d10);
x32_1GRFR_1R100_serZP_um_4STD_1d10 = std(x32_1GRFR_1R100_serZP_um_1location_1d10);
x32_1GRFR_1R100_serZP_um_5SE_1d10 = std(x32_1GRFR_1R100_serZP_um_1location_1d10)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_1d10));
%%%
x32_1GRFR_1R100_serZP_um_1location_2d15 = [x32_1GRFR_1R100_1x_2d15,x32_1GRFR_1R100_2y_2d15];
x32_1GRFR_1R100_serZP_um_2Mean_2d15 = mean(x32_1GRFR_1R100_serZP_um_1location_2d15);
x32_1GRFR_1R100_serZP_um_3Median_2d15 = median(x32_1GRFR_1R100_serZP_um_1location_2d15);
x32_1GRFR_1R100_serZP_um_4STD_2d15 = std(x32_1GRFR_1R100_serZP_um_1location_2d15);
x32_1GRFR_1R100_serZP_um_5SE_2d15 = std(x32_1GRFR_1R100_serZP_um_1location_2d15)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_2d15));
%%%
x32_1GRFR_1R100_serZP_um_1location_3d20 = [x32_1GRFR_1R100_1x_3d20,x32_1GRFR_1R100_2y_3d20];
x32_1GRFR_1R100_serZP_um_2Mean_3d20 = mean(x32_1GRFR_1R100_serZP_um_1location_3d20);
x32_1GRFR_1R100_serZP_um_3Median_3d20 = median(x32_1GRFR_1R100_serZP_um_1location_3d20);
x32_1GRFR_1R100_serZP_um_4STD_3d20 = std(x32_1GRFR_1R100_serZP_um_1location_3d20);
x32_1GRFR_1R100_serZP_um_5SE_3d20 = std(x32_1GRFR_1R100_serZP_um_1location_3d20)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_3d20));
%%%
x32_1GRFR_1R100_serZP_um_1location_4d30 = [x32_1GRFR_1R100_1x_4d30,x32_1GRFR_1R100_2y_4d30];
x32_1GRFR_1R100_serZP_um_2Mean_4d30 = mean(x32_1GRFR_1R100_serZP_um_1location_4d30);
x32_1GRFR_1R100_serZP_um_3Median_4d30 = median(x32_1GRFR_1R100_serZP_um_1location_4d30);
x32_1GRFR_1R100_serZP_um_4STD_4d30 = std(x32_1GRFR_1R100_serZP_um_1location_4d30);
x32_1GRFR_1R100_serZP_um_5SE_4d30 = std(x32_1GRFR_1R100_serZP_um_1location_4d30)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_4d30));
%%%
x32_1GRFR_1R100_serZP_um_1location_5d05 = [x32_1GRFR_1R100_1x_5d05,x32_1GRFR_1R100_2y_5d05];
x32_1GRFR_1R100_serZP_um_2Mean_5d05 = mean(x32_1GRFR_1R100_serZP_um_1location_5d05);
x32_1GRFR_1R100_serZP_um_3Median_5d05 = median(x32_1GRFR_1R100_serZP_um_1location_5d05);
x32_1GRFR_1R100_serZP_um_4STD_5d05 = std(x32_1GRFR_1R100_serZP_um_1location_5d05);
x32_1GRFR_1R100_serZP_um_5SE_5d05 = std(x32_1GRFR_1R100_serZP_um_1location_5d05)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_5d05));
%%%
x32_1GRFR_1R100_serZP_um_1location_6d03 = [x32_1GRFR_1R100_1x_6d03,x32_1GRFR_1R100_2y_6d03];
x32_1GRFR_1R100_serZP_um_2Mean_6d03 = mean(x32_1GRFR_1R100_serZP_um_1location_6d03);
x32_1GRFR_1R100_serZP_um_3Median_6d03 = median(x32_1GRFR_1R100_serZP_um_1location_6d03);
x32_1GRFR_1R100_serZP_um_4STD_6d03 = std(x32_1GRFR_1R100_serZP_um_1location_6d03);
x32_1GRFR_1R100_serZP_um_5SE_6d03 = std(x32_1GRFR_1R100_serZP_um_1location_6d03)/sqrt(length(x32_1GRFR_1R100_serZP_um_1location_6d03));
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Heatmap -FRGR
%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cSpotN1 = '11-Density-1R100';
eMF1 = [pwd '\' cSpotN1];
% eMF1 = [aFullPath '\' eFnameM1];
mkdir(eMF1);
%%%%%%%%%
% eFnameM2 = '18-Heatmap-varification-1IA';
% eMF2 = [aFullPath '\' eFnameM2];
% mkdir(eMF2);
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
% position nm
x31_1FRGR_GRFR_1R100_position_nm = table([x31_1FRGR_1R100_serZP_nm_2Mean(:,1);x31_1GRFR_1R100_serZP_nm_2Mean(:,1)],...
    [x31_1FRGR_1R100_serZP_nm_2Mean(:,2);x31_1GRFR_1R100_serZP_nm_2Mean(:,2)],...
    [x31_1FRGR_1R100_serZP_nm_3Median(:,1);x31_1GRFR_1R100_serZP_nm_3Median(:,1)],...
    [x31_1FRGR_1R100_serZP_nm_3Median(:,2);x31_1GRFR_1R100_serZP_nm_3Median(:,2)],...
    [x31_1FRGR_1R100_serZP_nm_4STD(:,1);x31_1GRFR_1R100_serZP_nm_4STD(:,1)],...
    [x31_1FRGR_1R100_serZP_nm_4STD(:,2);x31_1GRFR_1R100_serZP_nm_4STD(:,2)],...
    [x31_1FRGR_1R100_serZP_nm_5SE(:,1);x31_1GRFR_1R100_serZP_nm_5SE(:,1)],...
    [x31_1FRGR_1R100_serZP_nm_5SE(:,2);x31_1GRFR_1R100_serZP_nm_5SE(:,2)],...
    'VariableNames',{'x_mean_position_nm','y_mean_position_nm','x_median_position_nm','y_median_position_nm'...
    'x_STD_position','y_STD_position','x_SE_position','y_SE_position'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__11_1R100_position_nm'];
save(x11name,'x31_1FRGR_GRFR_1R100_position_nm');
x11nameA = [x11name '.csv'];
writetable(x31_1FRGR_GRFR_1R100_position_nm,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(x31_1FRGR_GRFR_1R100_position_nm,x11nameA,'Delimiter','bar','WriteRowNames',true);

%%%%%%%%%%%%%%%%%%%%%%%%
% position um
x31_1FRGR_GRFR_1R100_position_um = table([x31_1FRGR_1R100_serZP_um_2Mean(:,1);x31_1GRFR_1R100_serZP_um_2Mean(:,1)],...
    [x31_1FRGR_1R100_serZP_um_2Mean(:,2);x31_1GRFR_1R100_serZP_um_2Mean(:,2)],...
    [x31_1FRGR_1R100_serZP_um_3Median(:,1);x31_1GRFR_1R100_serZP_um_3Median(:,1)],...
    [x31_1FRGR_1R100_serZP_um_3Median(:,2);x31_1GRFR_1R100_serZP_um_3Median(:,2)],...
    [x31_1FRGR_1R100_serZP_um_4STD(:,1);x31_1GRFR_1R100_serZP_um_4STD(:,1)],...
    [x31_1FRGR_1R100_serZP_um_4STD(:,2);x31_1GRFR_1R100_serZP_um_4STD(:,2)],...
    [x31_1FRGR_1R100_serZP_um_5SE(:,1);x31_1GRFR_1R100_serZP_um_5SE(:,1)],...
    [x31_1FRGR_1R100_serZP_um_5SE(:,2);x31_1GRFR_1R100_serZP_um_5SE(:,2)],...
    'VariableNames',{'x_mean_position_um','y_mean_position_um','x_median_position_um','y_median_position_um'...
    'x_STD_position','y_STD_position','x_SE_position','y_SE_position'},...
    'RowNames',{'FR_search__GR_fix','GR_search__FR_fix'});
%%%%
x11name = [pwd '\' cSpotN1 '\' cSpotN1 '__11_1R100_position_um'];
save(x11name,'x31_1FRGR_GRFR_1R100_position_um');
x11nameA = [x11name '.csv'];
writetable(x31_1FRGR_GRFR_1R100_position_um,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(x31_1FRGR_GRFR_1R100_position_um,x11nameA,'Delimiter','bar','WriteRowNames',true);



















function d = pointDistance2D(p1, p2)
%POINTDISTANCE2D Euclidean distance between two 2D points.
    delta = p1 - p2;
    d = sqrt(sum(delta.^2, 2));
end

function ang = pointAngle2D(p1, p2)
%POINTANGLE2D Angle in degrees from p1 to p2 in the image plane.
    delta = p2 - p1;
    ang = mod(atan2d(delta(2), delta(1)), 360);
end
