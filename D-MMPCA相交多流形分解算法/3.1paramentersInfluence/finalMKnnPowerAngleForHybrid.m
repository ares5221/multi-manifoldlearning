
%%%%����Hybrid���ݼ�������DMPPCA�㷨
% ����M Knn power angel �Էֽ��ཻ�����εľ��ȵ�Ӱ��
figure('color','w');
%%%%M�Խ����Ӱ��
subplot(2,4,1)
load newMInfluence;
x=5:5:70;
%y1--Average accuracy of DMPPCA y2--Best accuracy of DMPPCA
hold on;
y3=bb(3,:);y4=bb(4,:);
plot(x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Number of mixture models(M)');
ylabel('Clustering accuracy');
title('(a) Different M values','fontsize',12); 

%%%%theta�Խ����Ӱ��
subplot(2,4,2)
load newthetaInfluence;
x=1:1:25;
%y3--Average accuracy of DMPPCA y4--Best accuracy of DMPPCA
hold on;
y3=bb(3,:);y4=bb(4,:);
plot(x,y3,'-o b',x,y4,'-s r','LineWidth',2 ,'MarkerFaceColor','c');
legend({'Average accuracy of DMPPCA','Best accuracy of DMPPCA'},'fontsize',6,'location','northwest');
% legend ('boxoff')
xlabel('Maximum tangent angle parameter(\theta)');
ylabel('Clustering accuracy');
title('(b) Different \theta values','fontsize',12); 