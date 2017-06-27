function initializeSimulator()
global env;global state_nums;global action_nums;global actions_move; global setReward;
global goal_point;
global human_actions;
goal_point=[4,14];
env=load('maze.txt');
% 0 = free state;  R = -1
% 1 = wall; 
% 2 = hole; R = -10
% 3 = oil; R = -5
% 4 = start point;
% 5 = finish point; R = 200 

state_nums=size(env); %   D = SIZE(X), for M-by-N matrix X, returns the two-element row vector
                      %   D = [M,N] containing the number of rows and columns in the matrix.
action_nums=4;
actions_move=[-1,0;0,1;1,0;0,-1;0,0]; % [ 1=North , 2=East , 3=South , 4=West , stay ]
human_actions = {'North';'East';'South';'West'};
setReward=[-1 , 0 , -5 , -10 , -1 , 200 ]; %[0=-1,1=wall,2=-5,3=-10,4=start, 5=200]

end