# data file for the Fltk User Interface Designer (fluid)
version 1.0304
header_name {.h}
code_name {.cxx}
Function {make_window()} {open
} {
  Fl_Window {} {
    label {Laminar Combustion Input File Generator} open
    xywh {1215 270 500 700} type Double visible
  } {
    Fl_Group {} {
      label {Wall Settings} open
      xywh {15 30 475 475}
    } {
      Fl_Round_Button {} {
        label Isothermal
        xywh {15 40 25 25} down_box ROUND_DOWN_BOX
      }
      Fl_Round_Button {} {
        label Adiabatic
        xywh {15 60 25 25} down_box ROUND_DOWN_BOX
      }
      Fl_Input {} {
        label {Wall Temperature} selected
        xywh {335 45 130 25}
      }
      Fl_Input {} {
        label {Inlet Temperature}
        xywh {335 70 130 25}
      }
      Fl_Input {} {
        label {Inlet Pressure}
        xywh {335 95 130 25}
      }
      Fl_Input {} {
        label {Outlet Pressure}
        xywh {335 120 130 25}
      }
    }
    Fl_Group {} {
      label {Gas Settings} open
      xywh {10 186 475 473}
    } {
      Fl_Input {} {
        label {Thermal Conductivity}
        xywh {335 211 130 25}
      }
      Fl_Input {} {
        label Density
        xywh {335 235 130 25}
      }
      Fl_Input {} {
        label {Specific Heat}
        xywh {335 260 130 25}
      }
      Fl_Input {} {
        label Viscosity
        xywh {335 285 130 25}
      }
      Fl_Input {} {
        label {Percent Fuel}
        xywh {335 310 130 25}
      }
    }
    Fl_Group {} {
      label {Chemistry Settings} open
      xywh {10 363 475 477}
    } {
      Fl_Input {} {
        label {Reaction Rate}
        xywh {335 393 130 25}
      }
      Fl_Input {} {
        label {Enthalpy of Fuel}
        xywh {335 415 130 25}
      }
    }
    Fl_Group {} {
      label {Mesh Settings} open
      xywh {10 475 475 475}
    } {
      Fl_Input {} {
        label {User File}
        xywh {335 500 130 25}
      }
      Fl_Input {} {
        label {Elements (X)}
        xywh {335 525 130 25}
      }
      Fl_Input {} {
        label {Elements (Y)}
        xywh {335 550 130 25}
      }
    }
    Fl_Group {} {
      label {Time Settings} open
      xywh {10 610 475 675}
    } {
      Fl_Input {} {
        label Duration
        xywh {335 635 130 25}
      }
      Fl_Input {} {
        label Timestep
        xywh {335 660 130 25}
      }
    }
  }
}
