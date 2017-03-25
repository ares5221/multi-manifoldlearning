function newSY = transY_meng(Y1,C1,Y2,C2,sY)

newSY = ones(size(sY,1),size(sY,2))*Inf; 

aa = Y1-repmat(C1,1,size(Y1,2)); [U1,P1,V1] = svd(aa);
bb = Y2-repmat(C2,1,size(Y2,2)); [U2,P2,V2] = svd(bb);
%%%%%%%%%%ÅÐ¶ÏÐý×ª½Ç¶È%%%%%%%%%%%%%
newSY = U2*U1'*(sY-repmat(C2,1,size(sY,2)))+repmat(C1,1,size(sY,2));
