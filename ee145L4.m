clc, clear
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
AdjTable(30).node = [27,29,31];
AdjTable(31).node = [30,32];
AdjTable(32).node = [23,31];
%adjacency table end-------------------------------
startNode = 1;
goalNode = 32;
parent = computeBFStree(AdjTable,startNode);
pathBFS = computeBFSpath(AdjTable, startNode, goalNode);

function [parentVec, starNodeFlag] = computeBFStree(AdjTable,startNode)
%returns parent vector of the `nodes 
%returns error message if start node not found
[num1 numNode] = size(AdjTable); %[1 number of node]
parentVec = zeros(1,numNode);
startNodeFlag = 0;  %flag to check if start node exists
arrCheck = [];
for i = numNode:-1:1
    parentVec(i) = AdjTable(i).node(1);
    arrCheck = ismember(AdjTable(i).node, startNode); %check neighboring node 
    [num1 sizeArr] = size(arrCheck);    %size = [1 size_of_array]
    for j = 1:sizeArr
        if(arrCheck(j)) %if startNode is member of the array
        startNodeFlag = 1; %trigger flag
        end
    end
end
if(startNodeFlag == 1)
else
    disp('error: couldn''t find start node')
end
root = startNode;
end

function[pathBFS] = computeBFSpath(AdjTable, startNode, goalNode)
    [parent, startExist] = computeBFStree(AdjTable, startNode);
    currNode = goalNode;
    pathBFS = [];
    i = 0;
    if(startExist)
        while currNode == startNode
            currNode = parent(currNode);
            pathBFS = [currNode pathBFS];
        end
    end 
end