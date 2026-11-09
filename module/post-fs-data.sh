#!/system/bin/sh
# Best-effort boot-loop guard for the isolated test module.
MODDIR=${0%/*}
STATE=/data/adb/rounded-corners-20dp-test-boots
LOG=/data/adb/rounded-corners-20dp.log

mkdir -p /data/adb
COUNT=0
if [ -f "$STATE" ]; then
  COUNT=$(cat "$STATE" 2>/dev/null)
fi
case "$COUNT" in ''|*[!0-9]*) COUNT=0 ;; esac
COUNT=$((COUNT + 1))
echo "$COUNT" > "$STATE"

{
  echo "===== TEST MODULE BOOT GUARD ====="
  echo "attempt=$COUNT"
  date
} >> "$LOG" 2>&1

# If the prior boot did not reach service.sh's boot-complete checkpoint,
# disable this test module for the following boot. This is best-effort only:
# it cannot protect against failures before Magisk runs post-fs-data scripts.
if [ "$COUNT" -ge 2 ]; then
  touch "$MODDIR/disable"
  echo "BOOT_GUARD: module disabled after repeated incomplete boots" >> "$LOG"
fi
