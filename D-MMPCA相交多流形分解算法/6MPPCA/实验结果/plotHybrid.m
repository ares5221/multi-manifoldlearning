function [ output_args ] = plotHybrid( input_args )
%PLOTHYBRID Summary of this function goes here
%   画出3.2在人造数据上各个算法的可视化结果
figure('color','w');
%%
%%%%ScurveHybrid1500
%%%K-means
subplot(3,6,1)
load Kmeans1500.mat;
open Kmeans1500.mat; 
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)
title('(a) K-means','fontsize',12);  hold on; 
legend('Cluster1','Cluster2','location','Northwest');
%%%K-manifolds
subplot(3,6,2);
load kmanifold1500.mat;
open kmanifold1500.mat;       
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)
title('(b) K-manifolds','fontsize',12);hold on; 
legend('Cluster1','Cluster2','location','Northwest');
%%%SC
subplot(3,6,3)
load SC1500.mat;
open SC1500.mat;       
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)
title('(c) Spectral Clustering','fontsize',12);hold on; 
legend('Cluster1','Cluster2','location','Northwest');
%%%DC
subplot(3,6,4);
load DC1500.mat;
open DC1500.mat;       
 hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','c');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X4(1,:),X4(2,:),X4(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','y');       hold off;
hold on;        
hin=scatter3(X5(1,:),X5(2,:),X5(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','k');       hold off;
hold on;        
hin=scatter3(X6(1,:),X6(2,:),X6(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','b');       hold off;
hold on;        
hin=scatter3(X7(1,:),X7(2,:),X7(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','g');       hold off;
view(-10,10)
title('(d) D-C','fontsize',12);hold on; 
legend({'Cluster1','Cluster2','Cluster3','Cluster4','Cluster5'} ,'FontSize',5,'location','Northwest');
%%%SMMC
subplot(3,6,5);
load SMMC1500.mat;
open SMMC1500.mat;       
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
view(-10,10)
title('(e) SMMC','fontsize',12);hold on; 
legend('Cluster1','Cluster2','location','Northwest');
%%%D-MPPCA
subplot(3,6,6);
load DMPPCA1500.mat;
open DMPPCA1500.mat;
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
view(-10,10)
title('(f) D-MPPCA','fontsize',12);hold on; 
legend('Cluster1','Cluster2','location','Northwest');

%%
%%%three-liner-planes
%%%K-means
subplot(3,6,7)
load Kmeans3PM.mat;
open Kmeans3PM.mat; 
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-55,10)
legend({'Cluster1','Cluster2','Cluster3'},'FontSize',6,'location','Northwest')
%%%kmanifolds
subplot(3,6,8);
load kmanifold3PM.mat;
open kmanifold3PM.mat; 
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-55,10)
legend({'Cluster1','Cluster2','Cluster3'},'FontSize',6,'location','Northwest')
%%%SC
subplot(3,6,9)
load SC3PM.mat;
open SC3PM.mat; 
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)
legend({'Cluster1','Cluster2','Cluster3'} ,'FontSize',6,'location','Northwest')
%%%DC
subplot(3,6,10);
load DC3PM.mat;
open DC3PM.mat; 
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','c');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X4(1,:),X4(2,:),X4(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','y');       hold off;
hold on;        
hin=scatter3(X5(1,:),X5(2,:),X5(3,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor','k');       hold off;
view(115,5)
legend({'Cluster1','Cluster2','Cluster3','Cluster4','Cluster5'},'FontSize',5,'location','Northwest')
%%%SMMC
subplot(3,6,11);
load SMMC3PM.mat;
open SMMC3PM.mat;
 hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)
legend({'Cluster1','Cluster2','Cluster3'},'FontSize',6,'location','Northwest')
%%%D-MPPCA
subplot(3,6,12)
load DMPPCA3PM.mat;
open DMPPCA3PM.mat;
hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)
legend({'Cluster1','Cluster2','Cluster3'},'FontSize',6,'location','Northwest')

%%
%%%%two-sprits
%%%K-means
subplot(3,6,13)
load kmeans2S.mat;
open kmeans2S.mat;
 hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
%%%kmanifold
subplot(3,6,14)
load kmanifold2S.mat;
open kmanifold2S.mat;
 hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
%%%SC
subplot(3,6,15)
load SC2S.mat;
open SC2S.mat;
 hold on;  
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
%%%DC
subplot(3,6,16)
load DC2S.mat;
open DC2S.mat;
 hold on;  
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
hold on;   
hin=scatter(X3(1,:),X3(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
legend({'Cluster1','Cluster2','Cluster3'},'FontSize',6,'location','Northwest')
%%%SMMC
subplot(3,6,17)
load SMMC2S.mat;
open SMMC2S.mat;
 hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
%%%DMPPCA
subplot(3,6,18)
load DMPPCA2S.mat;
open DMPPCA2S.mat;
 hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
legend('Cluster1','Cluster2','location','Northwest');
end

