function [imgs] = E2VInt(EventData, intTime)

multiplier = 1;
% t in us (microseconds)
t_last = EventData(end,5);
last_multiplier = floor(t_last/intTime)

[N, ~] = size(EventData);

imgs = uint8(zeros(800, 1280, last_multiplier));

% TO DO: Converting 12-bit images to 8-bit
% !! Loss of information

for iter = 1:N
    i = 800 - (EventData(iter, 1)); % + 1;
    j = EventData(iter, 2) + 1;
    t = EventData(iter, 5);
    intensity = getIntensity(EventData(iter, 3), EventData(iter, 4));
    %if (intensity > threshold)
    %    imgs(i, j, multiplier) = intensity;
    %end
    imgs(i, j, multiplier) = 255; %intensity;
    if (t>multiplier*intTime)
        multiplier = multiplier+1;
    end
end

write_imgs(imgs);
makeVideo(last_multiplier);

end

function intensity = getIntensity(value, polarity)

% Convert from 12-bit to 0 to 1 value
intensity = 128*value/4096;
% TODO: Polarity not considered!
% intensity = intensity*polarity;

end

function [] = write_imgs(imgs)

[~, ~, T] = size(imgs);
img_str = "results/img_";
ext = ".png";

for iter = 1:T
    s = img_str + iter + ext;
    imwrite(imgs(:,:,iter), s);
end

end

function [] = makeVideo(N)
video = VideoWriter('results/video.avi'); %create the video object
open(video); %open the file for writing
for i1=1:N %where N is the number of images
    filename = 'results/img_'+string(i1)+'.png';
    I = imread(filename); %read the next image
    writeVideo(video,I); %write the image to file
end
close(video); %close the file
end