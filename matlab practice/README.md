# ASTRO-USA-Insulated-Sliding-Door-Simulink-Draft

**Disclaimer: Most measurements utilized in this project are assumptions. This is the very first draft of my design and really just a proof of concept. Also, most of these design choices are mostly with affordability in mind, this first draft insulating design is with the ASTRO-USA mini analog habitat in mind. 

**View interactive Simulink model with MATLAB online!**

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://drive.mathworks.com/sharing/49e64220-1bd6-4c26-9256-821b77ccb3d4)



**Simulink model PNG:**
<img width="876" height="511" alt="habitat_door_model" src="https://github.com/user-attachments/assets/0ea42fb7-cc10-41ee-a8c4-6f2d0bee3c6c" />


Parametric 3D geometry generator and thermal/insulation assembly study for an **ASTRO USA Mars Analog Habitat** insulated sliding glass door, built in **MATLAB** with export pipelines for **STL** and **CAD/Simulink** integration.

## Door & Insulation Anatomy
The `habitat_door_cad.m` script programmatically constructs a `60" × 80" × 4.5"` dual-panel sliding environmental shield system consisting of **34 individual physical components**:
* **Structural Framing:** Vinyl main outer frame (`2.0"` thickness) and fixed/sliding door sash profiles (`1.75"` panel thickness) separated by a `0.5"` track offset.
* **Multi-Layer Thermal & Impact Glazing:**
  * Primary glass pane
  * **Barrier 1:** Low-E radiant barrier film (`0.02"`)
  * Inert insulating air gap
  * **Barrier 2:** Impact-resistant polycarbonate shield panel (`0.25"`)
* **Sealing & Coupling Interface:** Self-adhesive steel tape (`0.125"` thick × `1.0"` wide) paired with heavy-duty magnetic coupling tape for perimeter thermal and pressure sealing.

## Interactive Viewing
* **3D Browser Viewer:** Click **`HabitatDoor_Assembly.stl`** in the file list above to rotate, zoom, and inspect the 3D assembly directly in GitHub (although the visuals are terrible).
* **Run Live in Browser:** Click the **Open in MATLAB Online** badge above to launch the workspace in your browser and run `habitat_door_cad.m` (recommended).
* **CAD & Simulink Interoperability:** Uses `HabitatDoor_components.json` bounding-box metadata to export watertight `.stl` meshes ready for STEP conversion or Simscape Multibody import...in theory, I haven't fully tested yet. 

## 📂 Repository Contents
* `HabitatDoor_Assembly.stl` — Combined binary 3D mesh exported for interactive browser rendering and CAD import.
* `HabitatDoor_components.json` — Structured component manifest (`bounds_mm`) for downstream CAD/simulation pipelines.
* `README.md` — Project documentation and technical specifications.
* `habitat_door_cad.m` — Parametric MATLAB script generating the 3D assembly, material color/transparency layers, and component JSON metadata.
