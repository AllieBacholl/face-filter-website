function [outfile] = imgtohex(infile)

RGB = imread(infile);
[row,col,n] = size(RGB);

R=RGB(:,:,1);
G=RGB(:,:,2);
B=RGB(:,:,3);

imgdata=zeros(1, row*col);

for r=1:row
    for c=1:col
        imgdata((r-1)*col+c)=bitand(R(r,c),224)+bitshift(bitand(G(r,c),244),-3)+bitshift(bitand(B(r,c),192),-6);
    end
end

S = infile;
S(find(S=='.',1,'last'):end) = [];
S = strcat(S, '.txt');
fidc=fopen(S,'w+');

outfile = S;

for i = 1:row*col
    fprintf(fidc,'%02x ',imgdata(i));
end
fclose(fidc);