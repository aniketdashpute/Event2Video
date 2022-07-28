function [imgs] = PCtoVideo(EventDataPC, intTime)

multiplier = 1;
% t in us (microseconds)
EventData = EventDataPC.Location;
t_last = EventData(end,3);
last_multiplier = floor(t_last/intTime)

[N, ~] = size(EventData);

imgs = double(zeros(800, 1280, last_multiplier));

% TO DO: Converting 12-bit images to 8-bit
% !! Loss of information

for iter = 1:N
    i = 800 - (EventData(iter, 1)); % + 1;
    j = EventData(iter, 2) + 1;
    t = EventData(iter, 3);
    intensity = double(EventDataPC.Intensity(iter))/2^12;
    imgs(i, j, multiplier) = intensity;
    
    if (t>multiplier*intTime)
        multiplier = multiplier+1;
    end
end

write_imgs(imgs);
makeVideo(last_multiplier);

end

function [] = write_imgs(imgs)

[~, ~, T] = size(imgs);
img_str = "results/img_denoised_";
ext = ".jpg";

for iter = 1:T
    s = img_str + iter + ext;
    imwrite(imgs(:,:,iter), s, 'jpg');
end

end

function [] = makeVideo(N)
video = VideoWriter('results/video_denoised.avi'); %create the video object
open(video); %open the file for writing
for i1=1:N %where N is the number of images
    filename = 'results/img_denoised_'+string(i1)+'.jpg';
    I = imread(filename); %read the next image
    writeVideo(video,I); %write the image to file
end
close(video); %close the file
end