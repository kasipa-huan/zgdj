#!/usr/bin/env bash
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
HOST=www.taoist.org.cn

# pattern for each issue
ISSUE="$HOST/webfront/webfront_showList.cgi?dircode=DIRCODE&perPageNum=100&targetPage=Fdjxy3"

# wget
# WGET="wget --user-agent=Mozilla/5.0 --recursive --level=1 --no-parent --no-clobber --reject=css,gif,jpg,js,jsp,swf --load-cookies=./cookies.txt --save-cookies=./cookies.txt --keep-session-cookies"
WGET="wget --user-agent=Mozilla/5.0 --directory-prefix=$HOST/webfront --no-clobber --reject=css,gif,jpg,js,jsp,swf --load-cookies=./cookies.txt --save-cookies=./cookies.txt --keep-session-cookies"

# tidy
TIDY="tidy -config taoist.cfg"

# segment
SEGMENT="../segment.sh"

# ensure that a cookie file exists
touch ./cookies.txt

# crawl each issue
while read YEAR NO DIRCODE; do
  # no timestamping; remove contents table to trigger re-download
  rm -f "${ISSUE/DIRCODE/$DIRCODE}";
  # get contents table and articles
  $WGET http://${ISSUE/DIRCODE/$DIRCODE};

  # pick links to articles
  # <a href="/webfront/webfront_viewContents.cgi?id=5653" class="z_l" target="_blank">《中国道教》2010年第6期目录</a>
  # exceptions, ids above 8000 are for news items, e.g. 8386, 8471, 8556, 8557, 8589, 8594
  articles=$(grep -Eho 'href="/webfront/webfront_viewContents.cgi\?id=[^"]+"' ${ISSUE/DIRCODE/$DIRCODE} |sed -r -e 's/.*\?id=([^"]+)"/\1/' -e 's/^8[0-9]+$//');

  # get each article
  for id in $articles; do
    $WGET "http://$HOST/webfront/webfront_viewContents.cgi?id=$id";

    # tidy
    mkdir -p $HOST/tidy/$YEAR/$NO;
    $TIDY "$HOST/webfront/webfront_viewContents.cgi?id=$id" |sed -r -e 's/<\/?o:p>//g' -e 's/<\/?st1:personname[^>]*>//g' >$HOST/tidy/$YEAR/$NO/$id.xml;

    # extract text
    mkdir -p $HOST/text/$YEAR/$NO;
    saxon -xsl:taoist.xsl -s:$HOST/tidy/$YEAR/$NO/$id.xml >$HOST/text/$YEAR/$NO/$id.txt;

    # segment text
    mkdir -p $HOST/segm/$YEAR/$NO;
    $SEGMENT $HOST/text/$YEAR/$NO/$id.txt >$HOST/segm/$YEAR/$NO/$id.txt

  done;
done < taoist.lst

