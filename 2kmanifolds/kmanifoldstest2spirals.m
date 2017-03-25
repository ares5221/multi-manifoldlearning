% This code checks to see that you have the required packages
% in order to run kmanifolds
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

load('two_spirals.mat');
P=X;
disp('Running k-Manifolds...')
tic;
[idx,assn] = kmanifolds(P, [1 1]);
toc

X1=X(:,idx{1});
X2=X(:,idx{2});
%画出kmanifolds分解后的分类图，将X1X2保存即可

figure;  hold on;        
hin=scatter(X1(1,:),X1(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),25,'filled'); 
set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;

%计算分类精度nmi.m accuracy.m hungarian.m
labels(idx{1})=1;
labels(idx{2})=2;
%   nmi_score = nmi(labels', true_labels)
  accuracy_score = accuracy(labels', true_labels)