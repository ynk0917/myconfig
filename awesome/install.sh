#!/bin/bash
if [ -f rc.lua ];then
    rm rc.lua
fi
ln -s rc.lua.dual_screen rc.lua
