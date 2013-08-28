#!/usr/bin/env bash
#
# iconv
#
# homebrew
#   gnu-sed
#   saxon
#   tidy
#   wget
#
# stanford-segmenter-2013-06-20
#

# export PATH=$(brew --prefix gnu-sed)/libexec/gnubin:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

# host
HOST=www.eywedu.com

# pattern for each issue
ISSUE="$HOST/daojiao/index_zgdjYYYYN.html"

# wget
WGET="wget --timestamping --reject=css,gif,jpg,js,jsp,swf"

# tidy
TIDY="tidy -config eywedu.cfg"

# segment
SEGMENT="../segment.sh"


# crawl each issue
while read YEAR NO YYYYN; do
  echo ${ISSUE/YYYYN/$YYYYN};
  [ -s ${ISSUE/YYYYN/$YYYYN} ] || {
    $WGET --directory-prefix=$HOST/daojiao http://${ISSUE/YYYYN/$YYYYN};
  }

  # pick links to articles
  # <a href="zgdj2008/zgdj20080601.html">深研经典，环顾宇内，振兴道家</a>
  articles=$(grep -Eho "href=\"zgdj$YEAR/zgdj$YEAR$NO[0-9]+\.html\"" ${ISSUE/YYYYN/$YYYYN} |sed -r -e 's/^.*zgdj([0-9]+)\.html"$/\1/');

  # get each article
  for id in $articles; do
    # get article
    echo $HOST/daojiao/zgdj$YEAR/zgdj$id.html;
    [ -s $HOST/daojiao/zgdj$YEAR/zgdj$id.html ] || {
      $WGET --directory-prefix=$HOST/daojiao/zgdj$YEAR "http://$HOST/daojiao/zgdj$YEAR/zgdj$id.html";
    }

    # tidy
#    [ $HOST/tidy/$YEAR/$NO/$id.xml -nt $HOST/daojiao/zgdj$YEAR/zgdj$id.html ] || {
    [ -s $HOST/tidy/$YEAR/$NO/$id.xml ] || {
      mkdir -p $HOST/tidy/$YEAR/$NO;
      iconv -f GB18030 -t UTF8 "$HOST/daojiao/zgdj$YEAR/zgdj$id.html" |tidy -config eywedu.cfg >$HOST/tidy/$YEAR/$NO/$id.xml;
    }

    # extract text
#    [ $HOST/text/$YEAR/$NO/$id.txt -nt $HOST/tidy/$YEAR/$NO/$id.xml ] || {
    [ -s $HOST/text/$YEAR/$NO/$id.txt ] || {
      mkdir -p $HOST/text/$YEAR/$NO;
      saxon -xsl:eywedu.xsl -s:$HOST/tidy/$YEAR/$NO/$id.xml >$HOST/text/$YEAR/$NO/$id.txt;
    }

    # segment text
#    [ $HOST/segm/$YEAR/$NO/$id.txt -nt $HOST/text/$YEAR/$NO/$id.txt ] || {
    [ -s $HOST/segm/$YEAR/$NO/$id.txt ] || {
      mkdir -p $HOST/segm/$YEAR/$NO;
      $SEGMENT $HOST/text/$YEAR/$NO/$id.txt >$HOST/segm/$YEAR/$NO/$id.txt 2>/dev/null;
    }

  done;
done < eywedu.lst

# TODO
#
# $ find www.eywedu.com -name '*.xml' -size 0
# www.eywedu.com/daojiao/zgdj2006/zgdj20060606.html
#   <Feeding the Hungry Ghost Festival>
#
# $ find www.eywedu.com -name '*.txt' -size 0
# ...
# usually illegal characters
#
