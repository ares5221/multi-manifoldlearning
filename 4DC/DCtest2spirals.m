% This code checks to see that you have the required packages
% in order to test DC
% k只能设置为456对于这个双臂螺旋稀疏数据，分别分解成22,7,3块，分解成3块的精度最高
clear;
load('two_spirals.mat');
tic;
disp('Running D-C.for 2 spirals..');
d=2;k=6;
[y,sX] = DC_meng(X,d,k);
toc

X1=X(:,sX{1});
X2=X(:,sX{2});
X3=X(:,sX{3});

%画出DC分解后的分类图，将X1X2保存即可

figure;   hold on;  
hin=scatter(X1(1,:),X1(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);    hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter(X3(1,:),X3(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;


%计算分类精度
labels(sX{1})=1;
labels(sX{2})=2;
labels(sX{3})=3;

accuracy_score = accuracy(labels', true_labels)
