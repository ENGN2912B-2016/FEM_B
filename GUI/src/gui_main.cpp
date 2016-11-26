#include <FL/Fl.H>
#include <FL/Fl_Window.H>
#include <FL/Fl_Positioner.H>
#include <FL/Fl_Input.H>

int main(int argc, char **argv) {

	Fl_Window *window = new Fl_Window(500,500);
	Fl_Input *file   = new Fl_Input(350,50,80,20,"File");
	window->end();
	window->show();

}

