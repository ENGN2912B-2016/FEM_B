// Defines the class and parameters for the convection piece of the variational form

#ifndef CONVECTION_H
#define CONVECTION_H

#include "Kernel.h"

//Declare the validParams() function before defining the class

class Convection;

// validParams returns the parameters that this Kernel accepts / needs
template<>
InputParameters validParams<Convection>();

//Define the Kernel for a convection operator with the form:
// (V . grad(u), test) where V is a given constant velocity field.

class Convection : public Kernel
{
public:

// Constructor Declaration
Convection(const InputParameters & parameters);

protected:
// Computes the residual at one quadrature point
    virtual Real computeQpResidual() override;

// Computes the diagonal block of the preconditioning matrix.
    virtual Real computeQpJacobian() override;

private:
// Vector for velocity
    RealVectorValue _velocity;
};

#endif // CONVECTION_H
