clc, clear all
%adjacency table start-------------------------------
AdjTable(1).node = [2,10];
AdjTable(2).node = [1,3,11];
AdjTable(3).node = [2,4];
AdjTable(4).node = [3,5];
AdjTable(5).node = [4,6,12];
AdjTable(6).node = [5,7,13];
AdjTable(7).node = [6,8,14];
AdjTable(8).node = [7,9];
AdjTable(9).node = [8,15];
AdjTable(10).node = [1,11,16];
AdjTable(11).node = [2,10,17];
AdjTable(12).node = [5,13];
AdjTable(13).node = [6,12,14];
AdjTable(14).node = [7,13,18];
AdjTable(15).node = [9,19];
AdjTable(16).node = [10,17,20];
AdjTable(17).node = [11,16,21];
AdjTable(18).node = [14,22];
AdjTable(19).node = [15,23];
AdjTable(20).node = [16,21,24];
AdjTable(21).node = [17,20];
AdjTable(22).node = [18,30];
AdjTable(23).node = [19,32];
AdjTable(24).node = [20,25];
AdjTable(25).node = [21,24,26];
AdjTable(26).node = [25,27];
AdjTable(27).node = [26,28];
AdjTable(28).node = [27,29];
AdjTable(29).node = [28,30];
AdjTable(30).node = [22,29,31];
AdjTable(31).node = [30,32];
AdjTable(32).node = [23,31];
%adjacency table end-------------------------------
startNode = 9;
goalNode = 21;
parent = computeBFStree(AdjTable,startNode);
pathBFS = computeBFSpath(AdjTable, startNode, goalNode)
plotObsNPath(pathBFS,startNode);

axis([.1 .9, 0 .4])
grid on
function [parentVec, startNodeFlag] = computeBFStree(AdjTable,startNode)
%returns parent vector of the `nodes 
%returns error message if start node not found
[num1 numNode] = size(AdjTable); %[1 number of node]
parentVec = zeros(1,numNode);
startNodeFlag = 0;  %flag to check if start node exists
arrCheck = [];
Q = [startNode];    %initialize Q
v = 0;   %initialize vertex
while ~isempty(Q)
    v = Q(end);   %retreve(Q)
    Q(end) = [];
    arrCheck = ismember(AdjTable(v).node, startNode); %check neighboring node
    [num1 sizeArr] = size(arrCheck);    %size = [1 size_of_array]
    for i = 1:sizeArr   %check for every node connnected to v
        if(arrCheck(i)) %if startNode is member of the array
            startNodeFlag = 1; %trigger flag
        end
        
        u = AdjTable(v).node(i);    %check nodes connected to the vertex
        if (parentVec(u) == 0)
            parentVec(u) = v;
            Q = [u, Q];
        end
    end

end
if(startNodeFlag)
    %do nothing if there is start node
else
    disp('error: couldn''t find start node')
end
end

function[pathBFS] = computeBFSpath(AdjTable, startNode, goalNode)
    [parent, startExist] = computeBFStree(AdjTable, startNode); %check if there is start
    startNodeFlag = 0;  %flag to check if start node exists
    arrCheck = [];
    goalExists = 0;   %flag if goal node exists
    [num1 numNode] = size(AdjTable); %[1 number of node]
    for i = 1:numNode
        arrCheck = ismember(AdjTable(i).node, goalNode); %check neighboring node 
        [num1 sizeArr] = size(arrCheck);    %size = [1 size_of_array]
        for j = 1:sizeArr
            if(arrCheck(j)) %if goalNode is member of the array
                goalExists = 1; %trigger flag
                break;
            end
        end
    end
    currNode = goalNode;
    pathBFS = [currNode];
    if(startExist & goalExists)
        while ~isequal(currNode, startNode)
            currNode = parent(currNode);
            pathBFS = [currNode pathBFS];
        end
    else
        disp('Error: couldn''t find goal node')   %fail condition, there is no start node
    end 
end

function plotObsNPath(pathBFS,initPt)
workMap = [ 1 1 1 1 1 1 1 1 1
            1 1 0 0 1 1 1 0 1
            1 1 0 0 0 0 1 0 1
            1 1 0 0 0 0 1 0 1
            1 1 1 1 1 1 1 1 1];   %map where obstacles are 0 and vertices are 1
[row,col] = size(workMap);
nodeidx = 1;  %node number index
for i = 1:row
    for j = 1:col
        if(workMap(i,j))
            nodeCoord(nodeidx).node(1) = j;
            nodeCoord(nodeidx).node(2) = row - i;
            nodeidx = nodeidx + 1;
        else
            plot(.1*j,.1*(row - i), '*r')  %plot obstacle, resized to 10 times
            hold on
        end
    end
end

plotPath = ismember(pathBFS, workMap);  %gives matrix of path
while ~isempty(pathBFS)
    nodeX = nodeCoord(pathBFS(1)).node(1);
    nodeY = nodeCoord(pathBFS(1)).node(2);
    if(isequal(initPt, pathBFS(1)))
        plot(.1*nodeX,.1*nodeY,'*g')    %plot first point as green
    else
        plot(.1*nodeX,.1*nodeY,'*b')
    end
    pathBFS(1) = [];
end
hold off


end