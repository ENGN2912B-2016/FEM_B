// Function definitions for MyDiffusion kernel
#include "MyDiffusion.h"

template<>
InputParameters validParams<MyDiffusion>()
{
  InputParameters params = validParams<Diffusion>(); // The Diffusion kernel is a MOOSE built-in
  // Here we will look for a parameter from the input file; the default value of the diffusion coefficient is 1.0
  params.addParam<Real>("diffusivity", 1.0, "Diffusivity Coefficient");
  return params;
}

MyDiffusion::MyDiffusion(const InputParameters & parameters) :
// Initialize our member variable (diffusion coefficient) based on input file
    Diffusion(parameters),
    _diffusivity(getParam<Real>("diffusivity"))
{}

Real
MyDiffusion::computeQpResidual()
{
// computes residual (called from MOOSE kernel 'Diffusion') multiplied by user-input diffusivity
  return _diffusivity*Diffusion::computeQpResidual();
}

Real
MyDiffusion::computeQpJacobian()
{
// computes Jacobian (called from MOOSE kernel 'Diffusion') multiplied by user-input diffusivity
  return _diffusivity*Diffusion::computeQpJacobian();
}
