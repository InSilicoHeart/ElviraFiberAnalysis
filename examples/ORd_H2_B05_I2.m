addpath([pwd() '/../source'])

pathToSave = '~/FiberResults/ORd_H2_B0.5_I2';
mainElvira = '~/Software/Elvira/Elvira20150426/bin/mainelv_infiniband_gcc';
project = 'Hperkalemia in fibre - OHara et al 2011 Model';
cellType = 22;
K = [4 5 5.4 6:11];
cores=2;
K_index = 28;
K_control = 5.4;
h_index = 10;
j_index = 12;
dt = 0.002;
step_save=50;
fun_sodium=@sodiumOHara;
%[s]=rmdir(Model,'s');
pre_dur = 1000;
pre_step = 100;
Imax = 1000;
Istep = 1;
CI_step = 1;
sigma_L = 0.0012;
Cm = 1;
HZ = 2;
BZ = 0.5;
IZ = 2;
centerOut = 3.5;
dx = 0.01;
nOut = 5;
dxOut = 0.25;

CL = 1000;
numStimIThreshold = 5;
nS1 = 10;

CVControl = 65;
CVError = 0.2;

nodesOut = CalculateERP(cores, pathToSave, mainElvira, project, cellType, K, K_index, K_control, dt,...
             step_save, pre_dur, pre_step, fun_sodium, h_index,...
             j_index, Imax, Istep, CI_step, sigma_L, Cm, HZ, BZ, IZ, dx, dxOut,...
             nOut, centerOut, CL, numStimIThreshold, nS1, CVControl, CVError);

plotStatus(pathToSave,K)
plotIThresholdLimits(pathToSave,nodesOut)
plotCILimits(pathToSave,K,nodesOut)
plotS1(pathToSave,CL,K,nodesOut)

exit
