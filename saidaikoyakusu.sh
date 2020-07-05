#!/bin/sh

# 引数の数判定
# 　　失敗時： input 2 argments
# 数値かどうか判定
# 　　失敗時： input natural number
# 動作開始
# 　　引数aと引数bを比較
# 　　a >= b →　iにaを代入jにbを代入|| iにb,jにa
#            → i%j → 余り0 → jが最大公約数
#                  → 余りあり → iにjを代入、jに余りを代入

if [ $# -ne 2 ]; then
	echo "input 2 argments" 1>&2
	exit 1
fi
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ]; then
	echo "input narural number" 1>&2
	exit 1
fi

if [ $1 -ge $2 ]; then
    i=$1
    j=$2
    echo "$1 is greater equal than $2"
    echo "iに$i、jに$j"
else
    i=$2
    j=$1
    echo "$1 is lesser than $2"
    echo "iに$i、jに$j"
fi

while [ r=$((i%j)) != 0 ]
do
 if [ $r -eq 0 ]; then
	 break
 fi

	i=$j
	j=$r
done

echo "最大公約数は$j"
