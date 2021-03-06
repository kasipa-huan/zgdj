# makefile

# host
HOST=www.chinataoism.org

# wget
WGET="wget --directory-prefix=$HOST --no-clobber --reject=css,gif,jpg,js,jsp,swf"

# tidy
TIDY="tidy -config chinataoism.cfg"

# segment
SEGMENT="../segment.sh"

articles = $(shell cat chinataoism.ids)

all :
	echo ${articles}

# get article
#$HOST/showtopic.php?id=% :
#	$WGET "http://$HOST/showtopic.php?id=%"

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
