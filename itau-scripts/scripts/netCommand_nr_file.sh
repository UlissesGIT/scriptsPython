#! /bin/bash
if [[ -f /var/nextvision/sbin/nvEnv ]]; then
    . /var/nextvision/sbin/nvEnv
else
    echo >&2 Nao eh um ambiente Nextvision
    exit 1
fi

if [[ ! -f $BIN/netCommand ]]; then
    echo >&2 Nao existe netCommand instalado
    exit 1
fi

if id=$(head -1 $ETC/config/id); then
    if nr=$(head -1 $ENV/netCommand.nr); then
	echo "$id-$nr.txt"
    fi
fi
