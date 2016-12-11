// Defines the diffusion class and parameters for the diffusion piece of the variational form

#ifndef MYDIFFUSION_H
#define MYDIFFUSION_H

#include "Diffusion.h"

// MOOSE include
class Diffusion;

// Extends the Diffusion kernel to multiply by a coefficient read from the input file
 
template<>
InputParameters validParams<Diffusion>();

class MyDiffusion : public Diffusion
{
public:

    MyDiffusion(const InputParameters & parameters);

protected:
    virtual Real computeQpResidual() override;

    virtual Real computeQpJacobian() override;

// Diffusion coefficient read from the input file
    Real _diffusivity;
};
#endif //MYDIFFUSION_H
