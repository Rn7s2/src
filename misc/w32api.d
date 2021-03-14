import core.runtime;
import core.sys.windows.windows;
import std.string;

extern (Windows)
int WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
            LPSTR lpCmdLine, int nCmdShow)
{
    int result;

    try
    {
        Runtime.initialize();
        result = myWinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow);
        Runtime.terminate();
    }
    catch (Throwable e) 
    {
        MessageBoxA(null, e.toString().toStringz(), null, MB_ICONEXCLAMATION);
        result = 0;     // failed
    }

    return result;
}

int myWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
              LPSTR lpCmdLine, int nCmdShow)
{
    MessageBoxW(null, "Hello, world!", "Title", MB_OK);
    return 0;
}
