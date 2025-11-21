#!/bin/bash

DB_FILE="DB.txt"

if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "=============================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "=============================="
    echo -n "메뉴 번호를 입력하세요 (1-5): "
    read CHOICE
    echo

    case "$CHOICE" in
        1)
            echo "== 팀원 정보 추가 =="
            echo -n "이름: "
            read NAME
            echo -n "생일 또는 전화번호: "
            read CONTACT
            
            # 정보 형식: INFO|이름|연락처
            echo "INFO|$NAME|$CONTACT" >> "$DB_FILE"
            echo "=> 팀원 $NAME 의 정보가 DB.txt에 추가되었습니다."
            ;;

        2)
            echo "== 팀원과 한 일 기록 =="
            echo -n "날짜 (YYYY-MM-DD): "
            read DATE
            echo -n "팀원 이름: "
            read TEAMMATE
            echo -n "수행 내용: "
            read TASK
            
            echo "TASK|$DATE|$TEAMMATE|$TASK" >> "$DB_FILE"
            echo "=> $DATE 에 $TEAMMATE 와의 활동이 기록되었습니다."
            ;;

        3)
            echo "== 팀원 이름 검색 =="
            echo -n "검색할 팀원 이름: "
            read SEARCH_NAME
            echo "----------------------------"
            echo "[ $SEARCH_NAME 관련 팀원 정보 ]"
            
            grep "^INFO|$SEARCH_NAME" "$DB_FILE" | awk -F'|' '{print "이름: "$2", 연락처: "$3}'
            
            echo
            echo "[ $SEARCH_NAME 관련 수행 내용 기록 ]"
            grep "^TASK|.*|$SEARCH_NAME" "$DB_FILE" | awk -F'|' '{print "날짜: "$2", 내용: "$4}'
            echo "----------------------------"
            ;;

        4)
            echo "== 날짜별 수행 내용 검색 =="
            echo -n "검색할 날짜 (YYYY-MM-DD): "
            read SEARCH_DATE
            echo "----------------------------"
            echo "[ $SEARCH_DATE 날짜별 수행 내용 ]"
            
            read TEAMMATE
            echo -n "수행 내용: "
            read TASK

            # 기록 형식: TASK|날짜|이름|내용
            echo "TASK|$DATE|$TEAMMATE|$TASK" >> "$DB_FILE"
            echo "=> $DATE 에 $TEAMMATE 와의 활동이 기록되었습니다."
            ;;

        3)
            echo "== 팀원 이름 검색 =="
            echo -n "검색할 팀원 이름: "
            read SEARCH_NAME
            echo "----------------------------"
            echo "[ $SEARCH_NAME 관련 팀원 정보 ]"

            # INFO 라인에서 이름 검색
            grep "^INFO|$SEARCH_NAME" "$DB_FILE" | awk -F'|' '{print "[>

            echo
            echo "[ $SEARCH_NAME 관련 수행 내용 기록 ]"
            # TASK 라인에서 이름 검색
            grep "^TASK|.*|$SEARCH_NAME" "$DB_FILE" | awk -F'|' '{print>
            echo "----------------------------"
            ;;

        4)
            echo "== 날짜별 수행 내용 검색 =="
            echo -n "검색할 날짜 (YYYY-MM-DD): "
            read SEARCH_DATE
            echo "----------------------------"
            echo "[ $SEARCH_DATE 날짜별 수행 내용 ]"
	    grep "^TASK|$SEARCH_DATE" "$DB_FILE" | awk -F'|' '{print "팀원: "$3", 내용: "$4}'
            echo "----------------------------"
            ;;

        5)
            echo "== 종료 =="
            break
            ;;

        *)
            echo "1~5숫자로 다시 입력:"
            ;;
    esac
    echo
done
