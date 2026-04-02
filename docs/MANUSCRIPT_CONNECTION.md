# Manuscript connection

## Core statement
> This repository provides the author-generated MATLAB workflow, representative inputs, and representative outputs for the spot-analysis and simulation-comparison component of the manuscript, but does not yet reproduce the full paper-level simulation search space.

## Main connection to the paper
This repository is most directly linked to the **Fig. 4 computational workflow**. In the manuscript, Fig. 4 presents the paired-localisation and diameter-simulation analysis for NPC structure. The code and bundled examples here correspond to the analysis branch that:
- imports two-colour spot information derived from microscopy images;
- quantifies spot number, density, intensity, distance, and two-colour matching;
- analyses representative random-position localisation simulations; and
- supports comparison between experimental and simulated distributions.

## What is represented here
The repository contains:
- one representative experimental image-analysis example;
- one representative simulation-location example; and
- representative exported outputs for both branches.

This is enough to document the workflow logic, file types, required order of preprocessing and analysis, and the main computational connection to Fig. 4.

## What is not fully represented here
The full manuscript-level search involved many more image-analysis inputs and **100,000+ simulations**. Those larger-scale runs are not bundled in this public package. The repository should therefore be described as a **representative worked example package for the Fig. 4-linked computational branch**, not as a complete one-click reconstruction of the paper.
