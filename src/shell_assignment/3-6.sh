#!/bin/bash

PYTHON_SCRIPT="./3-6.py"

echo "==shell=="

echo ">>> 파이썬 스크립트에 입력된 인자를 전달"
$PYTHON_SCRIPT "$@"

echo "== exit =="
