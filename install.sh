#!/sbin/sh

SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true
REPLACE="
"

print_modname() {
    unzip -o "${ZIPFILE}" module.prop -d "${TMPDIR}" >&2
    local MOD_PROP="$(cat "${TMPDIR}/module.prop")"

    local MOD_NAME="$(echo "${MOD_PROP}" | grep "name=")"
    MOD_NAME=${MOD_NAME:5}

    local MOD_VERSION="$(echo "${MOD_PROP}" | grep "version=")"
    MOD_VERSION=${MOD_VERSION:8}

    ui_print "******************************"
    ui_print " ${MOD_NAME}"
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
