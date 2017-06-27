# Machine Learning
## Reinforcement learning / Q-Learning 
### Implementation of Reinforcement learning using Q learning algorithm in Matlab 
This Q-Learning code for MATLAB has been written by Mohammad Maghsoudi Mehrabani. It trains an agent to find the way from start point to goal point through a 20x20 maze. 
 - Actions include turning and moving through the maze
 - The agent earns rewards from the environment under certain conditions
 - The agent’s **goal** is to maximize the reward
 
### The Base Map 

Base map is stored in maze.txt included Start Point, Goal Point, Walls and Obstacles.

### Rewards:
- Goal = 200
- Hole = -10
- Oil = -5 
- Free Cells = -1 
Following convergence of the algorithm, MATLAB will print out the best path to the goal 
