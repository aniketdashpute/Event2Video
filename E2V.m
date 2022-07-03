function [imgs] = E2V(EventData, intTime)

multiplier = 1;
% t in us (microseconds)
t_last = EventData(end,3);
last_multiplier = floor(t_last/intTime)
[N, ~] = size(EventData);

imgs = zeros(800, 1280, last_multiplier);

for iter = 1:N
    i = EventData(iter, 1) + 1;
    j = EventData(iter, 2) + 1;
    t = EventData(iter, 3);
    imgs(i, j, multiplier) = 1;
    if (t>multiplier*intTime)
        multiplier = multiplier+1;
    end
end

write_imgs(imgs);

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