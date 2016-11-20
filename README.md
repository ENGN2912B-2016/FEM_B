FEM Group B
=====
Anna Lischke, Matthew Petersen
------------------------------

Project: 2D Combustion Modeling Application

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

In this repository, all of the files needed to build and run the application are included, with the exception of MOOSE. For MOOSE, go to [its website.]{http://www.mooseframework.com}
