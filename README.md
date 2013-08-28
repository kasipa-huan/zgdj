zgdj
====

中国道教


Kilder
------

[Chinese Taoist Association](http://www.taoist.org.cn/webfront/webfront_showDirList.cgi?dircode=1260000000000000000&targetPage=Fdjxy)

Den officielle site for Chinese Taoist Association. I princippet findes her alle udgaver siden starten, dvs også de 4 første numre fra 1962 - 1964.

I praksis er der 'huller', og udgaver fra og med 2012 mangler. Der er af og til links til to andre frit tilgængelige sites med 中国道教.

Ofte er en enkelt artikel splittet op på 2 eller 3 web-sider.


[China Taoism](http://www.chinataoism.org/index.php)

Næsten komplet fra og med 1998, 1 til og med 2006, 3. Mangler 1998, 2.


[eywedu.com](http://www.eywedu.com/daojiao/)

Næsten komplet fra og med 2001, 1 til og med 2008, 6. Mangler 2007, 6.

Denne samling er hostet på et reklame-baseret site. Installer fx AdBlock i browseren for at slippe for flimrende annoncer.


[China Academic Journals Full-text Database](http://eng.oversea.cnki.net/kns55/oldNavi/n_item.aspx?naviid=48&Flg=local&BaseID=DAJA&NaviLink=China+Taoism)

Næsten alle udgaver siden 1980; der mangler to numre fra 1984.

Det er en akademisk tidsskriftsbase, og der er kun adgang til de fulde tekster med betalt login, dvs at det i praksis er udelukket at skaffe indholdet herfra.

Basen er nyttig som en målestok for hvor komplette de andre kilder er. Der mangler dog sidetal eller lignende til at indikere en rækkefølge pr. nummer.


Fremgangsmåde for høst
----------------------

Det er altså nødvendigt at høste artikler fra alle tre frit tilgængelige sites for at få en nogenlunde komplet samling fra 1980 og frem.

Adgangen til tidsskriftet er i store træk organiseret på samme måde på de tre frit tilgængelige sites:

* En index-side til selve tidsskriftet, med links til hvert nummer, evt. via en mellem-side med et antal årgange.
* En indholdsoversigt for hvert nummer med links til artiklerne.
* De enkelte artikler.

I praksis er teknikken bag hvert website ret forskellig. For at skabe en fælles fremgangsmåde er links til hvert nummers indholdsoversigt høstet manuelt. Herefter er det forholdsvis trivielt at hente og behandle hver artikel.

Hver artikel går igennem følgende trin:

1. Hent artikel fra website og gem i en struktur som spejler websitet.
2. Omform artikel fra løs HTML til XML vha. tidy, og gem under årgang/nr struktur.
3. Træk artikelteksten ud af XML vha. et XSLT script.
4. Segmenter artikelteksten, så det bliver mere sikkert at tælle nøgleord.

En sammenligning af indholdsfortegnelser fra de tre frit tilgængelige sites viser en del forskelle mht opdeling og rækkefølge af artiklerne. Den akademiske tidsskriftsbase er formodentlig mere autoritativ mht opdeling af et nummer i artikler, men angiver ikke rækkefølgen. Så det har ikke været praktisk muligt at ordne artiklerne pr nummer på den samme måde for de tre websites. Men strukturen er fælles til og med det enkelte nummer:

    ├── www.chinataoism.org/
    │   ├── content.php?cate_id=501
    │   ├── content.php?cate_id=502
    │   ├── ...
    │   ├── tidy/
    │   │   ├── 1998/
    │   │   │   ├── 01/
    │   │   │   │   ├── 1295.xml
    │   │   │   │   ├── 1296.xml
    │   │   │   │   ├── ...
    │   │   │   ├── 03/
    │   │   │   ├── ...
    │   │   ├── 1999/
    │   │   │   ├── 01/
    │   │   │   ├── 02/
    │   │   │   ├── ...
    │   │   ├── ...
    │   ├── text/
    │   │   ├── 1998/
    │   │   │   ├── 01/
    │   │   │   │   ├── 1295.txt
    │   │   │   │   ├── 1296.txt
    │   │   │   │   ├── ...
    │   │   │   ├── 03/
    │   │   │   ├── ...
    │   │   ├── 1999/
    │   │   │   ├── 01/
    │   │   │   ├── 02/
    │   │   │   ├── ...
    │   │   ├── ...
    │   └── segm/
    │       ├── 1998/
    │       │   ├── 01/
    │       │   │   ├── 1295.txt
    │       │   │   ├── 1296.txt
    │       │   │   ├── ...
    │       │   ├── 03/
    │       │   ├── ...
    │       ├── 1999/
    │       │   ├── 01/
    │       │   ├── 02/
    │       │   ├── ...
    │       ├── ...
    ├── www.eywedu.com/
    │   ├── daojiao/
    │   │   ├── index.html
    │   │   ├── index_zgdj20011.html
    │   │   ├── index_zgdj20012.html
    │   │   ├── ...
    │   ├── text/
    │   │   ├── 2001/
    │   │   ├── 2002/
    │   │   ├── ...
    │   ├── tidy/
    │   │   ├── 2001/
    │   │   ├── 2002/
    │   │   ├── ...
    │   └── segm/
    │       ├── 2001/
    │       ├── 2002/
    │       ├── ...
    └── www.taoist.org.cn/
        ├── webfront/
        │   ├── webfront_showList.cgi?dircode=1260101000000000000&perPageNum=100&targetPage=Fdjxy3
        │   ├── webfront_showList.cgi?dircode=1260102000000000000&perPageNum=100&targetPage=Fdjxy3
        │   ├── ...
        ├── tidy/
        │   ├── 1962/
        │   │   └── 01/
        │   ├── 1963/
        │   │   ├── 01/
        │   │   └── 02/
        │   ├── ...
        ├── text/
        │   ├── 1962/
        │   ├── 1963/
        │   ├── ...
        └── segm/
            ├── 1962/
            ├── 1963/
            ├── ...
    
Dvs, vi kan sammensætte samlingen baseret på hele årgange eller enkeltnumre, og at ordfrekvenser også må baseres på hele årgange eller enkeltnumre.


Segmentering
------------

Til segmentering er valgt [Stanford Word Segmenter](http://nlp.stanford.edu/software/segmenter.shtml) fra The Stanford Natural Language Processing Group. Den er temmelige ressourcekrævende og langsom, men resultaterne er gode.

Kvaliteten af Stanford Word Segmenter er testet vha [Chinese Word Segmentation Evaluation Toolkit](Chinese Word Segmentation Evaluation Toolkit):

    $ perl segmentationPrec.pl dev-ref.utf8 hyp.utf8
    Total:
    	Sub=21872
    	Ins=276
    	Del=174
    
    	Precision: 99.21%
    	Recall: 98.75%
    	F-1: 0.99
    
dvs tæt på manual segmentering.

Hastigheden af segmenteringen kan sættes op, først og fremmest ved ikke at starte segmenteren forfra for hver artikel. Dels kunne man samle teksten pr nummer og segmentere den samlede tekst istedet for hver enkelt artikel, dels kunne man skrive en lille server som ikke lukker ned efter hvert dokument.


Ordfrekvenser
-------------

Mængden af tekst i hver årgang varierer en del; dels er der kun 2, 3 eller 4 udgaver pr. år i de første årgange, dels er nogle numre kun repræsenteret med en indholdsfortegnelse. Et mål for variation af ordfrekvens over tid skal derfor være relativt til tekstmængden i perioden. 

En [rangordning](http://en.wikipedia.org/wiki/Frequency_list) af nøgleords frekvens kan fås ved at sætte antallet i et korpus i forhold til det hyppigste ord:

    N = ceil( 0.5 - log2(nøgleordsfrekvens / det hyppigste ords frekvens) )

Det hyppigste ord får frekvensklassen 0, et halvt så hyppigt ord får frekvensklasse 1 og så videre. Idet ordfrekvens i reglen følger en [potenslov](http://en.wikipedia.org/wiki/Zipf's_law) afspejler frekvensklassen på en fornuftig måde den relative hyppighed. 

Til beregning af en samlet frekvensklasse for en samling af `n` relaterede nøgleord bruger vi det harmoniske gennemsnit af nøgleordsfrekvenserne:

    samlet nøgleordsfrekvens = n / (1/x1 + 1/x2 + ... + 1/xn)

Det er ikke iøvrigt nødvendigt at tænke på lemmatisering af kinesisk. Men der er brug for at droppe tegnsætning fra segmenterens output; visse tegn som fx ， 。 、 “ ” 》 og 《 er meget hyppige. En simpel og effektiv metode er at droppe `[:punct:]` med et regulært udtryk.


Installation
------------

Al anvendt software er fri til ikke-kommerciel brug.

Det meste vil kunne køre på en almindelig Linux med lidt tilpasning.

På Mac OSX er der brug for mere opdaterede udgaver af forskellige programmer. Til det formål kan man installere Home Brew.

Læs først [wikien](https://github.com/mxcl/homebrew/wiki/Installation).

Begynd med at installere [Xcode](https://itunes.apple.com/us/app/xcode/id497799835).

Set PATH i ~/.profile

    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix gnu-sed)/libexec/gnubin:/usr/local/sbin:/usr/local/bin:$PATH"

og start en ny session.

Tilføj [homebrew-dupes](https://github.com/Homebrew/homebrew-dupes) før installation af `grep` og `tidy`.

    brew tap homebrew/dupes

Installer utilities

    brew install coreutils
    brew install findutils --default-names
    brew install gnu-sed --default-names
    brew install grep --default-names
    brew install wget
    brew install saxon
    brew install tidy

Installer evt [Java fra Oracle](http://www.java.com/en/download/index.jsp)
