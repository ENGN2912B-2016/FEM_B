// Defines default values and functions for source function given from input file

#include "MyFunction.h"

template<>
InputParameters validParams<MyFunction>()
{
  InputParameters params = validParams<Function>(); // Function is a MOOSE-defined kernel
  params.addParam<Real>("alpha", 1.0, "Value of alpha"); // Default value of alpha is 1.0
  return params;
}

MyFunction::MyFunction(const InputParameters & parameters) :
    Function(parameters),
    _alpha(getParam<Real>("alpha")) // define parameter alpha to be used in default function in input file
{}

// Default source function
Real MyFunction::value(Real /*t*/, const Point & p)
{
  return _alpha*_alpha*libMesh::pi*libMesh::pi*std::sin(_alpha*libMesh::pi*p(0));  // p(0) == x
}
