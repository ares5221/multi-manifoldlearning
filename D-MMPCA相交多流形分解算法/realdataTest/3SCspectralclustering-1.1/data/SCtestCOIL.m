% This code checks to see that you have the required packages
% in order to test SC

clear;
load('COIL20Croped.mat');
X=COILcrop';
acc=[];
for xh=1:20
tic;
gen_nn_distance(X', 6, 10, 0);
%���������8_NN_sym_distance.mat �У�������һ�д����н��ڸ���k=8�����Խ��Ϊ8_NN_sym_distance.mat������NN_sym_distance
load ('15_NN_sym_distance.mat');
disp('Running Spectral Clustering...');
[cluster_labels evd_time kmeans_time total_time] = sc(A, 20, 5);
toc
%������ྫ��
%   load ('corel_labeForHybrid1500l.mat');
%   nmi_score = nmi(label, cluster_labels)
  accuracy_score = accuracy(cluster_labels,true_lables1)
 acc(xh)=accuracy_score
end;
Max=max(acc)
Avg=sum(acc)/20
% %�۳�������ÿһ�����Ϣ������PP��
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
% %����SC�ֽ��ķ���ͼ����X1X2���漴��
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

