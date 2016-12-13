 FEM Group B
=====
Anna Lischke, Matthew Petersen
------------------------------

### Project: 2D Fluid-Thermal Transport Modeling Application

## Summary

This application will consist of a GUI (written in FLTK), a solver (made using the [MOOSE framework](http://www.mooseframework.com)), and a visualization capacity (via VTK). The application will allow the user to model 2D fluid transport with thermal conductivity, using  simplified models based off of work done by [Michaelis and Rogg.](http://dx.doi.org/10.1016/j.jcp.2003.10.033). The user will be able to easily take advantage of the world-class FEM capabilities of MOOSE, and be able to quickly and easily generate input files without having to learn MOOSE input syntax. The output files are then able to viewed using [Paraview.](http://www.paraview.org)

Unfortunately, due to ongoing technical issues, we have not been able to build the application on the CCV itself; the executable was compiled on one of our own machines. The input file is `input_transport.i`.

To use the software application, the user must install the MOOSE framework and build it on their machine. Instructions can be found on the [MOOSE Getting Started page](http://mooseframework.com/getting-started/). To build the GUI, the user must also have the FLTK GUI framework installed, which comes with [installation instructions](http://www.fltk.org/doc-1.3/intro.html). FLTK is installed on the CCV. Once that is done, the user should build the application on their machine, by running the `make_app.sh` bash script. 

When that is done, the user can launch the GUI by running the "fem_b_gui" excutable in the application directory. This will bring up an interactive interface for generating program input files.

![fem_b GUI](https://github.com/ENGN2912B/fem_b/blob/master/GUI_fem_b.png "GUI Used to generate input file")

## GUI

## Running the Application

To run the application, the user uses the following syntax: `./coupled-opt -i MyInputFile.i`. The built-in MOOSE executioner will take the input file and follow its instructions to run the MOOSE solvers. The user can then use the MOOSE executioner (a GUI called Peacock) to view their results, or read the output data (stored in `peacock_run_tmp_out.e`) using an Exodus-format compatible data viewer, such as ParaView.

In the GUI, the user may input the relevant parameters for their desired simulation. The simulation is designed to model convection-diffusion of gas in addition to heat conduction.

The file structure for the essential files is as follows:

```
fem_b
├── GUI
│   ├── makefile
│   └── src
│       ├── fem_b_gui.cxx
│       ├── fem_b_gui.f
│       ├── fem_b_gui.h
│       ├── fem_b_gui_test.cxx
│       └── gui_main.cpp
├── fem_b_gui // GUI executable
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
├── input_transport.i // sample input file
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
