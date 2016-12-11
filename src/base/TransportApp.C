// Functions definitions for building the Transport App.
#include "TransportApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "MooseSyntax.h"
#include "MyDiffusion.h"
#include "Convection.h"
#include "MyTimeDerivative.h"
#include "MyFunction.h"
#include "HeatConduction.h"
#include "HeatConductionTimeDerivative.h"

// Define TansportApp class and register appropriate kernels
template<>
InputParameters validParams<TransportApp>()
{
  InputParameters params = validParams<MooseApp>();
  params.set<bool>("use_legacy_uo_initialization") = false;
  params.set<bool>("use_legacy_uo_aux_computation") = false;
  return params;
}

// Constructor
TransportApp::TransportApp(const InputParameters & parameters) :
    MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  TransportApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  TransportApp::associateSyntax(_syntax, _action_factory);
}

// Deconstructor
TransportApp::~TransportApp()
{
}

// External entry point for dynamic application loading
extern "C" void TransportApp__registerApps() { TransportApp::registerApps(); }
void
TransportApp::registerApps()
{
  registerApp(TransportApp);
}

// Register Kernels used in transport and heat conduction equation with the source term
// extern "C" makes the function name use "C" linkage so the compiler will use the C-compatible header file
extern "C" void TransportApp__registerObjects(Factory & factory) { TransportApp::registerObjects(factory); }
void
TransportApp::registerObjects(Factory & factory)
{
    registerNamedKernel(HeatConductionKernel, "HeatConduction");
    registerKernel(HeatConductionTimeDerivative);
    registerKernel(MyDiffusion);
    registerKernel(Convection);
    registerKernel(MyTimeDerivative);
    registerKernel(MyFunction);
}

// External entry point for dynamic syntax association
extern "C" void TransportApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { TransportApp::associateSyntax(syntax, action_factory); }
void TransportApp::associateSyntax(Syntax & syntax, ActionFactory & action_factory){}
