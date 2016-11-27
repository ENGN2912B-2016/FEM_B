# data file for the Fltk User Interface Designer (fluid)
version 1.0304
header_name {.h}
code_name {.cxx}
decl {\#include <iostream>} {selected private local
}

Function {make_window()} {open
} {
  Fl_Window main_window {
    label {Laminar Combustion Input File Generator} open
    xywh {1202 70 678 749} type Double visible
  } {
    Fl_Group bc_set {
      label {Boundary Conditions} open
      xywh {190 30 475 475}
    } {
      Fl_Round_Button iso_button {
        label Isothermal
        xywh {510 120 25 25} down_box ROUND_DOWN_BOX align 4
      }
      Fl_Round_Button adia_button {
        label Adiabatic
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
        label {Thermal Conductivity}
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
    }
    Fl_Group time_set {
      label {Time Settings} open
      xywh {185 575 475 675}
    } {
      Fl_Input duration {
        label Duration
        xywh {510 600 130 25}
      }
      Fl_Input timestep {
        label Timestep
        xywh {510 625 130 25}
      }
    }
    Fl_Button submit {
      label Submit
      callback {char* Tw_str, Ti_str, TC_str, dens_str, SH_str, visc_str, MF_str; //Po_str
char* RX_str, Hfuel_str, El_x_str, El_y_str, dur_str, timestep_str;
char* input_str, mesh_str;
bool adia_iso;

if (wall_temp->value()) {
strcpy(Tw_str, wall_temp->value());
} else {
strcpy(Tw_str,"300");
}

if (in_temp->value()) {
strcpy(Ti_str, in_temp->value());
} else {
strcpy(Ti_str,"300");
}

// if (out_p->value()) {
// strcpy(Po_str, out_p->value());
// } else {
// strcpy(Po_str,"300");
// }

if (gas_tc->value()) {
strcpy(TC_str, gas_tc->value());
} else {
strcpy(TC_str,"300");
}

if (gas_dens->value()) {
strcpy(dens_str, gas_dens->value());
} else {
strcpy(dens_str,"300");
}

if (gas_sh->value()) {
strcpy(SH_str, gas_sh->value());
} else {
strcpy(SH_str,"300");
}

if (gas_visc->value()) {
strcpy(visc_str, gas_visc->value());
} else {
strcpy(visc_str,"300");
}

if (gas_mf->value()) {
strcpy(MF_str, gas_mf->value());
} else {
strcpy(MF_str,"300");
}

if (rx_rate->value()) {
strcpy(RX_str, rx_rate->value());
} else {
strcpy(RX_str,"300");
}

if (fuel_h->value()) {
strcpy(Hfuel_str, fuel_h->value());
} else {
strcpy(Hfuel_str,"300");
}

if (x_elem->value()) {
strcpy(El_x_str, x_elem->value());
} else {
strcpy(El_x_str,"300");
}

if (y_elem->value()) {
strcpy(El_y_str, y_elem->value());
} else {
strcpy(El_x_str,"300");
}

if (duration->value()) {
strcpy(dur_str, duration->value());
} else {
strcpy(dur_str,"300");
}

if (timestep->value()) {
strcpy(timestep_str, fuel_h->value());
} else {
strcpy(timestep_str,"300");
}

if (in_file->value() > 0) {
strcpy(input_str,in_file->text(in_file->value()));
} else {
strcpy(input_str,new_file->value());
}

if (mesh_file->value() > 0) {
strcpy(mesh_str,mesh_file->text(mesh_file->value()));
} else {
strcpy(mesh_str,"default_mesh.e");
}

std::ofstream outfile(input_str,std::ios::out);

assert(outfile.is_open());

outfile << "[//]" << timestep_str << std::endl;}
      xywh {527 708 100 25}
    }
    Fl_File_Browser in_file {
      label {Input File Location}
      xywh {26 105 310 235}
    }
    Fl_File_Browser mesh_file {
      label {Mesh File Location}
      xywh {26 424 310 235}
    }
    Fl_Input new_file {
      label {New Input File Name}
      xywh {177 364 161 25}
    }
  }
}
