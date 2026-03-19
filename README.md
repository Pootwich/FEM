# Finite Element Method (FEM) Truss Solver & GUI

A MATLAB-based suite for solving static linear elastic problems in truss structures. This project features a robust numerical engine and an interactive **MATLAB App** for real-time design, file import, and visualization.

## 🚀 Features

### 🛠 The FEM Engine
* **Automated Assembly:** Generates global stiffness matrices from element-level properties.
* **Static Solver:** Partitions the system ($KU = F$) to solve for unknown displacements and reaction forces.
* **Stress Analysis:** Calculates axial stress ($\sigma = E \cdot \epsilon$) for every member based on nodal displacement.

### 🖥 The Interactive App (`app1.mlapp`)
* **Real-time Plotting:** Visualize your truss geometry instantly as you add nodes and elements.
* **Excel Integration:** Import complex geometries from `.xlsx` files with automatic plot refreshing.
* **Customization:** * Adjust node/element scales via interactive sliders.
    * Toggle Node Labels for better visibility.
    * Switch between colormaps (**Jet**, **Parula**, **Bone**) for visual depth.

---

## 📊 Mathematical Framework

The solver utilizes the local-to-global transformation of the element stiffness matrix $k_e$:

$$
k_e = \frac{EA}{L} \begin{bmatrix} 
C^2 & CS & -C^2 & -CS \\ 
CS & S^2 & -CS & -S^2 \\ 
-C^2 & -CS & C^2 & CS \\ 
-CS & -S^2 & CS & S^2 
\end{bmatrix}
$$

**Where:**
* $C = \cos(\theta) = \frac{x_2 - x_1}{L}$
* $S = \sin(\theta) = \frac{y_2 - y_1}{L}$

---

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| `FEM_UI.m` | The MATLAB App Designer class containing the GUI logic. |
| `main.m` | Script-based entry point for full numerical analysis. |
| `element_stiffness.m` | Function to compute the $4 \times 4$ local stiffness matrix. |
| `assemble_stiffness.m` | Function to construct the global stiffness matrix $K$. |
| `assign_BCs.m` | Defines geometry, constraints (DOCs), and degrees of freedom (DOFs). |
| `post_process.m` | Handles deformed vs. undeformed plotting and stress heatmaps. |

---

## 📥 Getting Started

### Prerequisites
* **MATLAB R2020a** or later (required for App Designer components).
* **Excel** (if using the spreadsheet import feature).

### Excel Import Format
To use the **Read NL & EL** button, ensure your `.xlsx` file is formatted as follows (no headers required):

| Col A (Node X) | Col B (Node Y) | Col C (Elem Node 1) | Col D (Elem Node 2) |
| :--- | :--- | :--- | :--- |
| 0 | 0 | 1 | 2 |
| 1 | 0 | 2 | 3 |
| 0.5 | 1 | 3 | 1 |

### Troubleshooting: File Paths
When importing Excel files, the App uses `fullfile` to generate absolute paths. Ensure the `.xlsx` file is not currently open in another program (like Excel) to avoid permission errors.

---

## 🛠 Usage
1. **Interactive GUI:** Open `app1.mlapp` in MATLAB and click **Run**, or type `app1` in the Command Window.
2. **Batch Script:** Edit coordinates and properties in `main.m` and run the script for detailed stress-strain output.
