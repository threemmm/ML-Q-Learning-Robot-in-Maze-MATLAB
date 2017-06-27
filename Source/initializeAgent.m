function initializeAgent()
global start_point;global epsilon;global gamma;global theta;global Q_sa;
global state_nums;global action_nums; global goal_point;global actions_move;
start_point=[16,5];
epsilon=0.01;gamma=0.9;theta=0.3;

%if you want to set Q_sa by zeros 
%Q_sa= zeros([state_nums(1) state_nums(2) action_nums]); %10*rand(state_nums(1),state_nums(2),action_nums);

Q_sa=10*rand(state_nums(1),state_nums(2),action_nums);
Q_sa(goal_point(1)+ actions_move(1 , 1) , goal_point(2) + actions_move(1 , 2) , 3) = 10;
Q_sa(goal_point(1)+ actions_move(2 , 1) , goal_point(2) + actions_move(2 , 2) , 4) = 10;
Q_sa(goal_point(1)+ actions_move(4 , 1) , goal_point(2) + actions_move(4 , 2) , 2) = 10;

end