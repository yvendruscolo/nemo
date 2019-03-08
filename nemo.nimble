# Package

version       = "0.1.0"
author        = "Yuri Vendruscolo"
description   = "Simple(r) CSS for python"
license       = "MIT"
installExt    = @["nim"]
bin           = @["nemo.so"]


# Dependencies

requires "nim >= 0.19.4"
requires "nimquery >= 1.1.2"
requires "nimpy"

task bl, "builds sharedlib":
    exec "nimble build --app:lib -d:release --gc:regions"

before bl:
    exec "nimble check"

task tst, "simple test":
    exec "python3 nemo.py"

before test:
    exec "nimble bl"