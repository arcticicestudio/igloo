# Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT

# Set system-wide JVM options.
# Constant names in braces are values for the `java.awt.RenderingHint` class.
#
# `awt.useSystemAAFontSettings`
#   Use system settings for font anti-aliasing.
#     - `off`,`false`,`default` (`VALUE_TEXT_ANTIALIAS_DEFAULT`) - No anti-aliasing.
#     - on (`VALUE_TEXT_ANTIALIAS_ON`) - Full anti-aliasing without sub-pixel rendering
#     - gasp (`VALUE_TEXT_ANTIALIAS_GASP`) - Use the font's built-in hinting instructions with sub-pixel rendering,
#       intended for use both on CRT and LCD .
#     - `lcd`, `lcd_hrgb` (`VALUE_TEXT_ANTIALIAS_LCD_HRGB`) - Anti-aliasing tuned for many popular LCD monitors with
#       sub-pixel rendering, optimized for LCD.
#     - `lcd_hbgr` (`VALUE_TEXT_ANTIALIAS_LCD_HBGR`) - Alternative LCD monitor setting. Same as `lcd`,
#       but with different distribution of sub pixels (monitor upsidedown).
#     - `lcd_vrgb` (`VALUE_TEXT_ANTIALIAS_LCD_VRGB`) - Alternative LCD monitor setting. Same as `lcd`,
#       but with different distribution of sub pixels (monitor is vertical).
#     - `lcd_vbgr` (`VALUE_TEXT_ANTIALIAS_LCD_VBGR`) - Alternative LCD monitor setting. Same as `lcd`,
#       but with different distribution of sub pixels (vertical again but on other side).
# `sun.java2d.xrender`
#   Toggle (`true`/`false`) the XRender-based Java 2D rendering pipeline for modern X11-based desktops,
#   offering improved graphics performance.
# `swing.aatext`
#   Toggle (`true`/`false`) the font anti-aliasing for Swing-based applications.
#
# See:
#   1. https://wiki.archlinux.org/index.php/Java_Runtime_Environment_fonts
#   2. http://docs.oracle.com/javase/8/docs/technotes/guides/2d/flags.html#aaFonts
#   3. http://docs.oracle.com/javase/8/docs/technotes/guides/2d/flags.html#xrender
#   4. http://stackoverflow.com/questions/28327620/difference-between-java-options-java-tool-options-and-java-opts
#   5. http://wiki.netbeans.org/FaqFontRendering
#   6. java(1)
#   7. javac(1)
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true"
