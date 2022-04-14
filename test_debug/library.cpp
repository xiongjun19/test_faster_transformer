#include <Python.h>

static PyObject* add(PyObject* self, PyObject* args){
    int a, b;
    if (!PyArg_ParseTuple(args, "ii", &a, &b)){
        return nullptr;
    }
    int sum = a + b;
    PyObject* ret = PyLong_FromLong(sum);
    return ret;
}

static PyMethodDef MyDemoMethods[] = {
        {"addx", add, METH_VARARGS, "add two integers"},
        {nullptr, nullptr, 0, nullptr},
};


static struct PyModuleDef cModPyDem =
{
    PyModuleDef_HEAD_INIT,
    "demo", /* name of module */
    "",          /* module documentation, may be NULL */
    -1,          /* size of per-interpreter state of the module, or -1 if the module keeps state in global variables. */
   MyDemoMethods 
};


/* PyMODINIT_FUNC initdemo(void){
    (void) Py_InitModule("demo", MyDemoMethods);
} */

PyMODINIT_FUNC PyInit_demo(void)
{
    return PyModule_Create(&cModPyDem);
}
