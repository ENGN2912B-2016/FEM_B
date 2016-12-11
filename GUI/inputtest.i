[Mesh]
type = GeneratedMesh
dim = 2
nx = 
ny = 
nz = 0

xmax = 
ymax = 
zmax = 0
elem_type = TRI3
[]

[Variables]
[./temp]
[../]
[./convdiff]
order = FIRST
family = LAGRANGE
[../]
[]

[Functions]
[./forcing_func]
type = ParsedFunction
value = 
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
[./conv]
type = Convection
variable = convdiff
velocity = '  0.0'
[../]
[./diff]
type = MyDiffusion
variable = convdiff
[../]
[./euler]
type = MyTimeDerivative
variable = convdiff
time_coefficient = 
[../]
[./forcing]
type = UserForcingFunction
variable = temp
function = forcing_func
[../]
[]

[BCs]
[./left]
type = DirichletBC
variable = temp
boundary = left
value = 
[../]
[./top]
type = DirichletBC
variable = temp
boundary = top
value = -20
[../]
[./bottom]
type = DirichletBC
variable = temp
boundary = bottom
value = 
[../]
[./right]
type = NeumannBC
variable = temp
boundary = right
[../]
[./left_diffused]
type = DirichletBC
variable = temp
boundary = left
value = 1.0
[../]
[./top_diffused]
type = DirichletBC
variable = temp
boundary = top
value = 0.0
[../]
[./bott_diffused]
type = DirichletBC
variable = temp
boundary = bottom
value = 0.0
[../]
[]

[Materials]
[./k]
type = GenericConstantMaterial
prop_names = 'thermal_conductivity'
prop_values = ''
block = 0
[../]
[./cp]
type = GenericConstantMaterial
prop_names = 'specific_heat'
prop_values = ''
block = 0
[../]
[./rho]
type = GenericConstantMaterial
prop_names = 'density'
prop_values = ''
block = 0
[../]
[]

[Executioner]
type = Transient
solve_type = 'PJFNK'
num_steps = 
dt = 
[]

[Outputs]
execute_on = 'timestep_end'
exodus = true
[]