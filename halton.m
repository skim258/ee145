clc
n = 3;
p = 3;

s = zeros(1,n);
for i = 1:n
    itmp = i;
    f = 1/p;
    while itmp > 0
        q = floor(itmp/p);
        r = mod(itmp,p);
        s(i) = s(i) + f*r;
        itmp = q;
        f = f/p;
    end
end
s