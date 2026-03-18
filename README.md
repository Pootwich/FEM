Finite Element Method (FEM) Truss Solver

A MATLAB-based Finite Element Analysis tool designed to solve static linear elastic problems for truss structures. The solver calculates global displacements, reaction forces, and internal stresses, providing a visual comparison between the undeformed and deformed configurations.
## Features

    Automated Assembly: Generates global stiffness matrices from element-level properties.

    Boundary Condition Handling: Supports both Essential (Dirichlet) and Natural (Neumann) boundary conditions.

    Static Solver: Partitions the global system of equations (KU=F) to solve for unknown displacements and reaction forces.

    Post-Processing: Visualizes the mesh with node and element numbering.

        Plots the deformed shape with a user-defined magnification factor (mag).

        Stress Heatmap: Uses a color-coded gradient (stress distribution) on elements based on axial strain.

## Project Structure

    main.m: The entry point script containing preprocessing parameters, the solution algorithm, and the post-processing call.

    assign_BCs.m: Defines the geometry, constraints, and external loads.

    assemble_stiffness.m: Iterates through elements to build the global stiffness matrix.

    element_stiffness.m: Computes the 4×4 local stiffness matrix for a 2D truss element.

    assemble_forces.m & assemble_displacements.m: Organizes known boundary values into vectors.

    update_nodes.m: Maps the solution back to the Extended Node List (ENL) for plotting.

    post_process.m: Handles the graphical output using MATLAB's plotting and surface functions.

## Getting Started
### Prerequisites

    MATLAB (R2018a or later recommended).

### Usage

    Clone or download the repository files into a single folder.

    Open main.m.

    Adjust the material properties (E, A) and the geometry in NL and EL if desired.

    Run the script.

### Element Stiffness Matrix
The local stiffness matrix $k_e$ for each truss element is defined as:

$$
k_e = \frac{EA}{L} \begin{bmatrix} 
C^2 & CS & -C^2 & -CS \\ 
CS & S^2 & -CS & -S^2 \\ 
-C^2 & -CS & C^2 & CS \\ 
-CS & -S^2 & CS & S^2 
\end{bmatrix}
$$

Where:
* $C = \cos(\theta) = \frac{x_2 - x_1}{L}$
* $S = \sin(\theta) = \frac{y_2 - y_1}{L}$

## Example Visualization

When executed, the program generates a figure showing:

    Light Grey Lines: The original, undeformed truss.

    Colored Solid Lines: The deformed truss, where the color represents the magnitude of axial stress (σ).

    Nodes: Highlighted points indicating the new equilibrium positions.
