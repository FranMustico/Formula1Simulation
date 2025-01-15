# Reto Pista Canada

## Overview
**Reto Pista Canada** is a MATLAB-based program that models and simulates the dynamics of a race track. It uses mathematical modeling and visualization techniques to calculate and display various physical parameters, providing an engaging way to analyze vehicle performance on the track. The program emphasizes the calculation of curvature radius, maximum speeds, and other related metrics.

## Features

### Dynamic Modeling
- Calculates the curvature radius and maximum speeds based on user-defined parameters such as:
  - Coefficient of friction.
  - Track inclination angle.
  - Gravitational acceleration.

### Polynomial Curve Fitting
- Fits a cubic polynomial to track points, providing a smooth representation of the race track.
- Derives first and second derivatives for curvature and radius calculations.

### Visual Simulation
- Simulates the vehicle's path along the track with animated markers.
- Displays the trajectory in a visually appealing plot with:
  - Track boundaries.
  - Gradation zones for different curves.
  - Highlighted key points (start, end, and significant turns).

### Real-Time Calculations
- Dynamically calculates:
  - Radius of curvature at each point.
  - Maximum speed without banking (peralte).
  - Maximum speed with banking.
- Outputs results in both meters per second (m/s) and kilometers per hour (km/h).

### Results Table
- Generates a comprehensive results table with the following columns:
  - X and Y coordinates.
  - Radius of curvature.
  - Maximum speed without banking (in m/s and km/h).
  - Maximum speed with banking (in m/s and km/h).

### User Interface
- Displays annotations on the simulation, such as:
  - Current X and Y coordinates.
  - Calculated speeds and curvature data.
  - Labels for key zones (e.g., "Primer Grada" and "Segunda Grada").

## How to Use
1. Run the script `RetoPistaCanada.m` in MATLAB.
2. The simulation will start, displaying the track and dynamic calculations.
3. View the output table for detailed results after the simulation ends.
4. Validate the modeled function with initial and final points to ensure accuracy.

## File Structure
- **`RetoPistaCanada.m`**: Main script containing the program logic.
- **Input Data**: Defined within the script for track points and parameters.
- **Output**:
  - Graphical simulation of the track and vehicle movement.
  - Results table displayed in the MATLAB console.

## Purpose
This project demonstrates the application of mathematical modeling and dynamic simulations to real-world problems. It highlights the integration of physics, engineering, and computational techniques for analyzing race track performance.

## Acknowledgments
- **MATLAB Toolboxes**: For polynomial fitting and data visualization.
- Guidance from mentors and peers in developing and refining the simulation.
