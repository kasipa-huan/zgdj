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
HOST=www.chinataoism.org

# pattern for each issue
ISSUE="$HOST/content.php?cate_id=CATE_ID"

# wget
WGET="wget --directory-prefix=$HOST --no-clobber --reject=css,gif,jpg,js,jsp,swf"

# tidy
TIDY="tidy -config chinataoism.cfg"

# segment
SEGMENT="../segment.sh"

# truncate id list
echo '' >chinataoism.ids;

# crawl each issue
while read YEAR NO CATE_ID; do
  echo ${ISSUE/CATE_ID/$CATE_ID};
  [ -s ${ISSUE/CATE_ID/$CATE_ID} ] || {
    $WGET http://${ISSUE/CATE_ID/$CATE_ID};
  }

  # pick links to articles
  # href="showtopic.php?id=1295&cate_id=501"
  articles=$(grep -Eho 'href="showtopic.php\?[^"]+"' ${ISSUE/CATE_ID/$CATE_ID} |sed -r -e 's/.*\?id=([^&]+).*"/\1/');

  # get each article
  for id in $articles; do

echo $HOST/$YEAR/$NO/$id >>chinataoism.ids;

#     # get article
#     [ -s "$HOST/showtopic.php?id=$id" ] || {
#       $WGET "http://$HOST/showtopic.php?id=$id";
#     }

#     # tidy
#     # list of broken entities:
#     # $ grep -Eoh '&#[0-9]+[^;]' www.chinataoism.org/showtopic.php\?id\=* |grep -Eo '&#[0-9]+' |sort -u
# #    [ $HOST/tidy/$YEAR/$NO/$id.xml -nt "$HOST/showtopic.php?id=$id" ] || {
#     [ -s $HOST/tidy/$YEAR/$NO/$id.xml ] || {
#       mkdir -p $HOST/tidy/$YEAR/$NO;
#       sed -r -e 's/&#([0-9]+)([^;])/\&#\1;\2/g' "$HOST/showtopic.php?id=$id" |$TIDY >$HOST/tidy/$YEAR/$NO/$id.xml;
#     }

#     # extract text
# #    [ $HOST/text/$YEAR/$NO/$id.txt -nt $HOST/tidy/$YEAR/$NO/$id.xml ] || {
#     [ -s $HOST/text/$YEAR/$NO/$id.txt ] || {
#       mkdir -p $HOST/text/$YEAR/$NO;
#       saxon -xsl:chinataoism.xsl -s:$HOST/tidy/$YEAR/$NO/$id.xml >$HOST/text/$YEAR/$NO/$id.txt;
#     }

#     # segment text
# #    [ $HOST/segm/$YEAR/$NO/$id.txt -nt $HOST/text/$YEAR/$NO/$id.txt ] || {
#     [ -s $HOST/segm/$YEAR/$NO/$id.txt ] || {
#       mkdir -p $HOST/segm/$YEAR/$NO;
#       $SEGMENT $HOST/text/$YEAR/$NO/$id.txt >$HOST/segm/$YEAR/$NO/$id.txt;
#     }

  done;
done < chinataoism.lst


