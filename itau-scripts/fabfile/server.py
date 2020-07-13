#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import env, task, settings, hide, get, abort, cd, lcd
from utils import notify, alert, require_settings


@task
@require_settings(allow=['localhost'])
def update_news():
    """[localhost] Atualiza zip das noticias locais do servidor """
    if not env.platform == "windows":
        abort(alert("Esse comando soh executa no servidor (Windows)"))

    # TODO: implementar execucao do scripts/get_sintonia_zip.cmd
    notify("getting done")
