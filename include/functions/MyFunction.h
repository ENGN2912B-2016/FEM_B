// Kernel for defining source function

#ifndef MYFUNCTION_H
#define MYFUNCTION_H

// MOOSE include
#include "Function.h"

// Defines class for user-input source function
// This function is meant to include sources/sinks for chemical combustion
class MyFunction;

template<>
InputParameters validParams<MyFunction>();

class MyFunction : public Function
{
public:
  MyFunction(const InputParameters & parameters);
// Assigns point (x,y,z) values from mesh to variables 'x' 'y' 'z' which can be used in the user-input function definition  
  virtual Real value(Real t, const Point & p) override;

protected:
// coefficient used in default source function (defined in .C file)
  Real _alpha;
};

#endif //MYFUNCTION_H
