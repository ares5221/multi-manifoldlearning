% This code checks to see that you have the required packages
% in order to test SC

clear;
load('UMist8.mat');
X=X6;
acc=[];
for xh=1:20
tic;
gen_nn_distance(X', 10, 10, 0);
%结果保存在8_NN_sym_distance.mat 中，其中上一行代码中近邻个数k=8，所以结果为8_NN_sym_distance.mat保存在NN_sym_distance
load ('10_NN_sym_distance.mat');
disp('Running Spectral Clustering...');
[cluster_labels evd_time kmeans_time total_time] = sc(A, 20, 8);
toc
%计算分类精度
%   load ('corel_labeForHybrid1500l.mat');
%   nmi_score = nmi(label, cluster_labels)
  accuracy_score = accuracy(cluster_labels,true_lable)
 acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20
% %聚成了两类每一类的信息保存在PP中
% cluster_labels=cluster_labels';
% for j=1:3
%     d=0;
%     for i=1:size(cluster_labels,2) 
%         if (cluster_labels(:,i)==j)
%            d=d+1;
%            PP(j,d)=i;     
%         end;       
%     end;
% end;
% %画出SC分解后的分类图，将X1X2保存即可
% [m,n,b]=find(PP(1,:));
% X1=X(:,b);
% [m,n,bb]=find(PP(2,:));
% X2=X(:,bb);
% [m,n,bbb]=find(PP(3,:));
% X3=X(:,bbb);
% figure;      hold on;        
% hin=scatter3(X1(1,:),X1(2,:),X1(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','k','MarkerFaceColor',[0 .75 .75]);       hold off;
% hold on;        
% hin=scatter3(X2(1,:),X2(2,:),X2(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','k','MarkerFaceColor','m');       hold off;
% hold on;        
% hin=scatter3(X3(1,:),X3(2,:),X3(3,:),50,'filled'); 
% set(hin,'MarkerEdgeColor','c','MarkerFaceColor','y');       hold off;
% view(-60,10)

