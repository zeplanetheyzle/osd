#!/bin/bash

function main {
    local choice="$1"
    
    echo "--- 명령어 실행 ---"
    echo "함수에 전달된 옵션: $choice"
    echo "실행될 명령어: ls $choice"
    echo "------------------------"
    
    eval "ls $choice"
}

echo "## 1. 인자 없이 함수 호출"
main ""
echo

echo "## 2. 옵션 '-l' 전달"
main "-l"
echo

echo "## 3. 옵션 '-al' 전달"
main "-al"
echo
