 FEM Group B
=====
Anna Lischke, Matthew Petersen
------------------------------

### Project: 2D Fluid-Thermal Transport Modeling Application

## Summary

This application will consist of a GUI (written in FLTK), a solver (made using the [MOOSE framework](http://www.mooseframework.com)), and a visualization capacity (via VTK). The application will allow the user to model 2D fluid transport with thermal conductivity, using  simplified models based off of work done by [Michaelis and Rogg.](http://dx.doi.org/10.1016/j.jcp.2003.10.033). The user will be able to easily take advantage of the world-class FEM capabilities of MOOSE, and be able to quickly and easily generate input files without having to learn MOOSE input syntax. The output files are then able to viewed using [Paraview.](http://www.paraview.org)

Unfortunately, due to ongoing technical issues, we have not been able to build the application on the CCV itself; the executable was compiled on one of our own machines. The input file is `input_transport.i`.

To use the software application, the user must install the MOOSE framework and build it on their machine. Instructions can be found on the [MOOSE Getting Started page](http://mooseframework.com/getting-started/). Once that is done, the user should build the application on their machine, by running the `make_app.sh` bash script.

When that is done, the user can launch the GUI by running the "fem_b_gui" excutable in the application directory. This will bring up an interactive interface for generating program input files.

![fem_b GUI](https://github.com/ENGN2912B/fem_b/blob/master/GUI_fem_b.png "GUI Used to generate input file")

# GUI

In the GUI, the user may input the relevant parameters for their desired simulation. The simulation is designed to model convection-diffusion of gas in addition to heat conduction in two dimensions. In order to run the simulation, input parameters and a source function definition are required. These are collected in an input file with extension .i. The GUI generates the input file automatically when the user inputs valid parameter values and pushes the submit button. Below, we discuss the individual items involved in the GUI.

The user may upload their own input file from the input file location box. This feature enables users to avoid entering parameter values in the GUI if they want to use the same input file they generated previously.

Otherwise, the user should type the name of their new input file including the ".i" extension in the "New Input File Name" box.

The GUI generates a rectangular, triangulated mesh with the number of X- and Y- elements user-specified in the lower right hand section of the GUI. The "X Max" and "Y Max" refer to the upper right hand corner coordinates of the mesh.

If the user wants to use a different 2D mesh (e.g., graded mesh, quadrilateral mesh, etc.), this can be uploaded using the "Mesh File Location" box. The file type for the mesh input file is ".e".

In the "Simulation Parameters" section, the user enters the desired wall temperature on the bottom and top boundaries of the mesh. These values are only applied if the "Isothermal" radio buttons are selected. The inlet temperature is specified on the left boundary, and is required to be a Dirichlet (isothermal) boundary condition. If the user selects adiabatic boundary conditions on the radio buttons, the simulation will have zero flux across that boundary.

The forcing function corresponds to heat sinks and sources arising from chemical reactions. An example forcing function is "1+x" or "sin(pi*x)".
The file structure for the essential files is as follows:

```
fem_b
├── GUI
│   ├── bin
│   │   ├── default.i
│   │   ├── fem_b_gui
│   │   ├── test.e
│   │   ├── test.i
│   │   └── test2.i
│   ├── inputtest.i
│   ├── makefile
│   └── src
│       ├── fem_b_gui.cxx
│       ├── fem_b_gui.f
│       ├── fem_b_gui.h
│       ├── fem_b_gui_test.cxx
│       └── gui_main.cpp
├── Makefile
├── README.md
├── coupled-opt // executable
├── include // header files
│   ├── base
│   │   └── TransportApp.h // skeleton header
│   ├── functions
│   │   └── MyFunction.h // source function kernel header
│   └── kernels
│       ├── Convection.h // fluid convection kernel header
│       ├── HeatConduction.h // heat conduction kernel header
│       ├── HeatConductionTimeDerivative.h // heat conduction transient kernel header
│       ├── MyDiffusion.h // fluid diffusion kernel header
│       └── MyTimeDerivative.h // fluid transient kernel header
├── input_transport.i // input file
├── lib // container file for peacock-generated cache
└── src
    ├── base
    │   └── TransportApp.C // skeleton definitions (collects kernels)
    ├── functions
    │   └── MyFunction.C // source function kernel definition
    ├── kernels
    │   ├── Convection.C // fuild convection kernel
    │   ├── HeatConduction.C // heat conduction kernel
    │   ├── HeatConductionTimeDerivative.C // heat conduction transient kernel
    │   ├── MyDiffusion.C // fluid diffusion kernel
    │   └── MyTimeDerivative.C // fluid transient kernel
    └── main.C // MOOSE application runner

```

In this repository, all of the files needed to build and run the application are included, with the exception of MOOSE. For MOOSE, go to [its website.](http://www.mooseframework.com)
