#ifndef FEM_BAPP_H
#define FEM_BAPP_H

#include "MooseApp.h"

class FemBApp;

template<>
InputParameters validParams<FemBApp>();

class FemBApp : public MooseApp
{
public:
  FemBApp(InputParameters parameters);
  virtual ~FemBApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* FEM_BAPP_H */
