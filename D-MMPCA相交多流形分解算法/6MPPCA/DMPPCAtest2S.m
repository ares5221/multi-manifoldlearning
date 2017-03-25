% This code checks to see that you have the required packages
% in order to run DMPPCA ������
% ���㷨�����ֲ���ϡ�����ε�Ч���е㲻̫�ã��ڵ�������ʱ��M��Ӧ��Ҫ��С���ֵĿ�����Ҳ��׼�˵�
% ���������չ��˼·����������ϡ�������Ҫ���ܶ���С�ĵط�Ҳ���������ߵĽǿ�ʼ��չ���ܴ����Ŀ�ʼ��չ������Ҳ������
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
%������չ��Ľ��
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

%������ྫ��
labels(newsX{1})=1;
labels(newsX{2})=2;

  accuracy_score = accuracy(labels', true_labels)



