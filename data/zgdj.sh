#!/usr/bin/env bash

while read YEAR HOST; do

  # frequencies for this year
#  [ -s $YEAR.frq ] || {
    find $HOST/segm/$YEAR -name '*.txt' |xargs cat |tr ' ' '\n' |grep -Ev '^[[:punct:]]+$' |sort |uniq -c |sort -nr >$YEAR.frq;
#  }

  # top phrase frequency
  TOP=$(sed -nr -e '1 s/^([^\s]+)\s+(.*)$/\1/p' $YEAR.frq);

  # loop key topics
  while read -a TOPICS; do

    TITLE=${TOPICS[0]};
    N=$(( ${#TOPICS[@]} - 1 ));

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
    [[ $count -gt 0 ]] && {
      echo -n "$YEAR,$TITLE,";
      echo "0.5 - l($freq / ($count * $TOP)) / l(2)" |bc -l |sed -r -e 's/\..*$//';

    }

  done <keytopics.lst;

  

done <zgdj.lst
