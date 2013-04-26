#Zathura installation and configuration#

This HowTo describes the Zathura installation and configurations needed to enable a jklö navigation.

##Steps##

1. Download, extract, and install Girara: <http://pwmt.org/projects/girara/download/>

2. Download and extract Zathura: <http://pwmt.org/projects/zathura/download/>

3. cd into zathura-x.x.x and change the following lines in config.c to modify the navigation (this has to be done because of the odiaeresis):

        --- config.c.old  2013-04-26 19:40:50.121149850 +0200
        +++ config.c  2013-04-26 19:41:32.189148011 +0200
        @@ -266,10 +266,10 @@

        girara_shortcut_add(gsession, 0,                GDK_KEY_r,          NULL, sc_rotate,                   NORMAL,     ROTATE_CW,       NULL);

        -  girara_shortcut_add(gsession, 0,                GDK_KEY_h,          NULL, sc_scroll,                   NORMAL,     LEFT,            NULL);
        -  girara_shortcut_add(gsession, 0,                GDK_KEY_j,          NULL, sc_scroll,                   NORMAL,     DOWN,            NULL);
        -  girara_shortcut_add(gsession, 0,                GDK_KEY_k,          NULL, sc_scroll,                   NORMAL,     UP,              NULL);
        -  girara_shortcut_add(gsession, 0,                GDK_KEY_l,          NULL, sc_scroll,                   NORMAL,     RIGHT,           NULL);
        +  girara_shortcut_add(gsession, 0,                GDK_KEY_j,          NULL, sc_scroll,                   NORMAL,     LEFT,            NULL);
        +  girara_shortcut_add(gsession, 0,                GDK_KEY_k,          NULL, sc_scroll,                   NORMAL,     DOWN,            NULL);
        +  girara_shortcut_add(gsession, 0,                GDK_KEY_l,          NULL, sc_scroll,                   NORMAL,     UP,              NULL);
        +  girara_shortcut_add(gsession, 0,                GDK_KEY_odiaeresis,          NULL, sc_scroll,                   NORMAL,     RIGHT,           NULL);
        girara_shortcut_add(gsession, 0,                GDK_KEY_Left,       NULL, sc_scroll,                   NORMAL,     LEFT,            NULL);
        girara_shortcut_add(gsession, 0,                GDK_KEY_Up,         NULL, sc_scroll,                   NORMAL,     UP,              NULL);
        girara_shortcut_add(gsession, 0,                GDK_KEY_Down,       NULL, sc_scroll,                   NORMAL,     DOWN,            NULL);

4. Install Zathura

5. Download and extract Poppler: <http://poppler.freedesktop.org/>

6. cd into poppler-x.x.x and run the following configuration (Thanks to [Onse](http://goo.gl/Qubl8)):

        ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-static  \
                --enable-xpdf-header
7. install Poppler

8. Download, extract, and install the Poppler plugin for Zathura: <http://pwmt.org/projects/zathura/plugins/zathura-pdf-poppler/>

9. That should be it
