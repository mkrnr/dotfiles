#Zathura installation and configuration#

This HowTo describes the Zathura installation and configurations needed to enable a jklö navigation.

##Steps##

1. Download, extract, and install Girara: <http://pwmt.org/projects/girara/download/>

2. Download and extract Zathura: <http://pwmt.org/projects/zathura/download/>

3. cd into zathura-x.x.x and patch [zathuraGerNavigation.patch](zathuraGerNavigation.patch) to modify the navigation (this has to be done since ö is not supported in zathurarc)

4. Install Zathura

5. Download and extract Poppler: <http://poppler.freedesktop.org/>

6. cd into poppler-x.x.x and run the following configuration (Thanks to [Onse](http://goo.gl/Qubl8)):

        ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --disable-static  \
                --enable-xpdf-header
7. Install Poppler

8. Download, extract, and install the Poppler plugin for Zathura: <http://pwmt.org/projects/zathura/plugins/zathura-pdf-poppler/>

9. That should be it

##Tested with##

- [girara-0.1.5](http://pwmt.org/projects/girara/download/girara-0.1.5.tar.gz)
- [zathura-0.2.2](http://pwmt.org/projects/zathura/download/zathura-0.2.2.tar.gz)
- [poppler-0.22.3](http://poppler.freedesktop.org/poppler-0.22.3.tar.gz)
- [zathura-pdf-poppler-0.2.2](http://pwmt.org/projects/zathura/plugins/download/zathura-pdf-poppler-0.2.2.tar.gz)
