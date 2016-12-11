// Time derivative class

#ifndef MYTIMEDERIVATIVE_H
#define MYTIMEDERIVATIVE_H
// MOOSE include
#include "TimeDerivative.h"

// Defines TimeDerivative class
class MyTimeDerivative;

template<>
InputParameters validParams<MyTimeDerivative>();

class MyTimeDerivative : public TimeDerivative
{
public:
// Constructor
    MyTimeDerivative(const InputParameters & parameters);

protected:
// Function for computing the residual
    virtual Real computeQpResidual() override;

// Function for computing the Jacobian
    virtual Real computeQpJacobian() override;

// coefficient to time derivative
    Real _time_coefficient;
};

#endif //MYTIMEDERIVATIVE_H
