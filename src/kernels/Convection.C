// Function definitions for Convection kernel (class)
#include "Convection.h"

// Defines valid parameters for the kernel and their default values
template<>
InputParameters validParams<Convection>()
{
  InputParameters params = validParams<Kernel>();
  params.addRequiredParam<RealVectorValue>("velocity", "Velocity Vector");
  return params;
}

Convection::Convection(const InputParameters & parameters) :
// Constructor of the base class (Kernel)
// Gets user-input velocity vector to use in the convection piece of the variational form
  Kernel(parameters),
   _velocity(getParam<RealVectorValue>("velocity"))
{}

// Residual function for convection
Real Convection::computeQpResidual()
{
  // velocity * _grad_u[_qp] is actually doing a dot product
  return _test[_i][_qp]*(_velocity*_grad_u[_qp]);
}

Real Convection::computeQpJacobian()
{
  // the partial derivative of _grad_u is just _grad_phi[_j]
  return _test[_i][_qp]*(_velocity*_grad_phi[_j][_qp]);
}
