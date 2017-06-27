# Machine Learning
## Reinforcement learning / Q-Learning 
### Implementation of Reinforcement learning using Q learning algorithm in Matlab 
This Q-Learning code for MATLAB has been written by Mohammad Maghsoudi Mehrabani. It trains an agent to find the way from start point to goal point through a 20x20 maze. 
 - Actions include turning and moving through the maze
 - The agent earns rewards from the environment under certain conditions
 - The agent’s **goal** is to maximize the reward
 
### The Base Map 
![alt text](https://github.com/threemmm/ML-Q-Learning-Robot-in-Maze-MATLAB/blob/master/base-map-maze.PNG?raw=true)


Base map is stored in maze.txt included Start Point, Goal Point, Walls and Obstacles.

### Rewards:
- Goal = 200
- Hole = -10
- Oil = -5 
- Free Cells = -1 

### How to run
> Just open Main.m file and click on Run button

And Following convergence of the algorithm, MATLAB will print out the best path to the goal 

### Output :
- Optimal Path which shows the best path from start point to goal point - the best path is shown in below:
![alt text](https://github.com/threemmm/ML-Q-Learning-Robot-in-Maze-MATLAB/blob/master/final-output.PNG?raw=true)

- Figure 1 : Average Cumulative Rewards of each Episode of 30 Runs vs. Episodes
![alt text](https://github.com/threemmm/ML-Q-Learning-Robot-in-Maze-MATLAB/blob/master/cumulative.PNG?raw=true)

- Figure 2 : Average Steps of each Episode of 30 Runs vs. Episodes
![alt text](https://github.com/threemmm/ML-Q-Learning-Robot-in-Maze-MATLAB/blob/master/step.PNG?raw=true)

