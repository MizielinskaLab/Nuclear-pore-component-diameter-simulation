function Twocolour_NPCSimulation(sData,Snuma)
validate_required_dependencies(false);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2021/08/09
%%%%%%%%%%%%%%
% Simulation between nup50 and nup98
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%
beep off; 
% warning off;  % disabled for public/review use
% Stop exponential answers
format long g
% Figure hide
% set(0,'DefaultFigureVisible','off');
% set(gcf,'visible','on')

% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Time measure
% % ttt1 = datetime('now');
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%
% import data
%%%%%%%%%%%%%%%%%%%%%
load(cell2mat(sData));
%%%%%%%%%%%%%%%%%%%%%
% aax1=aax5(:,1);
% aay1=aax5(:,2);
% aax2=aax5(:,3);
% aay2=aax5(:,4);
% %%%%%%%%%%%%%%%%%%%
Snum_str = num2str(Snuma,'%03.0f');
s_1FR_1diameter_str = num2str(s_1FR_1diameter,'%03.0f');
s_1FR_2hallow_str = num2str(s_1FR_2hallow,'%03.0f');
s_2GR_1diameter_str = num2str(s_2GR_1diameter,'%03.0f');
s_2GR_2hallow_str = num2str(s_2GR_2hallow,'%03.0f');
s_ramSize_str = num2str(ramSize,'%04.0f');

%%%%%%%%%%%
% save location
eF4nameM1 = ['02_SIM_rand___1FR_D'  s_1FR_1diameter_str 'H' s_1FR_2hallow_str ...
    '_2GR_D'  s_2GR_1diameter_str  'H' s_2GR_2hallow_str '_RS' s_ramSize_str];
mkdir(eF4nameM1)
cSave = eF4nameM1;
%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%
% scatter
%%%%%%%%%%%%%%%%%%%%%%
scatter(s_1FR_9inshp_um(:,1),s_1FR_9inshp_um(:,2),12,'magenta','filled')
hold on;
scatter(s_2GR_9inshp_um(:,1),s_2GR_9inshp_um(:,2),14,'Green')
hold on;
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',40)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',40)
set(gca,'YLim',[mXS1 mXS3])
set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
viscircles([0 0],0.025,'Color','b','LineStyle',':')
%%%%%%%%%
% Save file
% set(gcf, 'paperpositionmode', 'auto');
eF4name2 = [eF4nameM1 '\001-scatter-all'];
% export_fig(eF4name2,'-tiff','-m5');
% print(gcf,'-dtiff','-r300',eF4name2)
export_fig(eF4name2,'-tiff','-m5','-transparent');
%%%%%%%%%%%%%
mXS1=-0.2;mXS2=0.1;mXS3=0.2;
%%%%%
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',40)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',40)
set(gca,'YLim',[mXS1 mXS3])
export_fig([eF4name2 '_200nm'],'-tiff','-m5','-transparent');
close gcf;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% location pairing 
%%%%%%%%%%%%%%%%%%%
% FR
t_1FR_1position=s_1FR_9inshp_um;
% GR
t_2GR_1position=s_2GR_9inshp_um;
%%%%%%%%%%%%%%%%%%%
t_3FR_1position_all = [];
for tt2 = 1:length(t_2GR_1position)
    t_3FR_1position_all = [t_3FR_1position_all; t_1FR_1position];
end
t_4GR_1position_all = [];
for tt2 = 1:length(t_2GR_1position)
    tt3 = t_2GR_1position(tt2,:);
    tt4 = repmat(tt3,[length(t_1FR_1position),1]);
    t_4GR_1position_all = [t_4GR_1position_all; tt4];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dArea = 0.12;
%%%%%%%%%%%%%%%%%%%%%%
% cell
vSe7ND_1FR_1R100_um_1D = {t_3FR_1position_all};
vSe7ND_2GR_1R100_um_1D = {t_4GR_1position_all};
%%%%%%%%%%%%%%%%%%
% 100% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
% for vv=1:numel(vSe7ND_1FR_1R100_um_1D)
%     [vSe7ND_3FRGR_1R100_um_2Rplace{vv,1},vSe7ND_3FRGR_1R100_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_1FR_1R100_um_1D{vv,1},vSe7ND_2GR_1R100_um_1D{vv,1},'k',1,'Distance','minkowski');
% end

%%%%%%%%%%%%%%%%%%%%%%
% No need for nearest position
vSe7ND_3FRGR_1R100_um_2Rplace{1,1} =  [1:length(t_3FR_1position_all)]';

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

