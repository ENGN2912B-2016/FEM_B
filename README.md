FEM Group B
=====
Anna Lischke, Matthew Petersen
------------------------------

### Project: 2D Combustion Modeling Application

## Summary

This application will consist of a GUI (written in Qt), a solver (made using the [MOOSE framework](http://www.mooseframework.com)), and a visualization capacity (via VTK). The application will allow the user to model 2D laminar flames, using  models based off of work done by [Michaelis and Rogg.](http://dx.doi.org/10.1016/j.jcp.2003.10.033). The user will be able to easily take advantage of the world-class FEM capabilities of MOOSE, and be able to quickly and easily generate input files without having to learn MOOSE input syntax.

To run this project, run `our_example-opt -i conv_diff.i`

Unfortunately, due to ongoing technical issues, we have not been able to build the application on the CCV itself; the executable was compiled on one of our own machines. The input file is `conv_diff.i` and the output file is `conv_diff_out.e`.

The file structure for the essential files is as follows:

```
fem_b
|
|------src
|      	|------base
|      	|      	|
|      	|      	| FemBApp.C // Application skeleton source
|      	|      
|      	|------kernels
|      	|      	|
|      	|      	| ExampleConvection.C // Convection kernel
|      	|      	| ExampleDiffusion.C // Diffusion kernel
|      	|      	| ExampleTimeDerivative.C // Transient kernel
|      	|      
|       | main.C // MOOSE application runner
|
|------include
      	|------base
      	|      	|
      	|      	| FemBApp.h // Application skeleton header
      	|      
      	|------kernels
      	      	|
      	      	| ExampleConvection.h // Convection kernel header
      	      	| ExampleDiffusion.h // Diffusion kernel header
      	      	| ExampleTimeDerivative.h // Transient kernel header
```

In this repository, all of the files needed to build and run the application are included, with the exception of MOOSE. For MOOSE, go to [its website.](http://www.mooseframework.com)
