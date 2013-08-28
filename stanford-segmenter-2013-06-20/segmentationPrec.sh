#!/bin/sh

wget http://projectile.sv.cmu.edu/research/public/tools/segmentation/eval/dev.gb
wget http://projectile.sv.cmu.edu/research/public/tools/segmentation/eval/dev-ref.gb
wget http://projectile.sv.cmu.edu/research/public/tools/segmentation/eval/segmentationPrec.pl

iconv -f GB18030 -t UTF8 dev.gb >dev.utf8
iconv -f GB18030 -t UTF8 dev-ref.gb >dev-ref.utf8

./segment.sh -k ctb dev.utf8 UTF-8 0 >hyp.utf8

perl segmentationPrec.pl dev-ref.utf8 hyp.utf8
