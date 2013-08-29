#!/usr/bin/env bash

IFS=":";

# topics with several words
while read -a TOPICS; do
    N=$((${#TOPICS[@]}));
    for (( i = 1; i < $N; i++ )) do
      topic=${TOPICS[$i]};
      if [[ $topic =~ " " ]]; then
        if [[ $PHRASES ]]; then
          PHRASES="$PHRASES|$topic";
        else
          PHRASES="$topic";
        fi
      fi
    done
done <keytopics.lst
# echo $PHRASES

while read YEAR HOST; do

  # frequencies for this year
  {
    find $HOST/segm/$YEAR -name '*.txt' |xargs cat |tr '\n' ' ' |grep -Eo "$PHRASES" |sort |uniq -c;
    find $HOST/segm/$YEAR -name '*.txt' |xargs cat |tr ' ' '\n' |grep -Ev '^[[:punct:]]+$' |sort |uniq -c;
  } |sort -nr >$YEAR.frq;

done <zgdj.lst
