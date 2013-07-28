#!/bin/sh
egrep -iv '(204.15.24[0-3]\.[0-9]|Yandex|Toata dragostea mea pentru|NewsFire|monitis|favicon.ico|larbin|StackRambler|Nutch|bot|Yahoo|Google|Fedora/1.5.0.1-9|Spider|us_orgedu_viewer|netcraft|scoutjet|ia_archiver|Mozilla/4.0 \(compatible; MSIE 6.0; Windows NT 5.1; SV1\)|"Mozilla/4.0 \(compatible; MSIE 6.0; Windows NT 5.1\))' "$@"
