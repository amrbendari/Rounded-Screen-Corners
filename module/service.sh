#!/system/bin/sh
MODDIR=${0%/*}
LOG=/data/adb/rounded-corners-20dp.log
APK=/product/overlay/RoundedScreenCorners20dp.apk
PKG=com.amrbendari.roundedscreencorners.overlay

mkdir -p /data/adb
# Wait briefly for PackageManager and OverlayManager to finish boot initialization.
i=0
while [ "$(getprop sys.boot_completed)" != "1" ] && [ "$i" -lt 90 ]; do
  sleep 2
  i=$((i + 1))
done

{
  echo "===== Rounded Screen Corners 20dp SAFE DISCOVERY ====="
  date
  echo "SDK=$(getprop ro.build.version.sdk) MODEL=$(getprop ro.product.model)"
  echo "BOOT_COMPLETED=$(getprop sys.boot_completed)"
  if [ "$(getprop sys.boot_completed)" = "1" ]; then
    rm -f /data/adb/rounded-corners-20dp-test-boots
    echo "BOOT_GUARD: successful boot checkpoint reached; counter reset"
  fi
  echo "APK_PATH=$APK"
  if [ -f "$APK" ]; then
    echo "APK_PRESENT=yes"
    ls -l "$APK" 2>&1
  else
    echo "APK_PRESENT=no"
  fi

  echo "===== PACKAGE MANAGER ====="
  pm path "$PKG" 2>&1 || true

  echo "===== ANDROID OVERLAY REGISTRATION ====="
  cmd overlay list android 2>&1

  echo "===== EFFECTIVE RESOURCE VALUES (STATIC OVERLAY MAY BE AUTO-ENABLED) ====="
  for r in rounded_corner_radius rounded_corner_radius_top rounded_corner_radius_bottom; do
    printf '%s=' "$r"
    cmd overlay lookup android "android:dimen/$r" 2>&1
  done

  echo "===== SAFE DISCOVERY COMPLETE: NO MANUAL ENABLE COMMAND WAS RUN ====="
} >> "$LOG" 2>&1
