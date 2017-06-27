clc;
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%||   Mohammad Maghsoudi 810895019   ||
%||   maghsoudismtp -at- gmail.com   ||
%||      github.com/threemmm         ||
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% The main 
global env; % this variable defines the enviroment
global state_nums; % this variable defines the number of states in the enviroment
global action_nums;% this variable defines the number of actions in the enviroment
global actions_move; % this variable defines the movement of an action in the enviroment

global start_point;% this variable defines the start state of agent
global epsilon; % ----- Exploration Rate
global gamma;
global theta; % ----- Learning Rate
global Q_sa;% this variable defines the value of each pair of (state-action) in the enviroment
global goal_point;
global human_actions; % this variable shows the best actions (in readable mode) in output for each state

run_count = 30 ;
episode_count = 1000;
runs_cumulative_reward = [];
avg_steps = [];

CumulEveryRun = zeros(1,episode_count);

CUM_runs_vs_episodes = zeros(run_count,episode_count); 
STEP_runs_vs_episodes = zeros(run_count,episode_count);
for runs=1:run_count
    initializeSimulator();
    initializeAgent();
    step_num = 0;
    cumulative_reward = 0 ;
    for i=1:episode_count
        statePrime = start_point;
        step_num_every_episode = 0;
        while (~isequal(statePrime,goal_point))
            state = statePrime;
            [action] = chooseAction(state);
            [reward,statePrime] = performAction ( action ,state) ;
            
            % Update the Q_sa for (state, action) based on Q-learning
            %----------------------------------------------------------------------------------
            %if by this action hit a wall update Q by -inf else update by reward
            if isequal(state,statePrime)
            Q_sa(state(1),state(2),action) = -inf;
            else
            Old_value_Q_sa = Q_sa(state(1), state(2),action);
            Q_sa(state(1), state(2),action) = Old_value_Q_sa ...
                + theta *( reward + (gamma * max( Q_sa(statePrime(1), statePrime(2),:))) - Old_value_Q_sa );
            end
            step_num_every_episode = step_num_every_episode + 1 ;
            % gathering reward,step and action data for plotting different diagrams
            %----------------------------------------------------------------------------------
            cumulative_reward = cumulative_reward + reward; %keep track of cumulative reward for graph in every episode
            step_num = step_num + 1;
            disp(['run:' runs 'step:' step_num_every_episode 'episod' i 'action in state : ' state(1)   state(2) '  ==>  ' human_actions(action)]);
        end %--while
        
        display('========================================================================================' );
        display(statePrime);
        
        
        CumulEveryRun(i) = cumulative_reward/i ;
        STEP_runs_vs_episodes(runs , i) = step_num_every_episode;
        CUM_runs_vs_episodes(runs, i) = CumulEveryRun(i) ;
            
        
    end % for episode
    runs_cumulative_reward(runs) = sum(CumulEveryRun)/episode_count  ;
    avg_steps(runs) = step_num /episode_count ;
end %end of origin for - runs

%% averaging accumulated reward and step for plotting...
% Answer of the FIRST and THIRD questions in HW#3

%create a plot of episodes vs full_steps taken and episodes vs cumulative_reward taken averaged against full_steps taken
figure % new figure
[combinedGraph] = plotyy((1:run_count),runs_cumulative_reward, (1:run_count) , avg_steps);
grid on
title('Q-Learning Performance')
xlabel('30 Independent Runs')
ylabel(combinedGraph(1),'Cumulative Reward') % left y-axis
ylabel(combinedGraph(2),'Average Steps in Every Episode') % right y-axis


CUM_episode_all_runs = zeros(1,episode_count);
for ep_counter=1:episode_count
    CUM_episode_all_runs(ep_counter) = sum(CUM_runs_vs_episodes(:,ep_counter)/run_count );
end
figure
plot((1:episode_count),CUM_episode_all_runs);
grid on
title('Average Cumulative Reward of each Episode of 30 Runs vs Episodes')
xlabel('Episode')
ylabel('Average of rewards of each Episode')


STEP_episode_all_runs = zeros(1,episode_count);
for ep_counter=1:episode_count
    STEP_episode_all_runs(ep_counter) = sum(STEP_runs_vs_episodes(:,ep_counter)/run_count );
end
figure
plot((1:episode_count),STEP_episode_all_runs);
grid on
title('Average Steps of each Episode of 30 Runs vs Episodes')
xlabel('Episode')
ylabel('Average of steps of each Episode')


% Answer of the SECOND question in HW#3
% display the shortest path to the goal
Optimal = getOptimalPath();
display('Shortest path:')
display(Optimal);
