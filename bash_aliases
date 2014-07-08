adbss() {
    adb root && 
        adb shell stop &&
        adb remount &&
        adb sync &&
        adb shell start
}

makefb() {
    (
    croot &&
        mmm -j12 frameworks/base frameworks/base/core/jni
    )
}

syncfb() {
    makefb && adbss
}

alias lc='adb logcat'
alias lcc='adb logcat -c && adb logcat' # clear logcat buffer

# for use after editing device/.../BoardConfig.mk
alias cleanri='rm -rf $OUT/obj/SHARED_LIBRARIES/libandroid_runtime_intermediates'

# vim: set ft=sh :