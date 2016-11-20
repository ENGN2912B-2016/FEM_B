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

[Variables]
[./diffused]
order = FIRST
family = LAGRANGE
[../]
[]

[Kernels]
[./diff]
type = ExampleDiffusion
variable = diffused
[../]

[./conv]
type = ExampleConvection
variable = diffused
velocity = '1.0 1.0 1.0'
[../]

[./euler]
type = ExampleTimeDerivative
variable = diffused
time_coefficient = 20.0
[../]
[]

[BCs]
[./bottom_diffused]
type = DirichletBC
variable = diffused
boundary = 'bottom'
value = 1
[../]
[]


[Executioner]
type = Transient   # Here we use the Transient Executioner
solve_type = 'PJFNK'
num_steps = 200
dt = 10
[]

[Outputs]
execute_on = 'timestep_end'
exodus = true
[]
