function [reward,statePrime] = performAction ( action ,state)
global Q_sa;global action_nums;global epsilon;
global env;global state_nums;global action_nums;global actions_move;
global gamma;global theta; global setReward;
% this fuction moves the agent in enviroment and reward it based on what mentioned in ur HW

statePrime = state + actions_move(action,:);  
maze_situation = env(statePrime(1),statePrime(2));
if maze_situation == 1
  statePrime = state ;
end
reward = setReward(maze_situation+1);

end


