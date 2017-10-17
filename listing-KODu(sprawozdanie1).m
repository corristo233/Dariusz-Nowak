%% implementacja neuronu and
close all; clear all; clc;
input = [0 0; 0 1; 1 0; 1 1];
numIn = 4;
desired_out = [0;0;0;1];
bias = -1;
coeff = 0.7;
rand('state',sum(100*clock));
weights = -1*2.*rand(3,1);


iterations = 100000;


for i = 1:iterations
     out = zeros(4,1);
     for j = 1:numIn
          y = bias*weights(1,1)+...
               input(j,1)*weights(2,1)+input(j,2)*weights(3,1);
          out(j) = 1/(1+exp(-y));
          delta = desired_out(j)-out(j);
          weights(1,1) = weights(1,1)+coeff*bias*delta;
          weights(2,1) = weights(2,1)+coeff*input(j,1)*delta;
          weights(3,1) = weights(3,1)+coeff*input(j,2)*delta;
     end
end

disp(out);
%% And z wykorzystaniem wtyczki matlab
close all; clear all; clc;
net = newp([2 3; -1 2], 1);
P1 = [0 1 0 1; 0 0 1 1];

T1 = [0 0 0 1];
net = init(net); 

net = train(net,P1,T1);
%Y = sim(net,P1) 
%P2 = [1 0 1 1; 1 1 0 1];
Y = sim(net,P1)
plotpv(P1,T1);
plotpc(net.IW{1},net.b{1});
%% And ze zmiana wag
close all; clear all; clc;
net = newp([2 3; -1 2], 1);
P1 = [0 1 0 1; 0 0 1 1];

T1 = [0 0 0 1];
net.IW{1}=[37 10];
net.b{1}=[11];


net = train(net,P1,T1);
%Y = sim(net,P1) 
%P2 = [1 0 1 1; 1 1 0 1];
Y = sim(net,P1)
plotpv(P1,T1);
plotpc(net.IW{1},net.b{1});

