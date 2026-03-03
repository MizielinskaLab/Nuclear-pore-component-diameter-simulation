function sim_comparison_04gcLBB_jet_Lo3_GF3(zzz_data,zzz_folder,zzz_name,zzz,xxxn1,xxxn2,xxxn3,xxxs,zzz_import)
%%%%%%%%%%%%%%%%%%%%%%%%%
% data: zzz_data
% subfolder: zzz_folder
% nametag: zzz_name
% order: zzz
% naming
% xxxn1 = '4DP020';
% xxxn2 = '1FRserGRfix';
% zzzx3 = 50;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xy_name1 = zzz_data{zzz,1}{1,2};
xy_image_1raw =  strrep(xy_name1,'_wMean_bMedian_onlyImage_SD000.mat','_nobar.tif');
xy_name2 = zzz_data{zzz,2}{1,2};
xy_image_2sim =  strrep(xy_name2,'_wMean_bMedian_onlyImage_SD000.mat','_nobar.tif');
xy_image_3locn = ['21-Heatmap_Densioty\21-Heatmap_Densioty__' xxxn3 '_' xxxn2 '_HeatMap_' xxxn1 '_heatmap_densityplot_line_wMean_bMedian_onlyImage_SD000.mat'];
xy_image_3loc =  strrep(xy_name2,xy_image_3locn,'001-scatter-all.tif');
xy_image_4SSIM_nS = zzz_data{zzz,3};
xy_image_5SSIM_S = zzz_data{zzz,3};
xy_image_6n_exp = zzz_data{zzz,6};
xy_image_7n_sim = zzz_data{zzz,7};
%%%%%%%%%%%%
% xy_name12 = zzz_data{zzz,10};
% xy_name13 = zzz_data{zzz,11};
%%%%%%%%%%%%%%%%
% import data
xz_Location = zzz_import;
xz1 = importdata(xz_Location);
xz2_1FR = xz1.s_1FR_9inshp_um;
xz2_2GR = xz1.s_2GR_9inshp_um;
%%%%%
s_1FR_1diameter = xz1.s_1FR_1diameter;
s_1FR_2hallow = xz1.s_1FR_2hallow;
%%%%%
s_2GR_1diameter = xz1.s_2GR_1diameter;
s_2GR_2hallow = xz1.s_2GR_2hallow;
%%%%%%%%
% Table 1
xy_table_01E =  zzz_data{zzz,1}{1,3};
xy_table_02S =  zzz_data{zzz,2}{1,3};
xy_table_01E.Properties.RowNames = {'Exp_FR_search__GR_fix','Exp_GR_search__FR_fix'};
xy_table_02S.Properties.RowNames = {'Sim_FR_search__GR_fix','Sim_GR_search__FR_fix'};
xy_table_03All = [xy_table_01E;xy_table_02S];
%%%%%
x11name = fullfile(pwd, zzz_folder, [zzz_name '__2table_all']);
save(x11name,'xy_table_03All');
x11nameA = [x11name '.csv'];
writetable(xy_table_03All,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xy_table_03All,x11nameA,'Delimiter','bar','WriteRowNames',true);
%%%%%%%%%%%%%%%%%%
% Table 2 - Location
xy_table_11E =  cell2table({zzz_data{zzz,1}{1,2}});
x11nameA = [x11name '__1Exp_location.txt'];
writetable(xy_table_11E,x11nameA,'Delimiter','bar','WriteRowNames',true);
xy_table_12S =  cell2table({zzz_data{zzz,2}{1,2}});
x11nameA = [x11name '__2Sim_location.txt'];
writetable(xy_table_12S,x11nameA,'Delimiter','bar','WriteRowNames',true);
%%%%%%%%%%%%%%%%%%%%
% Table 2
xy_table_21E = table(zzz_data{zzz,12},zzz_data{zzz,13},...
    zzz_data{zzz,14},zzz_data{zzz,15},...
    zzz_data{zzz,16},...
    'VariableNames',{'SSIM','Ratio_mean','Ratio_median','Ratio_SD','SSIM_mean'},...
    'RowNames',{'SIM/EXP'});
%%%%%
x11name = fullfile(pwd, zzz_folder, [zzz_name '__2table_all_SSIM']);
save(x11name,'xy_table_21E');
x11nameA = [x11name '.csv'];
writetable(xy_table_21E,x11nameA,'WriteRowNames',true);
x11nameA = [x11name '.txt'];
writetable(xy_table_21E,x11nameA,'Delimiter','bar','WriteRowNames',true);


