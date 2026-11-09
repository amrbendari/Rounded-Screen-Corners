#!/system/bin/sh
MODDIR=${0%/*}
LOG=/data/adb/rounded-corners-20dp.log
APK=/product/overlay/RoundedScreenCorners20dp.apk
PKG=com.amrbendari.roundedscreencorners.overlay

mkdir -p /data/adb
{
  echo "===== Rounded Screen Corners 20dp preflight ====="
  date
  echo "SDK=$(getprop ro.build.version.sdk) MODEL=$(getprop ro.product.model)"
  echo "BOOT_COMPLETED=$(getprop sys.boot_completed)"
  echo "APK_PATH=$APK"
  if [ -f "$APK" ]; then
    echo "APK_PRESENT=yes"
    ls -l "$APK" 2>&1
  else
    echo "APK_PRESENT=no"
  fi

  echo "===== OVERLAY PACKAGE ====="
  pm path "$PKG" 2>&1 || true

  echo "===== ANDROID OVERLAY STATE ====="
  cmd overlay list android 2>&1

  echo "===== EFFECTIVE ROUNDED CORNER VALUES ====="
  for r in rounded_corner_radius rounded_corner_radius_top rounded_corner_radius_bottom; do
    printf '%s=' "$r"
    cmd overlay lookup android "android:dimen/$r" 2>&1
  done

  echo "===== END PREFLIGHT ====="
} >> "$LOG" 2>&1
