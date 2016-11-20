 FEM Group B
=====
Anna Lischke, Matthew Petersen
------------------------------

### Project: 2D Combustion Modeling Application

## Summary

This application will consist of a GUI (written in Qt), a solver (made using the [MOOSE framework](http://www.mooseframework.com)), and a visualization capacity (via VTK). The application will allow the user to model 2D laminar flames, using  models based off of work done by [Michaelis and Rogg.](http://dx.doi.org/10.1016/j.jcp.2003.10.033). The user will be able to easily take advantage of the world-class FEM capabilities of MOOSE, and be able to quickly and easily generate input files without having to learn MOOSE input syntax. The output files are then able to viewed using [Paraview.](http://www.paraview.org)

To run this project, run `./our_example-opt -i conv_diff.i`

Unfortunately, due to ongoing technical issues, we have not been able to build the application on the CCV itself; the executable was compiled on one of our own machines. The input file is `conv_diff.i` and the output file is `conv_diff_out.e`.

The file structure for the essential files is as follows:

```
fem_b/
├── conv_diff.i // input file
├── conv_diff_out.e // output file
├── include
│   ├── base
│   │   └── FemBApp.h // app skeleton header
│   └── kernels
│       ├── ExampleConvection.h // convection kernel header
│       ├── ExampleDiffusion.h // diffusion kernel header
│       └── ExampleTimeDerivative.h // transient kernel header
├── LICENSE
├── Makefile
├── our_example-opt // executable
├── README.md
└─── src
     ├── base
     │   └─── FemBApp.C // app skeleton
     ├── kernels
     │   ├── ExampleConvection.C // convection kernel
     │   ├── ExampleDiffusion.C // diffusion kernel
     │   └── ExampleTimeDerivative.C // transient kernel
     └── main.C // MOOSE application runner

```

In this repository, all of the files needed to build and run the application are included, with the exception of MOOSE. For MOOSE, go to [its website.](http://www.mooseframework.com)
