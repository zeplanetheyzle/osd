#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "how to use: $0 <int1> <int2> [int3 ...]"
    echo "please enter at least two"
    exit 1
fi

total_score=0
count=0

echo "==result=="

for score in "$@"; do
    if [ "$score" -lt 0 ] || [ "$score" -gt 100 ]; then
        echo "warning: ($score) is outside in range(0~100)"
        continue
    fi
    
    if [ "$score" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    
    echo "점수 $score: 등급 $grade"
    
    total_score=$(($total_score + $score))
    count=$(($count + 1))
done

if [ "$count" -gt 0 ]; then
    average_score=$(($total_score / $count))
    
    if [ "$average_score" -ge 90 ]; then
        average_grade="A"
    else
        average_grade="B"
    fi

    echo "==result=="
    echo "총 점수 합계: $total_score"
    echo "과목 수: $count"
    echo "평균 점수: $average_score"
    echo "평균 등급: $average_grade"
fi
