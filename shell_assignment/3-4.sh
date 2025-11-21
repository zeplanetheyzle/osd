#!/bin/bash

scores=""
choice=""

while [ "$choice" != "5" ]; do
    
    echo "=============================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "=============================="
    echo -n "선택할 메뉴 번호를 입력하세요 (1-5): "
    read choice

    case "$choice" in
        1)
            echo -n "추가할 과목 점수를 입력(0-100): "
            read new_score
            if ! [[ "$new_score" =~ ^[0-9]+$ ]] || [ "$new_score" -lt 0 ] || [ "$new_score" -gt 100 ]; then
                echo "경고: 0~100 사이의 숫자를 입력"
            else
                scores+=("$new_score")
                echo "=> 점수 $new_score 가 추가"
            fi
            ;;

        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "=> 입력된 점수가 없음"
            else
                echo "==등록된 점수 목록=="
                for i in "${!scores[@]}"; do
			if [ -z "${scores[i]}" ];then
                    		continue
			fi
			echo "과목 $((i+1)): ${scores[i]} 점"
                done
            fi
            ;;

	3 | 4)
            total=0
            valid_count=0
            
            for score in "${scores[@]}"; do
                if [ -n "$score" ]; then
                    total=$(($total + $score))
                    valid_count=$(($valid_count + 1))
                fi
            done

            if [ "$valid_count" -eq 0 ]; then
                echo "=> 입력된 점수가 없음"
                continue
            fi
            
            avg_score=$(($total / $valid_count))
            echo "=> 총 $valid_count 과목의 평균 점수는 $avg_score 점"

            if [ "$choice" -eq 4 ]; then
                if [ "$avg_score" -ge 90 ]; then
                    avg_gpa="4.0 (A)"
		elif [ "$avg_score" -ge 80 ]; then
    		    avg_gpa="3.0 (B)"
                else
                    avg_gpa="2.0 (C)"
                fi
                echo "=> 평균 점수 ($avg_score 점)의 평균 GPA는 $avg_gpa"
            fi
            ;;
        5)
            echo "종료"
            ;;
        
        *)
            echo "1~5숫자로 다시 입력:"
            ;;
    esac
    echo
done
