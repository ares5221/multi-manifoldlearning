clear;
%%���������Էֽ�Hybrid���ݾ��ȵ�Ӱ��ʱ��ÿ�θı�һ������������20�Σ��ҳ���߾�����ƽ������

%%
acc=[];
for i=1:20
load( 'X1500.mat');
%%
%��������
ppca_dim=2;
maxAngle=20;
r=0.8;
ncentres= 20;
knn=5;
power=8;
crossTan=25;
tic;
[newsX] = MPPCAMultiManifolds(X,ppca_dim,maxAngle,r,ncentres,knn,power,crossTan);
toc
%%
% %������չ��Ľ��
% figure; 
% X1=X(:,newsX{1});
% X2=X(:,newsX{2});
% hold on;        
% hin=scatter3(X1(1,:),X1(2,:),X1(3,:),15,'filled'); 
% set(hin,'MarkerEdgeColor','r','MarkerFaceColor',[0.75 0 0.75]);       hold off;
% hold on;        
% hin=scatter3(X2(1,:),X2(2,:),X2(3,:),15,'filled'); 
% set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
% view(-10,10)
%%
%����׼ȷ��
labels(newsX{1})=1;
labels(newsX{2})=2;
accuracy_score = accuracy(labels', true_labels)
%����ʮ���ڸò����µľ���ֵ
acc(i)=accuracy_score;
end;
%%
%������ڸò�������ߵľ���Max�Լ�ƽ������AVG
Max=max(acc)
AVG=sum(acc)/20