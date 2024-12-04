#!/bin/sh

XML_DIR="/freebsd-ports/security/vuxml/vuln-flat.xml"
 case "$1" in
        -a)
            exec  vxquery -a $XML_DIR "$2" > vuxml
            ;;
        -t)
            if [ $2 == "text" ]; then
              vxquery -t xhtml $XML_DIR "$3" > out.html
              lynx --dump -display_charset UTF-8 "out.html" > vuxml
              rm -rf out.html
            else
              vxquery -t "$2" $XML_DIR "$3" > vuxml
            fi
            ;;
         *)
            vxquery -t xhtml $XML_DIR "$1" > out.html
            lynx --dump -display_charset UTF-8 "out.html" > vuxml
            rm -rf out.html
            ;;
 esac
