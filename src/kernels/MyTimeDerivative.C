// Defines functions used to compute time derivative piece of variational form

#include "MyTimeDerivative.h"

#include "Material.h"

template<>
InputParameters validParams<MyTimeDerivative>()
{
  InputParameters params = validParams<TimeDerivative>();
  params.addParam<Real>("time_coefficient", 1.0, "Time Coefficient"); // 1.0 is default coefficient
  return params;
}

MyTimeDerivative::MyTimeDerivative(const InputParameters & parameters) :
    TimeDerivative(parameters),
    // This kernel expects an input parameter named "time_coefficient"
    _time_coefficient(getParam<Real>("time_coefficient"))
{}

//_time_coefficient comes from input file, uses MOOSE pre-defined TimeDerivative kernel

Real MyTimeDerivative::computeQpResidual()
{
  return _time_coefficient*TimeDerivative::computeQpResidual();
}

Real MyTimeDerivative::computeQpJacobian()
{
  return _time_coefficient*TimeDerivative::computeQpJacobian();
}
