#include "fem_b_gui.h"
#include "fem_b_gui.cxx"

int main(int argc, char **argv) {

	fem_b_gui_h::Fl_Double_Window *window = make_window();
	window->show();
	return Fl::run();

}

