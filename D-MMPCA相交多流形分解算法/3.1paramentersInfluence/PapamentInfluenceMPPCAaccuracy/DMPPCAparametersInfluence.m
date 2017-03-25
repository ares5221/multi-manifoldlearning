clear;
%%在做参数对分解Hybrid数据精度的影响时候，每次改变一个参数，运行20次，找出最高精度与平均精度

%%
acc=[];
for i=1:20
load( 'X1500.mat');
%%
%参数设置
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
% %画出扩展后的结果
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
%计算准确率
labels(newsX{1})=1;
labels(newsX{2})=2;
accuracy_score = accuracy(labels', true_labels)
%计算十次在该参数下的精度值
acc(i)=accuracy_score;
end;
%%
%计算出在该参数下最高的精度Max以及平均精度AVG
Max=max(acc)
AVG=sum(acc)/20