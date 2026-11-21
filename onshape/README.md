# ASTRO-USA Insulated Sliding Door Assembly (Onshape CAD)

<img width="1768" height="1012" alt="Screenshot 2026-11-20 185559" src="https://github.com/user-attachments/assets/04b01199-76e3-4fa2-ab4b-4b32358d6478" />


<img width="1610" height="1240" alt="Screenshot 2026-11-20 185644" src="https://github.com/user-attachments/assets/27cba672-31a1-41fa-8957-0cc7a6788028" />

Production 3D CAD assembly and multi-layer thermal insulation retrofit for Purdue University's **SEARCH (Space and Earth Analog Research Chapter)** ASTRO-USA analog habitat sliding glass door.

🔗 **[View Live Interactive Model in Onshape](https://cad.onshape.com/documents/b0a0fcfa8eb659771aa6243c/w/abda76710513e2f54de0e4dc/e/8670c40f6429cf9780c1c587?renderMode=0&uiState=6b00e16959958933a66fcc0e)**

---

## Overview
Engineered to roughly fit a standard **60" × 80" JELD-WEN V-4500** sliding vinyl patio door frame (configured for left-handed operation), this assembly provides an affordable, modular thermal barrier and draft seal while maintaining full sliding door functionality.

### Design Anatomy
* **Structural Door Frame & Factory Low-E Glazing:** Modeled around the existing uPVC (vinyl) outer frame and fixed/sliding sash geometry (`13` assembly instances with planar/slider mates), utilizing the door's built-in factory Low-E glass coating to limit radiative heat transfer.
* **Flush-Mounted Polycarbonate Glazing Panels:** Rigid, impact- and UV-resistant (UVA/UVB-blocking) polycarbonate sheets sized to sit **flush within the door jamb**. Creating a sealed 1/4" inch dead-air pocket over the glass significantly reduces conductive and convective heat loss, and translucent/frosted polycarbonate options allow the panels to double as privacy shades when visibility through the door is undesired.
* **Glass-Mounted Magnetic Retention & Quick-Release Tab:**
  * **Steel Receiver Tape (~1/8 in):** Adhered directly to the perimeter of the **glass pane** so the panel sits flush inside the jamb without obstructing the sliding sash track.
  * **Magnetic Coupling Strips (~1/8 in) & Bottom Finger Tab:** Paired with the glass-mounted steel receiver tape for a repeatable perimeter compression seal. An integrated **finger tab at the bottom edge** allows crew members to easily pull the panel off and pop it back into place without tools.

---

## 📂 Folder Contents
* `Left handed Assembly(Final Product).step` — Neutral STEP assembly export for full-precision inspection and modification in SolidWorks, Fusion 360, Inventor, or Onshape.
* `Left handed Assembly(Final Product).stl` — Tessellated 3D mesh for quick browser viewing directly on GitHub or 3D printing/visualization.
* `README.md` — Assembly documentation and hardware specifications.

---

## Related Work
* **Parametric MATLAB & Simulink Thermal Model:** See the [`../matlab`](../matlab) directory for the initial parametric geometry generator (`habitat_door_cad.m`) and thermal/insulation simulation model (Why matlab? I have to learn it for my class so it was just some practice)
