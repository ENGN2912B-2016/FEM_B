#Generate rectangular mesh with 20 triangular elements along each direction (2d)
[Mesh]
type = GeneratedMesh
dim = 2
nx = 20.1
ny = 20
nz = 0

xmax = 40
ymax = 40
zmax = 0
elem_type = TRI3
[]

# Initialize temperature as variable 'temp'
[Variables]
[./temp]
[../]
[./convdiff]
order = FIRST
family = LAGRANGE
[../]
[]

[Functions]
# A ParsedFunction allows us to supply analytic expressions
# directly in the input file
[./forcing_func]
type = ParsedFunction
value = 1
[../]

[]

# Use HeatConduction kernel (diffusion with thermal conductivity coefficient)
# Use HeatConductionTimeDerivative (time derivative with density and specific heat coefficients)
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
  velocity = '1.0 0.0 0.0'
[../]

[./diff]
  type = MyDiffusion
  variable = convdiff
[../]

[./euler]
  type = MyTimeDerivative
  variable = convdiff
  time_coefficient = 20.0
[../]

# This Kernel can take a function name
[./forcing]
type = UserForcingFunction
variable = temp
function = forcing_func
[../]
[]

# Set up inlet and isothermic boundary conditions (Dirichlet boundaries on left, top, and bottom of domain)
[BCs]
# Left side temperature boundary condition
[./left]
type = DirichletBC
variable = temp
boundary = left
value = 300
[../]
# Left side BC for convdiff variable
[./left_diffused]
type = DirichletBC
variable = convdiff
boundary = 'left'
value = 1
[../]
[./bottom_diffused]
type = DirichletBC
variable = convdiff
boundary = 'bottom'
value = 0
[../]
[./top_diffused]
type = DirichletBC
variable = convdiff
boundary = 'top'
value = 0
[../]
[./top]
 type = DirichletBC
 variable = temp
 boundary = top
 value = 300
[../]
[./bottom]
 type = DirichletBC
 variable = temp
 boundary = bottom
 value = 300
[../]
[]

# Set material properties: conductivity, specific heat, and density (example values chosen from copper)
[Materials]
 [./k]
 type = GenericConstantMaterial
 prop_names = 'thermal_conductivity'
 prop_values = '0.95' #copper in cal/(cm sec C)
 block = 0
 [../]
 [./cp]
 type = GenericConstantMaterial
 prop_names = 'specific_heat'
 prop_values = '0.092' #copper in cal/(g C)
 block = 0
 [../]
 [./rho]
 type = GenericConstantMaterial
 prop_names = 'density'
 prop_values = '8.92' #copper in g/(cm^3)
 block = 0
 [../]
 []

# Time stepping and solver
[Executioner]
# Here we use the Transient Executioner
type = Transient
solve_type = 'PJFNK'
num_steps = 300
dt = 2
[]


[Outputs]
execute_on = 'timestep_end'
exodus = true
[]
