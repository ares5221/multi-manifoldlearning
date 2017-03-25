clear;
%%导入数据集

%%
acc=[];
for i=1:10
load( 'X1500.mat');
%%
%参数设置
ppca_dim=2;
maxAngle=20;
r=0.8;
ncentres= 49;
knn=6;
power=8;
crossTan=20;
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
AVG=sum(acc)/10