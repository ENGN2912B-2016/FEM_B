[Mesh]
file = test.e
[]

[Variables]
[./temp]
[../]
[]

[Kernels]
[./hc]
 type = HeatConduction
 variable = temp
[../]

[./HeatTdot]
type = HeatConductionTimeDerivative
variable = temp
[../]
[]

[BCs]
[Materials]
[./k]
type = GenericConstantMaterial
prop_names = 'thermal_conductivity'
prop_values = '100'
block = 0
[../]
[./cp]
type = GenericConstantMaterial
prop_names = 'specific_heat'
prop_values = '100'
block = 0
[../]
[./rho]
type = GenericConstantMaterial
prop_names = 'density'
prop_values = '100'
block = 0
[../]
[]

[Executioner]
type = Transient
solve_type = 'PJFNK'
num_steps = 100
dt = 1
[]

[Outputs]
execute_on = 'timestep_end'
exodus = true
[]