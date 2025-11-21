#!/bin/bash

while true; do
    echo "==================================="
    echo "  리눅스 시스템 상태 모니터링 메뉴"
    echo "==================================="
    echo "1) 사용자 정보 확인"
    echo "2) CPU/GPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==================================="
    echo -n "메뉴 번호를 입력하세요 (1-5): "
    read CHOICE
    echo

    case "$CHOICE" in
        1)
            echo "== 현재 사용자 정보 =="
            whoami
            w
            ;;

        2)
            echo "== CPU 사용률 =="
            top -b -n 1 | head -n 5
            
            if command -v nvidia-smi &> /dev/null; then
                echo
                echo "== GPU 사용률 =="
                nvidia-smi
            fi
            ;;

        3)
            echo "== 메모리 사용량 =="
            free -h
            ;;

        4)
            echo "== 디스크 사용량 =="
            df -h
            ;;

        5)
            echo "== 종료 =="
            break
            ;;

        *)
            echo "1~5로 다시 입력:"
            ;;
    esac
    echo
done
