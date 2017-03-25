% This code checks to see that you have the required packages
% in order to run DMPPCA 螺旋线
% 该算法对这种采样稀疏流形的效果有点不太好，在调参数的时候M适应的要减小，分的块少了也就准了点
% 另外对于扩展的思路，对于这种稀疏的流形要从密度最小的地方也就是螺旋线的角开始扩展不能从中心开始扩展否则结果也不理想
clear;
load( 'two_spirals.mat');

disp('Running DMPPCA in two_spirals...')
ppca_dim=1;
maxAngle=20;
r=0.5;
ncentres=10;
knn=7;
power=15;
crossTan=10;
tic;
[newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan);
 toc
%画出扩展后的结果
figure; 
X1=X(:,newsX{1});
X2=X(:,newsX{2});
hold on;        
hin=scatter(X1(1,:),X1(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
% hin=scatter3(X3(1,:),X3(2,:),X3(3,:),15,'filled'); 
% set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
% view(-60,10)

%计算分类精度
labels(newsX{1})=1;
labels(newsX{2})=2;

  accuracy_score = accuracy(labels', true_labels)



