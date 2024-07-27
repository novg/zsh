# Java
export JAVA_HOME=/opt/jdk-21.0.1+12
export JDK_HOME=$JAVA_HOME
export JAVA_CMD=$JAVA_HOME/bin/java
PATH=$JAVA_HOME/bin:$PATH

# Sway config
export ANKI_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1
export WLR_DRM_NO_MODIFIERS=1
export _JAVA_AWT_WM_NONREPARENTING=1

# For sway
export XDG_CURRENT_DESKTOP=sway

if [[ -z $DISPLAY && $TTY = /dev/tty1 ]]; then
  exec sway
fi
