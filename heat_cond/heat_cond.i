#Generate rectangular mesh with 40 triangular elements along each direction (2d)
[Mesh]
type = GeneratedMesh
dim = 2
nx = 20
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
[]

# Set up inlet and isothermic boundary conditions (Dirichlet boundaries on left, top, and bottom of domain)
[BCs]
[./left]
type = DirichletBC
variable = temp
boundary = left
value = 300
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
type = Transient   # Here we use the Transient Executioner
solve_type = 'PJFNK'
num_steps = 100
dt = 2
[]


[Outputs]
execute_on = 'timestep_end'
exodus = true
[]
