#!/usr/bin/env bash

KEYWORDS=$1;

[ $1 -a -s $1 ] || {
  echo "$0 keyword.lst";
  exit -1;
}

IFS=":";

echo -n "År";
while read -a TOPICS; do
  echo -n ",${TOPICS[0]}";
done <$KEYWORDS;

while read YEAR HOST; do

  echo -en "\n$YEAR";

  # top phrase frequency
  TOP=$(sed -nr -e '1 s/^([^\s]+)\s+(.*)$/\1/p' $YEAR.frq);

  # loop key topics
  while read -a TOPICS; do

    TITLE=${TOPICS[0]};
    N=$((${#TOPICS[@]}));

    freq=0;
    count=0;
    for (( i = 1; i < $N; i++ )) do
      topic=${TOPICS[$i]};
      f=$(sed -nr -e "s/^([^\s]+)\s+($topic)$/\1/p" $YEAR.frq);
      [[ $f -gt 0 ]] && {
        freq=$(($freq + ${f:=0}));
        count=$(($count + 1));
      }
    done
    echo -n ",";
    if [[ $count -gt 0 ]]; then
      echo "l($freq / ($count * $TOP)) / l(2)" |bc -l |tr -d '\n';
    else
      echo -n "";
    fi

  done <$KEYWORDS;

done <zgdj.lst
