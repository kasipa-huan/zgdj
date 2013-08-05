#!/usr/bin/env bash

# export PATH=$(brew --prefix gnu-sed)/libexec/gnubin:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

WGET="wget --user-agent=Mozilla/5.0 --recursive --level=1 --no-parent --no-clobber --reject=css,gif,jpg,js,jsp,swf --load-cookies=./cookies.txt --save-cookies=./cookies.txt --keep-session-cookies"

SHOWLIST="www.taoist.org.cn/webfront/webfront_showList.cgi?dircode=DIRCODE&perPageNum=100&targetPage=Fdjxy3"

touch ./cookies.txt

# get
while read DIRCODE; do
  rm "${SHOWLIST/DIRCODE/$DIRCODE}";
  $WGET http://${SHOWLIST/DIRCODE/$DIRCODE};
done < dircode.lst

# tidy
TIDY="tidy -config tidy.cfg"
find www.taoist.org.cn/webfront -name "webfront_viewContents.cgi\?id=*" |while read id ; do
  $TIDY $id |sed -r -e 's/<\/?o:p>//g' -e 's/<\/?st1:personname[^>]*>//g' >tidy/${id##*=}.xml ;
done


# for x in tidy/*.xml ; do echo -ne $x"\t" ; saxon -xsl:extract-article.xsl -s:$x ; done
