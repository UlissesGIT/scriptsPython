#! /bin/bash

set -e

cd /var/nextvision/media

find 20[1-9][0-9][0-9][0-9][0-9][0-9].[0-2][0-9][0-9][0-9][0-9][0-9].* -maxdepth 1 -type f -name 'playlist*.xml' | sort | tail -20 | while read ok; do
    okf="../in/itauplayer.$(dirname "$ok").ok"
    [[ -f "$okf"     ]] && continue
    [[ -f "$okf".err ]] && Erro na playlist "$okf" && continue
    if echo "$ok" > "$okf"; then
        echo Republicando "$ok"
    else
        echo Erro ao publicar "$ok"
    fi
done

# end of file
