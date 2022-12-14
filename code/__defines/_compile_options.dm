// The default value for all uses of set background. Set background can cause gradual lag and is recommended you only turn this on if necessary.
// 1 will enable set background. 0 will disable set background.
#define BACKGROUND_ENABLED 0

#define REQUIRED_DM_VERSION 514

#if DM_VERSION < REQUIRED_DM_VERSION
#warn ScavStation is not tested on BYOND versions older than 514. The code may not compile, and if it does compile it may have severe problems.
#endif
