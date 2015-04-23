addpath([pwd() '/../source'])

pathToSave = '~/FiberResults/CRLP';
mainElvira = '~/Software/Elvira/Elvira20150121/bin/mainelv_infiniband_gcc';
project = 'Hperkalemia in fibre - Grandi, Pascualini & Bers 2010 Model';
cellType = 15;
K=[4:1:11];
cores=4;
K_index = 12;
K_control = 5.4;
h_index = 9;
j_index = 10;
dt = 0.002;
step_save=50;
fun_sodium=@sodiumCarro;
%[s]=rmdir(Model,'s');
pre_dur = 1000;
pre_step = 100;
Imax = 500;
Istep = 1;
CI_step = 1;
sigma_L = 0.0013;
Cm = 1;
HZ = 1.5;
BZ = 0.5;
IZ = 2.0;
dx = 0.01;
nOut = 5;
dxOut = 0.25;

CL = 1000;
numStimIThreshold = 5;
nS1 = 10;

%nodesOut = CalculateERP(cores, pathToSave, mainElvira, project, cellType, K, K_index, K_control, dt,...
%             step_save, pre_dur, pre_step, fun_sodium, h_index,...
%             j_index, Imax, Istep, CI_step, sigma_L, Cm, HZ, BZ, IZ, dx, dxOut,...
%             nOut, CL, numStimIThreshold, nS1);

plotStatus(pathToSave,K)
plotIThresholdLimits(pathToSave,nodesOut)
plotCILimits(pathToSave,K,nodesOut)
plotS1(pathToSave,K,nodesOut)

exit
