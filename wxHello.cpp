#include <wx/wx.h>

class MainApp : public wxApp
{
    public:
    virtual bool OnInit();
};

wxIMPLEMENT_APP(MainApp);

bool MainApp::OnInit()
{
    wxFrame *frame = new wxFrame(nullptr, wxID_ANY, _("Hello, world!"));
    frame->Show();
    return true;
}
