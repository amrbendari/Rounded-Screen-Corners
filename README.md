# Rounded Screen Corners 20dp

A Magisk module project for applying 20dp rounded screen-corner resources on Android devices.

## Current status

**Experimental immutable-RRO candidate — not approved for installation.**

The previous 0.3.0 build used a mutable overlay. Android's RRO documentation states that only immutable overlays targeting the `android` package affect values retrieved through `Resources.getSystem()`. This candidate therefore tests a static/immutable overlay manifest.

The candidate still requires device-specific verification. On Android 11 and newer, a partition `OverlayConfig` can supersede manifest mutability settings. The target device's active overlay configuration has not yet been inspected, so this branch is not a verified solution and must not be installed as a final build.

The overlay maps:

- `android:dimen/rounded_corner_radius`
- `android:dimen/rounded_corner_radius_top`
- `android:dimen/rounded_corner_radius_bottom`

A successful APK/ZIP build proves packaging only. It does not prove that OverlayManager discovers the Magisk-mounted APK, that the overlay becomes immutable and enabled, or that the visible screen corners change to 20dp.

## Target device

- Samsung Galaxy Tab S4 (SM-T835 / gts4llte)
- crDroid 13.1 / Android 17 (API 37)
- Magisk 31.1

## Safety

This is a development candidate, not a release. Do not install until the device's OverlayConfig behavior and rollback path have been checked. Keep the existing known-good recovery/disable method available.
