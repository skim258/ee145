function[x,y] = computeGridSukharev_mod(n)
%input: number of n samples
%output: uniform Sukharev center grid
%modified for reuse for lab 6 - removed graph output
%returns x and y values in sukharev grid
x = [];
y = [];
numIn = n^2;
interval = sqrt(numIn)*2 + 1;   %number of intervals 
seq = linspace(0,1,interval);
%hold on
for i = 1:length(seq)
    for j = 1:length(seq)
        if(mod(j,2) | mod(i,2))   %if odd
            %do nothing
            
        else
            %plot(seq(j),seq(i),'*b')
            x = [x ;seq(j)];
            y = [y ;seq(i)];
        end
    end
end
end