%%%%%%%%%%%%%%%%%%%%%%%%%
% GR/FR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% 100% area
%%%%%%%%%%%%%%%%
% FR/GR nearest -> GR fixed / FR changable position
% for vv=1:numel(vSe7ND_2GR_1R100_um_1D)
%     [vSe7ND_3GRFR_1R100_um_2Rplace{vv,1},vSe7ND_3GRFR_1R100_um_2Rdistance{vv,1}] = knnsearch(vSe7ND_2GR_1R100_um_1D{vv,1},vSe7ND_1FR_1R100_um_1D{vv,1},'k',1,'Distance','minkowski');
% end

%%%%%%%%%%%%%%%%%%%%%%
% No need for nearest position
vSe7ND_3GRFR_1R100_um_2Rplace{1,1} =  [1:length(t_4GR_1position_all)]';

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
% 100
%%%%%%%%%%%%%%%%%%%%%%
% Table save
cSpotN1 = '11-Table';
%%%%%%%%%%%%
mkdir([pwd '\' cSave '\' cSpotN1]);
%%%%%%%%%%%%
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__13_distance_all_um'];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__14_distance_all_nm'];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__15_matching_MD'];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__16_matching_distance_um'];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__17_matching_distance_nm'];
save(x11name,'xData11__5Mdistance_1R100_nm');
x11nameA = [x11name '.csv'];
writetable(xData11__5Mdistance_1R100_nm,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xData11__5Mdistance_1R100_nm,x11nameA,'Delimiter','bar','WriteRowNames',true);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time measure
ttt2 = datetime('now');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2021/07/23
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Heatmap -FRGR
%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cSpotN1 = '12-Density';
eMF1 = [pwd '\' cSave '\' cSpotN1];
% eMF1 = [aFullPath '\' cSave '\' eFnameM1];
mkdir(eMF1);
%%%%%%%%%
% eFnameM2 = '18-Heatmap-varification-1IA';
% eMF2 = [aFullPath '\' cSave '\' eFnameM2];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__11_position_nm'];
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
x11name = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__11_position_um'];
save(x11name,'x31_1FRGR_GRFR_1R100_position_um');
x11nameA = [x11name '.csv'];
writetable(x31_1FRGR_GRFR_1R100_position_um,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(x31_1FRGR_GRFR_1R100_position_um,x11nameA,'Delimiter','bar','WriteRowNames',true);


% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Time measure
% % ttt3 = datetime('now');
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%


% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % number of plot
% % eOP = char('31_1FRserGRfix');
% % % density
% % % map_DP = 50;
% % % location
% % eF4nameM1 = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__' eOP '_HeatMap'];
% % % window size
% % mXS1=-0.1;mXS2=0.1;mXS3=0.1;
% % %mXS1=-200;mXS2=100;mXS3=200;
% % % save data
% % heatmaplee1_IMM3_noKDE6ndpNO(x31_1FRGR_1R100_serZP_um_1location,eF4nameM1,mXS1,mXS2,mXS3);
% % eOP = char('32_1GRserFRfix');
% % eF4nameM1 = [pwd '\' cSave '\' cSpotN1 '\' cSpotN1 '__' eOP '_HeatMap'];
% % heatmaplee1_IMM3_noKDE6ndpNO(x31_1GRFR_1R100_serZP_um_1location,eF4nameM1,mXS1,mXS2,mXS3);
% % 
% % 


% % %%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Save Data
% % F10name = [pwd '\' cSave '\99_all_data'];
% % save(F10name)





% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Time measure
% % ttt4 = datetime('now');
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % Time measure
% % ttt5 = datetime('now');
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % % working time
% % tt6d12 = ttt2 - ttt1;
% % tt6d23 = ttt3 - ttt2;
% % tt6d34 = ttt4 - ttt3;
% % tt6d45 = ttt5 - ttt4;
% % tt6dAll = ttt5 - ttt1;
% % tt12 = tt6d12 + tt6d23;
% % tt123 = tt12 + tt6d34;
% % 
% % tt71 = [ttt1; ttt2; ttt3; ttt4; ttt5];
% % tt72 = [0; tt6d12; tt6d23; tt6d34; tt6d45];
% % tt73 = [0; tt6d12; tt12; tt123; tt6dAll];
% % 
% % Differece = tt72;
% % Cumulative = tt73;
% % Data = {string(ttt1);string(ttt2);string(ttt3);string(ttt4);string(ttt5)};
% % tTable = table(Data,Differece,Cumulative);
% % 
% % % export excel data and table 
% % F12name = [pwd '\' cSave '\00_working_time'];
% % writetable(tTable,F12name,'Delimiter','\t','WriteRowNames',true)


end

    

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
