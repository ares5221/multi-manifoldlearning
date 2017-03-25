function [ output_args ] = testKmeans( input_args )
%   kmanifolds测试three liner plant
clear;
addpath ('C:\Program Files\MATLAB\R2011b\toolbox\netlab3_3');
fprintf('Checking for IsomapII...');
isoCheck = exist('L2_distance') & exist('dijkstra');
if (isoCheck)
   fprintf(' OK\n');
else
   error('Isomap not correctly installed');
end

fprintf('Checking for Netlab...');
netCheck = exist('rbftrain');
if (netCheck)
   fprintf(' OK\n');
else
   error('Netlab not correctly installed');
end

disp('Constructing spiral example...');

load('three_linear_planes.mat');
%运行kmanifolds对X分类，得到的IDX就是分类结果
%如果运行时出现Data dimension does not match dimension of centres报错，关闭matlab重新打开即可
disp('Running k-Manifolds...')
tic;
[idx,assn] = kmanifolds(X, [3 3 3]);
toc

X1=X(:,idx{1});
X2=X(:,idx{2});
X3=X(:,idx{3});

%画出kmanifolds分解后的分类图，将X1X2X3保存即可

figure;      hold on;        
hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
view(-60,10)

%计算分类精度nmi.m accuracy.m hungarian.m
labels(idx{1})=1;
labels(idx{2})=2;
labels(idx{3})=3;
%   nmi_score = nmi(labels', true_labels)
  accuracy_score = accuracy(labels', true_labels)
  
end

