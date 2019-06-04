#!/system/bin/sh
test "x$(getprop 'init.svc.bootanim')" = 'xrunning' && setprop 'ctl.restart' 'bootanim'
