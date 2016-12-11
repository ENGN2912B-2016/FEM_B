// Defines the heat conduction time derivative -- incorporates material properties specific heat and density multiplying the time derivative

#ifndef HEATCONDUCTIONTIMEDERIVATIVE_H
#define HEATCONDUCTIONTIMEDERIVATIVE_H

#include "TimeDerivative.h"

// MOOSE include
#include "Material.h"

// Class that defines the time derivative in the heat equation
// \rho * c_p * \frac{\partial T}{partial t}
// \rho and c_p are material properties density and specific heat

class HeatConductionTimeDerivative;

template<>
InputParameters validParams<HeatConductionTimeDerivative>();

class HeatConductionTimeDerivative : public TimeDerivative
{
public:
  // Contructor for heat equation time derivative
    HeatConductionTimeDerivative(const InputParameters & parameters);

protected:
  // Compute the residual
    virtual Real computeQpResidual();

  // Compute the jacobian
    virtual Real computeQpJacobian();

    const MaterialProperty<Real> & _specific_heat;
    const MaterialProperty<Real> & _density;
};

#endif //HEATCONDUCTIONTIMEDERIVATIVE_H
