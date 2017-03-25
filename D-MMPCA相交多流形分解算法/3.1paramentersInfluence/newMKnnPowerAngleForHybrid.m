
%%%%����Hybrid���ݼ�������DMPPCA�㷨
% ����M Knn power angel �Էֽ��ཻ�����εľ��ȵ�Ӱ��
figure('color','w');
%%%%M�Խ����Ӱ��
subplot(2,4,1)
load newMInfluence;
x=5:5:70;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Number of mixture models(M)');
ylabel('Clustering accuracy');
title('(a) Different M values','fontsize',12); 
%%%%KNN�Խ����Ӱ��
subplot(2,4,2)
load newKNNInfluence;
x=2:1:21;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Number of nearest neighbors(K)');
ylabel('Clustering accuracy');
title('(b) Different neighbors','fontsize',12); 
%%%%o�Խ����Ӱ��
subplot(2,4,3)
load oInfluence;
x=1:1:15;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Tuning parameter(o)');
ylabel('Clustering accuracy');
title('(c) Different o values','fontsize',12); 
%%%%theta�Խ����Ӱ��
subplot(2,4,4)
load newthetaInfluence;
x=1:1:25;
%y1--Kmeans y2--DC  y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y1=bb(1,:);y2=bb(2,:);y3=bb(3,:);y4=bb(4,:);
plot(x,y1,':* m',x,y2,'-d g',x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Kmeans','D-C','Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Maximum tangent angle parameter(\theta)');
ylabel('Clustering accuracy');
title('(d) Different \theta values','fontsize',12); 