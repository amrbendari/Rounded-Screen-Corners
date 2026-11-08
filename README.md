# Rounded Screen Corners 20dp

A Magisk module project for applying 20dp rounded screen-corner resources on Android devices.

## Status

**Experimental development. Not ready to install yet.** The first build is intended to validate the RRO APK, its resource mappings, and Magisk ZIP packaging. A successful build does not by itself prove that the device compositor uses these resources.

## Target device

- Samsung Galaxy Tab S4 (SM-T835 / gts4llte)
- Android 17 / API 37
- Magisk 31.1

## Build

GitHub Actions builds the overlay APK and packages it inside a Magisk module ZIP. Download the artifact from the Actions run after the workflow completes.

## Safety

- Does not patch or replace files in /system or /product.
- Installs the overlay through the Magisk module mount.
- Remove the module through Magisk to roll back.
- Do not install experimental artifacts until the workflow and device-side verification steps are complete.

## Intended resources

- android:dimen/rounded_corner_radius
- android:dimen/rounded_corner_radius_top
- android:dimen/rounded_corner_radius_bottom
