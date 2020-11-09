img = imread('C:\Users\dell\Desktop\obs.png')
thresh = graythresh(img);
img2 = im2bw(img,thresh)+0; %#ok<IM2BW>
r_img2=img2;
[row,col] = size(r_img2);
for i = 1:(row*col)
    if img2(i)==0
        r_img2(i)=1;
    else
        r_img2(i)=0;
    end
end
fid = fopen("data.txt",'wt');
for ske = 0:col/8-1
    for r=1:row
        for j=ske*8+1:ske*8+8
            fprintf(fid,"%d",r_img2(r,j));
        end
        fprintf(fid,'\n');
    end
end
fclose(fid);
