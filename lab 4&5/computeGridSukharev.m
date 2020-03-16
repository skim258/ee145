function computeGridSukharev(n)
%input: number of n samples
%output: uniform Sukharev center grid
numIn = n^2;
interval = sqrt(numIn)*2 + 1;   %number of intervals 
seq = linspace(0,1,interval);
seqSetGrid = [];   %grid coord for seq
hold on
for i = 1:length(seq)
    if(mod(i,2))   %setting grid
        seqSetGrid = [seqSetGrid seq(i)];
    end
    for j = 1:length(seq)
        if(mod(j,2) | mod(i,2))   %if odd
            %do nothing
            
        else
            plot(seq(j),seq(i),'*b')
        end
    end
end
axis([0 1 0 1])
grid on

xticks(seqSetGrid);
yticks(seqSetGrid);
hold off
end