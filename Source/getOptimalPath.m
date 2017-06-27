function [ output_optimal ] = getOptimalPath(  )
%getOptimalPath Summary of this function goes here
%   Detailed explanation goes here
global env; global goal_point; global Q_sa; global start_point; global actions_move;

Optimal=[];
s=start_point;
Optimal=horzcat(Optimal,[s(1);s(2)]);
while (~isequal(statePrime,goal_point))
    qmax = max( Q_sa(s(1),s(2),:));
    optimal_actions = find (Q_sa(s(1),s(2),:)==qmax);
    permutation = randperm(length(optimal_actions));        
    action = optimal_actions( permutation(1));  
    s = s + actions_move(optimal_action , :);
    Optimal=horzcat(Optimal,[s(1) ; s(2)]);
    display(Optimal);
end
output_optimal = Optimal;
end

