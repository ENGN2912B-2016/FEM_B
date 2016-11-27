/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "HeatConductionApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"

#include "HeatConduction.h"
#include "HeatConductionTimeDerivative.h"

template<>
InputParameters validParams<HeatConductionApp>()
{
  InputParameters params = validParams<MooseApp>();
  params.set<bool>("use_legacy_uo_initialization") = false;
  params.set<bool>("use_legacy_uo_aux_computation") = false;
  return params;
}

// Set up Heat Conduction Application
HeatConductionApp::HeatConductionApp(const InputParameters & parameters) :
    MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  HeatConductionApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  HeatConductionApp::associateSyntax(_syntax, _action_factory);
}

//Deconstructor
HeatConductionApp::~HeatConductionApp()
{
}

// External entry point for dynamic application loading
extern "C" void HeatConductionApp__registerApps() { HeatConductionApp::registerApps(); }
void
HeatConductionApp::registerApps()
{
  registerApp(HeatConductionApp);
}

// Register Kernels used in heat conduction equation
extern "C" void HeatConductionApp__registerObjects(Factory & factory) { HeatConductionApp::registerObjects(factory); }
void
HeatConductionApp::registerObjects(Factory & factory)
{
  registerNamedKernel(HeatConductionKernel, "HeatConduction");

  registerKernel(HeatConductionTimeDerivative);

}

// External entry point for dynamic syntax association
extern "C" void HeatConductionApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { HeatConductionApp::associateSyntax(syntax, action_factory); }
void
HeatConductionApp::associateSyntax(Syntax & syntax, ActionFactory & action_factory)
{

}
