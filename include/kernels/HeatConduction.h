// Defines the class and parameters for the heat conduction piece of the variational form 


#ifndef HEATCONDUCTIONKERNEL_H
#define HEATCONDUCTIONKERNEL_H

#include "Diffusion.h"
#include "Material.h"

//Forward Declarations
class HeatConductionKernel;

template<>
InputParameters validParams<HeatConductionKernel>();

// There is a HeatConduction namespace, so this kernel is named 'HeatConductionKernel' instead
class HeatConductionKernel : public Diffusion
{
public:
// Constructor
    HeatConductionKernel(const InputParameters & parameters);

protected:
// Residual and Jacobian functions
    virtual Real computeQpResidual();

    virtual Real computeQpJacobian();

private:
// Dimension variable, diffusion coefficient, and time derivative of diff coeff
    const unsigned _dim;
    const MaterialProperty<Real> & _diffusion_coefficient;
    const MaterialProperty<Real> * const _diffusion_coefficient_dT;
};

#endif //HEATCONDUCTIONKERNEL_H
