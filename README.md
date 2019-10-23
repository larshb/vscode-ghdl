VS Code GDHL
============

Test repository for integrating Visual Studio Code with GNU GHDL.

## File summary

```tree
.
├── .gitignore
├── ghdl-watch        : inotifywait wrapper to watch for .vhd file changes
├── hello_world.vhd   : (working) example VHDL module (non-synthesizable)
├── Makefile          : Makefile (mostly showcasing basic GHDL features)
├── README.md         : (this file)
└── .vscode           : Visual studio code files
    ├── launch.json   : Used for execute/debug
    └── tasks.json    : Used for build and lint
```
