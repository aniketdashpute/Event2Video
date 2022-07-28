t_integration = 10000
numNeighbors = 6;
thresholdPC = 0.25;
EV = load('EventData4_1D.csv');
PC = Event2PC(EV, 3500, numNeighbors, thresholdPC);
imgs = PCtoVideo(PC, t_integration);