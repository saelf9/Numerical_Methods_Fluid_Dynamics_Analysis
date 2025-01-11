# Numerical Methods Fluid Dynamics Analysis

This repository contains MATLAB code implementations for solving nonlinear equations and performing numerical integrations to model the dynamics of a body falling through a fluid. The project focuses on using numerical methods like Newton's method and the trapezoidal rule to simulate the forces acting on an object in free fall, considering weight, buoyancy, and drag.

## Contents

- **Devoir2.m**: Main script that uses the Newton's method and Trapezoidal rule to model the dynamics of a body falling through a fluid.
- **Newton.m**: MATLAB function to find the roots of a nonlinear equation using Newton's method.
- **Trapezes.m**: MATLAB function to approximate integrals using the trapezoidal rule.
  
## Objectives

The project simulates a human body falling into a pool and calculates the time and distance it takes to reach the bottom. The following steps are involved:

1. **Newton's Method for Root-Finding**: Solving the equation \(10,000 = x \cdot e^x\) using Newton’s method.
2. **Trapezoidal Rule for Numerical Integration**: Calculating the time and distance traveled by integrating acceleration and velocity data.
3. **Fluid Dynamics Modeling**: Simulating a human body’s fall through a fluid considering weight, buoyancy, and drag.

## Requirements

- MATLAB R2024 or higher
- Basic understanding of numerical methods, such as Newton's method and the trapezoidal rule.

## Usage

1. **Newton's Method**: To use the Newton's method to find the solution for the equation \(10,000 = x \cdot e^x\), run the main script `Devoir2.m`. It will use the `Newton.m` function to compute the root and display error analysis through a log-log plot.

   Example:
   ```matlab
   [x] = Newton(f, df, x0, tolr, nmax);
Trapezoidal Rule: The Trapezes.m function approximates integrals using the trapezoidal rule. It is used to calculate the time and distance as the object moves through the fluid.

**Example**:

matlab
Copy code
[I] = Trapezes(fa, fb, a, b);
Simulation: The main script Devoir2.m uses both Newton’s method and the trapezoidal rule to simulate the body’s fall in the fluid. The program will generate graphs showing acceleration, velocity, and distance over time.

**Example Output:**
Running Devoir2.m will output the following:

A plot of acceleration vs. velocity
A plot of velocity vs. time
A plot of distance vs. time
Numerical results for the total time and final distance traveled in the fluid.
## File Descriptions
Devoir2.m
The main script that runs the entire simulation.
Calls the Newton.m and Trapezes.m functions to calculate the root of the equation, acceleration, velocity, and distance.
Newton.m
Function to implement Newton’s method for root finding.
Input: Function f, its derivative df, initial guess x0, tolerance tolr, maximum number of iterations nmax.
Output: Solution x and the iterations of the method.
Trapezes.m
Function to perform numerical integration using the trapezoidal rule.
Input: Function values at the boundaries fa, fb, integration limits a, b.
Output: Approximation of the integral.
##Results
After running the scripts, you will get the following:

Time and distance traveled in the fluid
Graphical representations of acceleration, velocity, and distance over time.

## License
This project is for educational purposes and follows standard numerical methods for fluid dynamics. 


