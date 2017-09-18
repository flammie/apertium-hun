#!/bin/bash

# hunspell -> apertium map
#HUN	APE	DEL

#/1 	n__szem	0
egrep '/1     1$' hu_HU.dic |\
    sed -e 's@/1    1@<par n="szem__n"/>@' \
    -e 's:^\([^<]*\):    <e lm="\1"><p><l>\1</l></r>\1</r><p>:' \
    -e 's:$:</e>:'
#/3 n__úrnő 
egrep '/3     1$' hu_HU.dic |\
    sed -e 's@/3    1@<par n="úrnő__n"/>@' \
    -e 's:^\([^<]*\):    <e lm="\1"><p><l>\1</l></r>\1</r><p>:' \
    -e 's:$:</e>:'
egrep '/4     1$' hu_HU.dic |\
    sed -e 's@/4    1@<par n="úrnő__n"/>@' \
    -e 's:^\([^<]*\):    <e lm="\1"><p><l>\1</l></r>\1</r><p>:' \
    -e 's:$:</e>:'
#4 n__bélyeg
egrep '/5     1$' dev/hu_HU.dic |\
    sed -e 's@/5        1@<par n="bélyeg__n"/>@' \
    -e 's:^\([^<]*\):    <e lm="\1"><p><l>\1</l><r>\1</r></p>:' \
    -e 's:$:</e>:' | sort >> apertium-hun.hun.dix 

# /779       10929  vblex__
egrep '/779   10929$' dev/hu_HU.dic |\
    sed -e 's@/779  10929@<par n="imád__vblex"/>@' \
    -e 's:^\([^<]*\):    <e lm="\1"><p><l>\1</l><r>\1</r></p>:' \
    -e 's:$:</e>:' | sort >> apertium-hun.hun.dix 

