function [action]=chooseAction(s)
global Q_sa;global action_nums;global epsilon;

% this fuction returns the best action with probability of 1-epsilon
% and returns a random action with probability of epsilon

%The rand function returns real numbers between 0 and 1
if rand < epsilon
    %%a random action with probability of epsilon
    permutation = randperm(length(action_nums));
    action = permutation(1);
    
else
    %%the best action with probability of 1-epsilon
    qmax = max( Q_sa(s(1),s(2),:));
    actions = find (Q_sa(s(1),s(2),:)==qmax);
    permutation = randperm(length(actions));
    action = actions( permutation(1));
    
end
end

