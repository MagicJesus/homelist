#!/bin/sh
cd ../lib
ls
$(dart run build_runner build)
