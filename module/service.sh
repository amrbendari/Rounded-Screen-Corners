#!/system/bin/sh
MODDIR=${0%/*}
LOG=/data/adb/rounded-corners-20dp.log
APK=/product/overlay/RoundedScreenCorners20dp.apk

mkdir -p /data/adb
{
  echo "===== Rounded Screen Corners 20dp ====="
  date
  echo "SDK=$(getprop ro.build.version.sdk) MODEL=$(getprop ro.product.model)"
  echo "Checking mounted overlay APK: $APK"
  if [ -f "$APK" ]; then
    echo "Overlay APK is present."
  else
    echo "ERROR: overlay APK is not visible at expected product path."
  fi
  cmd overlay list android 2>&1 | grep -i -E 'rounded|android$' || true
  echo "===== end ====="
} >> "$LOG" 2>&1
