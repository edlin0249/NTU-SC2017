function output = myImageCompress(inImage, k)
[m, n, p] = size(inImage);

blocks_num = zeros(192, m*n/64);
counter = 1;
for j = 1:n/8
    for i = 1:m/8
        blocks_num(:, counter) = reshape(inImage(8*(i-1)+1:8*i, 8*(j-1)+1:8*j, :), 192, 1);
        counter =counter + 1;
    end
end

center = kMeansClustering(blocks_num, k);
distMat = distPairwise(center, blocks_num);
[Minvalue, Minindex] = min(distMat);

compress = center(:, Minindex);

recover = zeros(size(inImage));
count = 1;
for j = 1:n/8
    for i = 1:m/8
        recover(8*(i-1)+1:8*i, 8*(j-1)+1:8*j, :) = reshape(compress(:, count), 8, 8, p);
        count = count + 1;
    end
end
output = recover;
end
