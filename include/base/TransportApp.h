// Class defines transport application and includes all kernels and function definitions

#ifndef TRANSPORTAPP_H
#define TRANSPORTAPP_H

#include "MooseApp.h"

// Class designed to register kernels defined in include and src directories
// Builds TransportApp
class TransportApp;

template<>
InputParameters validParams<TransportApp>();

class TransportApp : public MooseApp
{
public:
  TransportApp(const InputParameters & parameters);
  virtual ~TransportApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* TRANSPORTAPP_H */
