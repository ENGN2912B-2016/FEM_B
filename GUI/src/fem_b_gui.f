# data file for the Fltk User Interface Designer (fluid)
version 1.0304
header_name {.h}
code_name {.cxx}
decl {\#include <iostream>} {public local
}

decl {\#include <assert.h>} {private local
}

decl {\#include <fstream>} {private local
}

decl {\#include <string>} {private local
}

Function {inblock(std::string name, int size, std::string ent[], std::string val[],std::ostream& out)} {
  comment {Function to print out input sub-block
} open return_type {std::ostream&}
} {
  code {out << "[./" << name << "]\\n";
if (size > 0) {
for (int ii=0;ii<size; ++ii) {
	out << ent[ii] << " = " << val[ii] << "\\n";
}
}

out << "[../]\\n";} {}
}

Function {make_window()} {open
} {
  Fl_Window main_window {
    label {Laminar Combustion Input File Generator} open
    xywh {788 186 678 749} type Double visible
  } {
    Fl_Group bc_set {
      label {Boundary Conditions} open
      xywh {190 30 475 475}
    } {
      Fl_Round_Button iso_button {
        label Isothermal
        callback {if (iso_button->value()) {
adia_button->value(0);
} else {
adia_button->value(1);
}}
        xywh {510 120 25 25} down_box ROUND_DOWN_BOX align 4 when 1
      }
      Fl_Round_Button adia_button {
        label Adiabatic
        callback {if (adia_button->value()) {
iso_button->value(0);
} else {
iso_button->value(1);
}}
        xywh {510 140 25 25} down_box ROUND_DOWN_BOX align 4
      }
      Fl_Input wall_temp {
        label {Wall Temperature}
        xywh {510 45 130 25}
      }
      Fl_Input in_temp {
        label {Inlet Temperature}
        xywh {510 70 130 25}
      }
      Fl_Input out_p {
        label {Outlet Pressure}
        xywh {510 95 130 25}
      }
    }
    Fl_Group gas_set {
      label {Gas Settings} open
      xywh {185 186 475 473}
    } {
      Fl_Input gas_tc {
        label {Thermal Conductivity} selected
        xywh {510 211 130 25}
      }
      Fl_Input gas_dens {
        label Density
        xywh {510 235 130 25}
      }
      Fl_Input gas_sh {
        label {Specific Heat}
        xywh {510 260 130 25}
      }
      Fl_Input gas_visc {
        label Viscosity
        xywh {510 285 130 25}
      }
      Fl_Input gas_mf {
        label {Percent Fuel}
        xywh {510 310 130 25}
      }
    }
    Fl_Group chem_set {
      label {Chemistry Settings} open
      xywh {185 363 475 477}
    } {
      Fl_Input rx_rate {
        label {Reaction Rate}
        xywh {510 393 130 25}
      }
      Fl_Input fuel_h {
        label {Enthalpy of Fuel}
        xywh {510 415 130 25}
      }
    }
    Fl_Group mesh_set {
      label {Mesh Settings} open
      xywh {185 475 475 475}
    } {
      Fl_Input x_elem {
        label {Elements (X)}
        xywh {510 490 130 25}
      }
      Fl_Input y_elem {
        label {Elements (Y)}
        xywh {510 515 130 25}
      }
      Fl_Input xmax {
        label {X Max}
        xywh {510 540 130 25}
      }
      Fl_Input ymax {
        label {Y Max}
        xywh {510 565 130 25}
      }
    }
    Fl_Group time_set {
      label {Time Settings} open
      xywh {185 605 475 675}
    } {
      Fl_Input duration {
        label {Number of Steps}
        xywh {510 630 130 25}
      }
      Fl_Input timestep {
        label Timestep
        xywh {510 655 130 25}
      }
    }
    Fl_Button submit {
      label Submit
      callback {std::string Tw_str, Ti_str, TC_str, dens_str, SH_str, visc_str, MF_str; //Po_str
std::string RX_str, Hfuel_str, El_x_str, El_y_str, dur_str, timestep_str, xmax_str, ymax_str;
std::string input_str, mesh_str;
bool adia_iso;

if (iso_button->value()) {
adia_iso = false;
} else if (adia_button->value()) {
adia_iso = true;
} else {
adia_iso = false;
}

if (wall_temp->value()) {
Tw_str = std::string(wall_temp->value());
} else {
Tw_str="300";
}

if (in_temp->value()) {
Ti_str = std::string( in_temp->value());
} else {
Ti_str = std::string("300");
}

// if (out_p->value()) {
// Po_str = std::string( out_p->value());
// } else {
// Po_str = std::string("300");
// }

if (gas_tc->value()) {
TC_str = std::string("'")+std::string( gas_tc->value())+std::string("'");
} else {
TC_str = std::string("300");
}

if (gas_dens->value()) {
dens_str = std::string("'")+std::string( gas_dens->value())+std::string("'");
} else {
dens_str = std::string("300");
}

if (gas_sh->value()) {
SH_str = std::string("'")+std::string( gas_sh->value())+std::string("'");
} else {
SH_str = std::string("300");
}

if (gas_visc->value()) {
visc_str = std::string("'")+std::string( gas_visc->value())+std::string("'");
} else {
visc_str = std::string("300");
}

if (gas_mf->value()) {
MF_str = std::string( gas_mf->value());
} else {
MF_str = std::string("300");
}

if (rx_rate->value()) {
RX_str = std::string( rx_rate->value());
} else {
RX_str = std::string("300");
}

if (fuel_h->value()) {
Hfuel_str = std::string( fuel_h->value());
} else {
Hfuel_str = std::string("300");
}

if (x_elem->value()) {
El_x_str = std::string( x_elem->value());
} else {
El_x_str = std::string("300");
}

if (y_elem->value()) {
El_y_str = std::string( y_elem->value());
} else {
El_x_str = std::string("300");
}

if (xmax->value()) {
xmax_str = std::string( xmax->value());
} else {
xmax_str = std::string("300");
}

if (ymax->value()) {
ymax_str = std::string( ymax->value());
} else {
ymax_str = std::string("300");
}


if (duration->value()) {
dur_str = std::string( duration->value());
} else {
dur_str = std::string("300");
}

if (timestep->value()) {
timestep_str = std::string(timestep->value());
} else {
timestep_str = std::string("300");
}

if (in_file->value() > 0) {
input_str = std::string(in_file->text(in_file->value()));
} else if (new_file->value()) {
input_str = std::string(new_file->value());
} else {
input_str = std::string("default.i");
}

if (mesh_file->value() > 0) {
mesh_str = std::string(mesh_file->text(mesh_file->value()));
} else {
mesh_str = std::string("default_mesh.e");
}

std::ofstream outfile(input_str,std::ios::out);

assert(outfile.is_open());

// Mesh

outfile << "[Mesh]\\n";

if (mesh_file->value() == 0 && bool(x_elem->value())&& bool(x_elem->value())) {
	outfile << "type = GeneratedMesh\\n";
	outfile << "dim = 2\\n";
	outfile << "nx = " << El_x_str << "\\n";
	outfile << "ny = " << El_y_str << "\\n";
	outfile << "nz = 0\\n\\n";
	outfile << "xmax = " << xmax_str << "\\n";
	outfile << "ymax = " << ymax_str << "\\n";
	outfile << "zmax = 0\\n";
	outfile << "elem_type = TRI3\\n";
} else {
	outfile << "file = " << mesh_str << "\\n";
}

outfile << "[]\\n\\n";

outfile << "[Variables]\\n[./temp]\\n[../]\\n[]\\n\\n";

outfile << "[Kernels]\\n[./hc]\\n type = HeatConduction\\n variable = temp\\n[../]\\n\\n";

outfile << "[./HeatTdot]\\ntype = HeatConductionTimeDerivative\\nvariable = temp\\n[../]\\n[]\\n\\n";

outfile << "[BCs]\\n";

if (adia_iso) {

}

outfile << "[Materials]\\n";

std::string matnames[4] = {std::string("type"), std::string("prop_names"),std::string("prop_values"),std::string("block")};
std::string kvals[4] = {std::string("GenericConstantMaterial"),std::string("'thermal_conductivity'"),TC_str,std::string("0")};
std::string cpvals[4] = {std::string("GenericConstantMaterial"),std::string("'specific_heat'"),SH_str,std::string("0")};
std::string rhovals[4] = {std::string("GenericConstantMaterial"),std::string("'density'"),dens_str,std::string("0")};
inblock(std::string("k"),4,matnames,kvals,outfile);
inblock(std::string("cp"),4,matnames,cpvals,outfile);
inblock(std::string("rho"),4,matnames,rhovals,outfile);
outfile << "[]\\n\\n";

outfile << "[Executioner]\\n";
outfile << "type = Transient\\nsolve_type = 'PJFNK'\\n";
outfile << "num_steps = " << dur_str << "\\n";
outfile << "dt = " << timestep_str << "\\n";
outfile << "[]\\n\\n";

outfile << "[Outputs]\\nexecute_on = 'timestep_end'\\nexodus = true\\n[]";}
      xywh {527 708 100 25}
    }
    Fl_File_Browser in_file {
      label {Input File Location}
      xywh {26 105 310 235}
      code0 {in_file->load(".");}
      code1 {in_file->type(FL_HOLD_BROWSER);}
    }
    Fl_File_Browser mesh_file {
      label {Mesh File Location}
      xywh {26 424 310 235}
      code0 {mesh_file->load(".");}
      code1 {mesh_file->type(FL_HOLD_BROWSER);}
    }
    Fl_Input new_file {
      label {New Input File Name}
      xywh {177 364 161 25}
    }
  }
}
