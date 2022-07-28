%% Get the handle for the DAQ device (need to run only once)

%dq = daq("ni");
%addoutput(dq, "Dev1", "ao0", "Voltage");
%addoutput(dq, "Dev1", "ao1", "Voltage");

%% Generate data and send to galvo using DAQ
[x, y] = GenerateRasterXY(5000,4);
figure, plot(y);
figure, plot(x);

write(dq, [x, y]); % [op_ao0, op_ao1]