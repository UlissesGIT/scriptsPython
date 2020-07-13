#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import env, task
from utils import require_settings


@task
@require_settings(allow=['localhost'])
def test():
    """[localhost] Executa testes no código fonte """
    env.doit("python -m unittest discover -b tests")


@task
@require_settings(allow=['localhost'])
def coverage():
    """[localhost] Mostra o relatório de testes do código fonte """
    env.doit("coverage -e")
    env.doit("coverage run -m unittest discover -b tests")
    env.doit("coverage report --omit=fabfile/code.py,fabfile/utils.py -m fabfile/*.py")
