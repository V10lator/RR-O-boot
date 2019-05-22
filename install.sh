#!/sbin/sh

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false
REPLACE="
"

print_modname() {
    unzip -o "${ZIPFILE}" module.prop -d "${TMPDIR}" >&2
    local MOD_VERSION=$(cat "${TMPDIR}/module.prop" | grep "version=")
    MOD_VERSION=${MOD_VERSION:8}
    ui_print "******************************"
    ui_print " Resurrection Remix Oreo Boot"
    ui_print " v${MOD_VERSION}"
}

on_install() {
    local BOOT_DIR="${MODPATH}/system/media"
    ui_print "- Extracting boot animation"
    mkdir -p "${BOOT_DIR}" >&2
    unzip -o "${ZIPFILE}" bootanimation.zip -d "${BOOT_DIR}" >&2
}

set_permissions() {
    set_perm_recursive "${MODPATH}" 0 0 0755 0644
}
