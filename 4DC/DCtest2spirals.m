% This code checks to see that you have the required packages
% in order to test DC
% kֻ������Ϊ456�������˫������ϡ�����ݣ��ֱ�ֽ��22,7,3�飬�ֽ��3��ľ������
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

%����DC�ֽ��ķ���ͼ����X1X2���漴��

figure;   hold on;  
hin=scatter(X1(1,:),X1(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);    hold off;
hold on;        
hin=scatter(X2(1,:),X2(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
hold on;        
hin=scatter(X3(1,:),X3(2,:),15,'filled'); 
set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;


%������ྫ��
labels(sX{1})=1;
labels(sX{2})=2;
labels(sX{3})=3;

accuracy_score = accuracy(labels', true_labels)
