#!/bin/sh

BASEDIR=stanford-segmenter-2013-06-20
DATADIR=$BASEDIR/data

java -mx2g \
-cp $BASEDIR/seg.jar edu.stanford.nlp.ie.crf.CRFClassifier \
-sighanCorporaDict $DATADIR \
-inputEncoding UTF-8 \
-sighanPostProcessing true \
-keepAllWhitespaces true \
-loadClassifier $DATADIR/ctb.gz \
-serDictionary $DATADIR/dict-chris6.ser.gz \
-testFile $1
