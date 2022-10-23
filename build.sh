#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Corvus-AOSP/android_manifest.git -b 13 -g default,-mips,-darwin,-notdefault
git clone https://github.com/yanzszs/local_manifest --depth 1 -b whyred-corvus-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch corvus_whyred-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=zacky
export KBUILD_BUILD_HOST=jenkins
export BUILD_USERNAME=zacky
export BUILD_HOSTNAME=jenkins
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
mka corvus -j8
# build CorvusOS 15
