function [ ENL , DOFs , DOCs ] = assign_BCs(NL)

NoN = size(NL,1); % Number of Nodes
PD = size(NL, 2); % Problem Dimension (2D)

ENL = zeros(NoN, PD*6);

ENL(:,1:2) = NL; % Coordinates

DOFs = 0;
DOCs = 0;

for i = 1:NoN
    for j = 1:PD
        % If Type is -1 (Displacement), it's a Degree of Constraint
        if (ENL(i,PD+j) == -1)
            DOCs = DOCs - 1;
            ENL(i,2*PD+j) = DOCs;
        else
            % Otherwise (Type 0 or 1), it's a Degree of Freedom
            DOFs = DOFs + 1;
            ENL(i,2*PD+j) = DOFs;
        end
    end
end

% 4. Assign Global Matrix Positions
for i = 1:NoN
    for j = 1:PD
        if(ENL(i,(2*PD+j)) < 0)
            ENL(i,PD*3+j) = DOFs + abs(ENL(i,(2*PD+j)));
        else
            ENL(i,PD*3+j) = ENL(i,(2*PD+j));
        end
    end
end

DOCs = abs(DOCs);

end