% set(gcf,'visible','on')

%%%%%%%%%%%%%%
% bar size
p21bar = 10001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'units','centimeters','position',[0.2 1.5 45 25],'OuterPosition',[0.2 1.5 45 25])
%%%%
subplot(2,3,1,'position',[0.04 0.60 0.36 0.36])
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
text(.5,1,['Experiemnts  I_G_R / I_F_R   n: ',num2str(xy_image_6n_exp)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%           
subplot(2,3,2,'position',[0.29 0.60 0.36 0.36])
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'}) 
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
text(.5,1,['Simulation  I_G_R / I_F_R   SSIM: ',num2str(xy_image_4SSIM_nS),'  n: ' num2str(xy_image_7n_sim)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,3,'position',[0.51 0.60 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
%%%
text(.5,1,['Simulation  I_F_R and I_G_R'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,4,'position',[0.04 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
text(.5,1,['Experiemnts   I_G_R / I_F_R'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,5,'position',[0.29 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
text(.5,1,['Simulation  I_G_R / I_F_R   SSIM: ',num2str(xy_image_5SSIM_S)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')     
%%%%%%%%%%%
subplot(2,3,6,'position',[0.51 0.18 0.36 0.36])           
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% FR diameter and hollow
npc_viscircles([0 0],s_1FR_1diameter/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_1FR_2hallow/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% GR diamter and hollow
npc_viscircles([0 0],s_2GR_1diameter/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_2GR_2hallow/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% FG and GR centre diamter
npc_viscircles([0 0],(s_1FR_1diameter+s_1FR_2hallow)/2/1000/2,'Color','magenta','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],(s_2GR_1diameter+s_2GR_2hallow)/2/1000/2,'Color','green','LineStyle','-','Linewidth',2)
text(.5,1,['I_F_R : D' num2str(s_1FR_1diameter) 'H' num2str(s_1FR_2hallow) ' CD' num2str((s_1FR_1diameter+s_1FR_2hallow)/2) 'nm'...
                '   I_G_R : D' num2str(s_2GR_1diameter) 'H' num2str(s_2GR_2hallow) ' CD' num2str((s_2GR_1diameter+s_2GR_2hallow)/2) 'nm'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')         
%%%%%%%%%%%%%%%%%%%%%%%%%            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% Save file
set(gcf, 'paperpositionmode', 'auto');
eF4name2 = fullfile(pwd, zzz_folder, [zzz_name '__1densitymap']);
% export_fig(eF4name2,'-tiff','-m5');
% print(gcf,'-dtiff','-r300',eF4name2)
npc_save_figure(gcf, [eF4name2 '.tif'], 300);
close gcf;

%%%%%%%%%%%%%%%%%%%%%%%%%
% save data
Fm1name = fullfile(pwd, zzz_folder, [zzz_name '__1densitymap_1FR_RAW_xy_um']);
Fm2name = [Fm1name '.xls'];
writematrix(xz2_1FR,Fm2name,'Sheet',1);
writematrix(xz2_1FR,Fm1name,'Delimiter','bar');
% save data
Fm1name = fullfile(pwd, zzz_folder, [zzz_name '__1densitymap_2GR_RAW_xy_um']);
Fm2name = [Fm1name '.xls'];
writematrix(xz2_2GR,Fm2name,'Sheet',1);
writematrix(xz2_2GR,Fm1name,'Delimiter','bar');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% added raw localisation data save (um)
% xz2_1FR = xz1.s_1FR_9inshp_um;
% xz2_2GR = xz1.s_2GR_9inshp_um;
xz2_1FR_1radius = sqrt(xz2_1FR(:,1).^2 + xz2_1FR(:,2).^2);
xz2_1FR_2diamter = 2*xz2_1FR_1radius;
xz2_1FR_3mean_1radius = mean(xz2_1FR_1radius);
xz2_1FR_3mean_2diameter = mean(xz2_1FR_2diamter);
xz2_1FR_4median_1radius = median(xz2_1FR_1radius);
xz2_1FR_4median_2diameter = median(xz2_1FR_2diamter);
xz2_1FR_5std_1radius = std(xz2_1FR_1radius);
xz2_1FR_5std_2diameter = std(xz2_1FR_2diamter);
xz2_1FR_6se_1radius = xz2_1FR_5std_1radius / sqrt(length(xz2_1FR_1radius));
xz2_1FR_6se_2diameter = xz2_1FR_5std_2diameter / sqrt(length(xz2_1FR_2diamter));
%%%%%%%%%%
xz2_2GR_1radius = sqrt(xz2_2GR(:,1).^2 + xz2_2GR(:,2).^2);
xz2_2GR_2diamter = 2*xz2_2GR_1radius;
xz2_2GR_3mean_1radius = mean(xz2_2GR_1radius);
xz2_2GR_3mean_2diameter = mean(xz2_2GR_2diamter);
xz2_2GR_4median_1radius = median(xz2_2GR_1radius);
xz2_2GR_4median_2diameter = median(xz2_2GR_2diamter);
xz2_2GR_5std_1radius = std(xz2_2GR_1radius);
xz2_2GR_5std_2diameter = std(xz2_2GR_2diamter);
xz2_2GR_6se_1radius = xz2_2GR_5std_1radius / sqrt(length(xz2_2GR_1radius));
xz2_2GR_6se_2diameter = xz2_2GR_5std_2diameter / sqrt(length(xz2_2GR_2diamter));
%%%%%%%%%%%%%%%%%%%%%%%%%
% save data
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_1FR_RAW_xy_um_1radius'];
Fm2name = [Fm1name '.xls'];
writematrix(xz2_1FR_1radius,Fm2name,'Sheet',1);
writematrix(xz2_1FR_1radius,Fm1name,'Delimiter','bar');
%%%%
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_1FR_RAW_xy_um_2diamter'];
Fm2name = [Fm1name '.xls'];
writematrix(xz2_1FR_2diamter,Fm2name,'Sheet',1);
writematrix(xz2_1FR_2diamter,Fm1name,'Delimiter','bar');
%%%%
% Create table
xz2_1FR_7table = table(...
    xz2_1FR_3mean_1radius, ...
    xz2_1FR_3mean_2diameter, ...
    xz2_1FR_4median_1radius, ...
    xz2_1FR_4median_2diameter, ...
    xz2_1FR_5std_1radius, ...
    xz2_1FR_5std_2diameter, ...
    xz2_1FR_6se_1radius, ...
    xz2_1FR_6se_2diameter, ...
    'VariableNames', {...
        'Mean_Radius', ...
        'Mean_Diameter', ...
        'Median_Radius', ...
        'Median_Diameter', ...
        'Std_Radius', ...
        'Std_Diameter', ...
        'SE_Radius', ...
        'SE_Diameter'});
% Display the table
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_1FR_RAW_xy_um_7table'];
Fm2name = [Fm1name '.xls'];
writetable(xz2_1FR_7table,Fm2name,'Sheet',1);
writetable(xz2_1FR_7table,Fm1name,'Delimiter','bar');
%%%%%%%%%%%%%%%%%%%%%%%%%
% save data
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_2GR_RAW_xy_um_1radius'];
Fm2name = [Fm1name '.xls'];
writematrix(xz2_2GR_1radius,Fm2name,'Sheet',1);
writematrix(xz2_2GR_1radius,Fm1name,'Delimiter','bar');
%%%%
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_2GR_RAW_xy_um_2diamter'];
Fm2name = [Fm1name '.xls'];
writematrix(xz2_2GR_2diamter,Fm2name,'Sheet',1);
writematrix(xz2_2GR_2diamter,Fm1name,'Delimiter','bar');
%%%%
% Create table
xz2_2GR_7table = table(...
    xz2_2GR_3mean_1radius, ...
    xz2_2GR_3mean_2diameter, ...
    xz2_2GR_4median_1radius, ...
    xz2_2GR_4median_2diameter, ...
    xz2_2GR_5std_1radius, ...
    xz2_2GR_5std_2diameter, ...
    xz2_2GR_6se_1radius, ...
    xz2_2GR_6se_2diameter, ...
    'VariableNames', {...
        'Mean_Radius', ...
        'Mean_Diameter', ...
        'Median_Radius', ...
        'Median_Diameter', ...
        'Std_Radius', ...
        'Std_Diameter', ...
        'SE_Radius', ...
        'SE_Diameter'});
% Display the table
Fm1name = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_2GR_RAW_xy_um_7table'];
Fm2name = [Fm1name '.xls'];
writetable(xz2_2GR_7table,Fm2name,'Sheet',1);
writetable(xz2_2GR_7table,Fm1name,'Delimiter','bar');






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'units','centimeters','position',[0.2 1.5 45 25],'OuterPosition',[0.2 1.5 45 25])
%%%%
%%%%
subplot(2,3,1,'position',[0.04 0.60 0.36 0.36])
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
%%%%
subplot(2,3,2,'position',[0.29 0.60 0.36 0.36]) 
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'}) 
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
%%%%
subplot(2,3,3,'position',[0.51 0.60 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
%%%%
subplot(2,3,4,'position',[0.04 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
%%%%
subplot(2,3,5,'position',[0.29 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})   
%%%%
subplot(2,3,6,'position',[0.51 0.18 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% FR diameter and hollow
npc_viscircles([0 0],s_1FR_1diameter/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_1FR_2hallow/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% GR diamter and hollow
npc_viscircles([0 0],s_2GR_1diameter/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_2GR_2hallow/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% FG and GR centre diamter
npc_viscircles([0 0],(s_1FR_1diameter+s_1FR_2hallow)/2/1000/2,'Color','magenta','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],(s_2GR_1diameter+s_2GR_2hallow)/2/1000/2,'Color','green','LineStyle','-','Linewidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% Save file
set(gcf, 'paperpositionmode', 'auto');
eF4name2 = fullfile(pwd, zzz_folder, [zzz_name '__1densitymap_notext']);
% export_fig(eF4name2,'-tiff','-m5');
% print(gcf,'-dtiff','-r300',eF4name2)
npc_save_figure(gcf, [eF4name2 '.tif'], 300);
close gcf;

%%%%%%%%%%%%%%%%%%%%%%%%
%%%% added

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% densityheatmap2
% xz2_1FR_3mean_1radius
% xz2_2GR_3mean_1radius
%%%%%%%%%%%%%%
% bar size
p21bar = 10001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'units','centimeters','position',[0.2 1.5 45 25],'OuterPosition',[0.2 1.5 45 25])
%%%%
subplot(2,3,1,'position',[0.04 0.60 0.36 0.36])
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
text(.5,1,['Experiemnts  I_G_R / I_F_R   n: ',num2str(xy_image_6n_exp)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%           
subplot(2,3,2,'position',[0.29 0.60 0.36 0.36])
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'}) 
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
text(.5,1,['Simulation  I_G_R / I_F_R   SSIM: ',num2str(xy_image_4SSIM_nS),'  n: ' num2str(xy_image_7n_sim)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,3,'position',[0.51 0.60 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
%%%
text(.5,1,['Simulation  I_F_R and I_G_R'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,4,'position',[0.04 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
text(.5,1,['Experiemnts   I_G_R / I_F_R'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')
%%%%
subplot(2,3,5,'position',[0.29 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
text(.5,1,['Simulation  I_G_R / I_F_R   SSIM: ',num2str(xy_image_5SSIM_S)],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')     
%%%%%%%%%%%
subplot(2,3,6,'position',[0.51 0.18 0.36 0.36])           
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% FR diameter and hollow
npc_viscircles([0 0],s_1FR_1diameter/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_1FR_2hallow/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% GR diamter and hollow
npc_viscircles([0 0],s_2GR_1diameter/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_2GR_2hallow/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% FG and GR centre diamter
% npc_viscircles([0 0],(s_1FR_1diameter+s_1FR_2hallow)/2/1000/2,'Color','magenta','LineStyle','-','Linewidth',2)
% npc_viscircles([0 0],(s_2GR_1diameter+s_2GR_2hallow)/2/1000/2,'Color','green','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],xz2_1FR_3mean_1radius,'Color','magenta','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],xz2_2GR_3mean_1radius,'Color','green','LineStyle','-','Linewidth',2)
text(.5,1,['I_F_R : D' num2str(s_1FR_1diameter) 'H' num2str(s_1FR_2hallow) ' CD' num2str((s_1FR_1diameter+s_1FR_2hallow)/2) 'nm'...
                '   I_G_R : D' num2str(s_2GR_1diameter) 'H' num2str(s_2GR_2hallow) ' CD' num2str((s_2GR_1diameter+s_2GR_2hallow)/2) 'nm'],...
                'horiz','center',...
                'vert','bottom',...
                'units','normalized')         
%%%%%%%%%%%%%%%%%%%%%%%%%            

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% Save file
set(gcf, 'paperpositionmode', 'auto');
eF4name2 = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_raw_data'];
% export_fig(eF4name2,'-tiff','-m5');
% print(gcf,'-dtiff','-r300',eF4name2)
npc_save_figure(gcf, [eF4name2 '.tif'], 300);
close gcf;







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf,'units','centimeters','position',[0.2 1.5 45 25],'OuterPosition',[0.2 1.5 45 25])
%%%%
%%%%
subplot(2,3,1,'position',[0.04 0.60 0.36 0.36])
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
%%%%
subplot(2,3,2,'position',[0.29 0.60 0.36 0.36]) 
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'}) 
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
hold on;
%%%%
subplot(2,3,3,'position',[0.51 0.60 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% nulcear pore diameter (120nm)
npc_viscircles([0 0],0.06,'Color','r','LineStyle',':')
% nuclear basket (50nm)
% npc_viscircles([0 0],0.025,'Color','b','LineStyle',':')
%%%%
subplot(2,3,4,'position',[0.04 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,1}{1,1}{1,1},zzz_data{zzz,1}{1,1}{1,2},zzz_data{zzz,1}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})
%%%%
subplot(2,3,5,'position',[0.29 0.18 0.36 0.36])      
pcolor(zzz_data{zzz,2}{1,1}{1,1},zzz_data{zzz,2}{1,1}{1,2},zzz_data{zzz,2}{1,1}{1,3})
shading interp; set(gca,'Color','[0 0 0.504]')
colormap(jet(p21bar-1))
axis square
set(gca,'XTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'XTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'YTick',[-0.1:0.1:0.1],'FontSize',15)
% set(gca,'YTicklabels',{-0.1,0,0.1},'FontSize',15)
set(gca,'XLim',[-0.1 0.1])
set(gca,'YLim',[-0.1 0.1])
% colorbar
colorbar('Ticks',[0],'TickLabels',{})
% colorbar('Ticks',[0,1000],'TickLabels',{'L','H'})   
%%%%
subplot(2,3,6,'position',[0.51 0.18 0.36 0.36])
scatter(xz2_1FR(:,1),xz2_1FR(:,2),2.5,'magenta','filled')
hold on;
scatter(xz2_2GR(:,1),xz2_2GR(:,2),3,'Green')
hold on;
axis square
%%%%%%%%%%%%%
mXS1=-0.1;mXS2=0.1;mXS3=0.1;
%%%%%
set(gca,'XMinorGrid','off','XMinorTick','off','YMinorGrid','off','YMinorTick','off')
set(gca,'XTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'XLim',[mXS1 mXS3])
set(gca,'YTick',mXS1:mXS2:mXS3,'FontSize',16)
set(gca,'YLim',[mXS1 mXS3])
% set(gcf,'units','centimeters','position',[1 1 29 25],'paperposition',[0 0 24 24]);
% set(gca,'units','centimeters','position',[3 2.5 21.5 21.5]);
% set(gcf, 'paperpositionmode', 'auto');
set(gca,'Color','k')
% set(gca,'defaultfigurecolor',[0.2 0.2 0.2])
% line
line([-5 5],[0 0],'Color','yellow','linewidth',2,'linestyle',':');
line([0 0],[-5 5],'Color','yellow','linewidth',2,'linestyle',':');
% FR diameter and hollow
npc_viscircles([0 0],s_1FR_1diameter/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_1FR_2hallow/1000/2,'Color','magenta','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% GR diamter and hollow
npc_viscircles([0 0],s_2GR_1diameter/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
npc_viscircles([0 0],s_2GR_2hallow/1000/2,'Color','green','LineStyle','--','Linewidth',0.6,'DrawBackgroundCircle',false)
% FG and GR centre diamter
% npc_viscircles([0 0],(s_1FR_1diameter+s_1FR_2hallow)/2/1000/2,'Color','magenta','LineStyle','-','Linewidth',2)
% npc_viscircles([0 0],(s_2GR_1diameter+s_2GR_2hallow)/2/1000/2,'Color','green','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],xz2_1FR_3mean_1radius,'Color','magenta','LineStyle','-','Linewidth',2)
npc_viscircles([0 0],xz2_2GR_3mean_1radius,'Color','green','LineStyle','-','Linewidth',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
% Save file
set(gcf, 'paperpositionmode', 'auto');
eF4name2 = [pwd '\' zzz_folder '\' zzz_name '__1densitymap_notext_raw_data'];
% export_fig(eF4name2,'-tiff','-m5');
% print(gcf,'-dtiff','-r300',eF4name2)
npc_save_figure(gcf, [eF4name2 '.tif'], 300);
close gcf;






end
