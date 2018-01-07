close all; clear all; clc;
 
WE =  iris_dataset;
plot(WE(1,:),WE(2,:),'r.',WE(3,:),WE(4,:),'g.');
legend('kielich','p³atek')
grid on;
dimensions   = [10 10];
coverSteps   = 100;
initNeighbor = 0;
topologyFcn  = 'hextop';
distanceFcn  = 'dist';
 
net = selforgmap(dimensions,coverSteps,initNeighbor,topologyFcn,distanceFcn);
 
net.trainParam.epochs = 400;
[net,tr] = train(net,WE);
 
