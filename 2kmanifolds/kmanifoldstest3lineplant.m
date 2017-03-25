function [ output_args ] = testKmeans( input_args )
%   kmanifolds����three liner plant
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
%����kmanifolds��X���࣬�õ���IDX���Ƿ�����
%�������ʱ����Data dimension does not match dimension of centres�����ر�matlab���´򿪼���
disp('Running k-Manifolds...')
tic;
[idx,assn] = kmanifolds(X, [3 3 3]);
toc

X1=X(:,idx{1});
X2=X(:,idx{2});
X3=X(:,idx{3});

%����kmanifolds�ֽ��ķ���ͼ����X1X2X3���漴��

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

%������ྫ��nmi.m accuracy.m hungarian.m
labels(idx{1})=1;
labels(idx{2})=2;
labels(idx{3})=3;
%   nmi_score = nmi(labels', true_labels)
  accuracy_score = accuracy(labels', true_labels)
  
end

