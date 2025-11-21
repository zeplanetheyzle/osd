#!/bin/bash

DB_DIR="DB"
TRAIN_DIR="train"
FILE_PREFIX="data"
NUM_FILES=5

if [ ! -d "$DB_DIR" ]; then
    mkdir "$DB_DIR"
fi

cd "$DB_DIR"

for i in $(seq 1 $NUM_FILES); do
    echo "이 파일은 $i." > "${FILE_PREFIX}_${i}.txt"
done

tar -czf "${DB_DIR}.tar.gz" "${FILE_PREFIX}_1.txt" "${FILE_PREFIX}_2.txt" "${FILE_PREFIX}_3.txt" "${FILE_PREFIX}_4.txt" "${FILE_PREFIX}_5.txt"

cd ..

if [ ! -d "$TRAIN_DIR" ]; then
    mkdir "$TRAIN_DIR"
fi

for i in $(seq 1 $NUM_FILES); do
    ln "${DB_DIR}/${FILE_PREFIX}_${i}.txt" "${TRAIN_DIR}/${FILE_PREFIX}_${i}.txt"
done

echo "DB 폴더 생성 및 파일 생성, 압축 완료."
echo "train 폴더에 DB 파일 5개의 링크가 생성되었습니다."
