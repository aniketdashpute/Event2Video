% Capture the images in intensity mode
% OR
% If you capture in some other mode, change the indices to access
% OR
% Write a new function!

% For laser intensity 20mW, I think
% ideal threshold could be around 3500

function [Event_PC_denoised] = Event2PC(EventData, thresholdInt, numNbr, thPC)

% Take the x, y, time, and intensity values respectively from the event data
Events_xyt = EventData(:,[1,2,5,3]);

% Apply threshold on the intensity values
Events_xyt_th = Events_xyt(Events_xyt(:,4)>thresholdInt,:);

Event_PC_temp = pointCloud(Events_xyt(:,1:3), "Intensity", Events_xyt(:,4));
figure, pcshow(Event_PC_temp), title("OG PC");

% Make a point cloud from the thresholded intensities
Event_PC = pointCloud(Events_xyt_th(:,1:3), "Intensity", Events_xyt_th(:,4));

% Denoise the point cloud using MATLAB's PC denoising algorithm
Event_PC_denoised = pcdenoise(Event_PC, "NumNeighbors",numNbr,"Threshold",thPC);
figure, pcshow(Event_PC_denoised), title("Denoised PC");
figure, pcshow(Event_PC_denoised), title("Denoised PC");

end