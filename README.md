# Rounded Screen Corners 20dp

A Magisk module project for applying 20dp rounded screen-corner resources on Android devices.

## Status

**Experimental preflight build — not yet approved for installation.**

The overlay APK maps the three target resources on the user's actual `framework-res.apk` when tested with `idmap2 create` using the product policy:

- `android:dimen/rounded_corner_radius`
- `android:dimen/rounded_corner_radius_top`
- `android:dimen/rounded_corner_radius_bottom`

This proves that idmap creation and resource mapping succeed. It does **not** yet prove that OverlayManager automatically discovers/enables the Magisk-mounted APK during boot, or that SystemUI/window decor visibly applies the radius.

## Target device

- Samsung Galaxy Tab S4 (SM-T835 / gts4llte)
- crDroid 13.1 / Android 17 (API 37)
- Magisk 31.1

## Diagnostics

After a test installation (only when explicitly approved), `service.sh` records:

- Whether the APK is visible at `/product/overlay/RoundedScreenCorners20dp.apk`
- Whether Package Manager sees the overlay package
- OverlayManager's state for target package `android`
- Effective values of the three rounded-corner dimensions

The log is written to `/data/adb/rounded-corners-20dp.log`.

## Build

GitHub Actions builds the overlay APK and packages it inside a Magisk module ZIP. A successful CI build verifies packaging, APK signature, and resource names; it does not prove runtime activation or visual effect.

## Safety

- Does not patch or replace files in `/system` or `/product`.
- Installs the overlay through the Magisk module mount.
- This preflight build is not a release candidate. Do not install until device-specific boot discovery and activation behavior have been reviewed.

