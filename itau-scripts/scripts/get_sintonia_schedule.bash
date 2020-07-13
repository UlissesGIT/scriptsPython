#! /bin/bash

here=$(
    cd -P $(dirname ${BASH_SOURCE[0]})
    echo $PWD
)


cd /var/www/nvtvserver/Sintonia || exit 1

[[ -d log ]] || mkdir log

[[ -d log ]] || exit 1

(
    echo
    echo $(date "+%d/%m/%Y %H:%M:%S") Iniciando processamento de sintonia.cmd
    echo
    $here/get_sintonia_zip.bash
)  >> log/sintonia.$(date +%Y-%m-%d).log 2>&1 </dev/null
