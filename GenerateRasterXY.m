% Raster Scan function for galvo scanner X, Y
% This function returns the functions
% so that they can be used as inputs to galvo scanner x and y
% respectively so that it performs a raster scan

function [galvo_x, galvo_y] = GenerateRasterXY(timesteps, Vpp)

clubsteps = 500;

galvo_x = zeros(timesteps+1,1);
galvo_y = zeros(timesteps+1,1);

for iter = 0:timesteps
    i = floor(iter/clubsteps);
    galvo_x(iter+1) = i;
    
    j = floor(2*iter/(clubsteps));
    if (mod(i,2)==0)
        galvo_y(iter+1) = mod(iter,clubsteps);
    else
        galvo_y(iter+1) = clubsteps - mod(iter,clubsteps);
    end
end

galvo_y = Vpp*(galvo_y/max(galvo_y)-0.5);
galvo_x = Vpp*(galvo_x/max(galvo_x)-0.5);

end