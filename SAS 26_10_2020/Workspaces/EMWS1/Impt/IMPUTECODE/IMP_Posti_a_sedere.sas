*;
* IMPUTE VARIABLE: Posti_a_sedere;
*;
length IMP_Posti_a_sedere 8;
label IMP_Posti_a_sedere = 'Imputed Posti_a_sedere';
IMP_Posti_a_sedere = Posti_a_sedere;
if missing(IMP_Posti_a_sedere) then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH I_Posti_a_sedere $ 12;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_Posti_a_sedere4 = 'Previsto: Posti_a_sedere=4';
label P_Posti_a_sedere2 = 'Previsto: Posti_a_sedere=2';
label P_Posti_a_sedere5 = 'Previsto: Posti_a_sedere=5';
label P_Posti_a_sedere3 = 'Previsto: Posti_a_sedere=3';
label P_Posti_a_sedere7 = 'Previsto: Posti_a_sedere=7';
label P_Posti_a_sedere6 = 'Previsto: Posti_a_sedere=6';
label P_Posti_a_sedere9 = 'Previsto: Posti_a_sedere=9';
label P_Posti_a_sedere8 = 'Previsto: Posti_a_sedere=8';
label Q_Posti_a_sedere4 = 'P non corretto: Posti_a_sedere=4';
label Q_Posti_a_sedere2 = 'P non corretto: Posti_a_sedere=2';
label Q_Posti_a_sedere5 = 'P non corretto: Posti_a_sedere=5';
label Q_Posti_a_sedere3 = 'P non corretto: Posti_a_sedere=3';
label Q_Posti_a_sedere7 = 'P non corretto: Posti_a_sedere=7';
label Q_Posti_a_sedere6 = 'P non corretto: Posti_a_sedere=6';
label Q_Posti_a_sedere9 = 'P non corretto: Posti_a_sedere=9';
label Q_Posti_a_sedere8 = 'P non corretto: Posti_a_sedere=8';
label I_Posti_a_sedere = 'In: Posti_a_sedere';
label U_Posti_a_sedere = 'Non normalizzata in: Posti_a_sedere';
label _WARN_ = 'Avvertimenti';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_20 $ 20;
DROP _ARBFMT_20;
_ARBFMT_20 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_23 $ 23;
DROP _ARBFMT_23;
_ARBFMT_23 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_17 $ 17;
DROP _ARBFMT_17;
_ARBFMT_17 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( Porte , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('3' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Modello ) THEN DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('Q3' ,'KONA' ,'E-TRON' ,'DS 3 CROSSBACK' ,'A4' ,'LEAF' ,
'208' ,'CORSA' ,'PARTNER' ,'KANGOO' ,'NEW PANDA' ,'PANDA' ,'YPSILON' ,
'TWINGO' ,'DUSTER' ,'500X' ,'CAPTUR' ,'TIVOLI' ,'RENEGADE' ,'COMPASS' ,
'STONIC' ,'SPORTAGE' ,'GRANDLAND X' ,'OUTLANDER' ,'CROSSLAND X' ,'TIPO' ,
'CLIO' ,'SANDERO' ,'GIULIETTA' ,'FIESTA' ,'C3' ,'VITARA' ,'500L' ,'Q5' ,
'PUMA' ,'NX 300' ,'UX 250H' ,'X1' ,'C-HR' ,'CX-30' ,'3008' ,'X3' ,
'PASSAT VARIANT' ,'508' ,'520' ,'A6' ,'LEON' ,'COROLLA' ,'CAYENNE' ,
'GOLF' ,'YARIS' ,'A5' ,'A3' ,'UP!' ,'POLO' ,'T-ROC' ,'CLA 200' ,'ARONA' ,
'STELVIO' ,'ATECA' ,'KADJAR' ,'KAMIQ' ,'QASHQAI' ,'X-TRAIL' ,'WRANGLER' ,
'T-CROSS' ,'Q2' ,'TIGUAN' ,'OCTAVIA' ,'MEGANE' ,'TALISMAN' ,'ASTRA' ,
'FOCUS' ,'GOLF VARIANT' ,'308' ,'PASSAT' ,'318' ,'C4 CACTUS' ,'IBIZA' ,
'SCALA' ,'GIULIA' ,'E-PACE' ,'COMBO' ,'118' ,'TUCSON' ,
'GRAND C4 SPACETOURER' ,'SCENIC' ,'DOBLO' ,'CADDY' ,'B 180' ,'218' ,
'216' ,'TOURAN' ,'FIORINO' ,'C 220' ,'L200' ,'COOPER D COUNTRYMAN' ,
'CHEROKEE' ,'INSIGNIA' ,'COOPER D CLUBMAN' ,'A4 ALLROAD' ,'320' ,'730' ,
'ESPACE' ,'C4 SPACETOURER' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('FORTWO' ,'500' ,'500C' ,'420' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Carrozzeria ) THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('BERLINA' ,'SUV/FUORISTRADA/PICK-UP' ,'STATION WAGON' ,
'ALTRO' ,'MONOVOLUME' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('CITY CAR' ,'CABRIO' ,'434F5550C383C2A9'x ) THEN
DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('500' ,'500C' ,'A5' ,'T-ROC' ,'218' ,'420' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('FORTWO' ,'DOBLO' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF 948.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_Cilindrata < 948.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Carrozzeria ) THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('CITY CAR' ,'BERLINA' ,'CABRIO' ,'ALTRO' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('434F5550C383C2A9'x ,'MONOVOLUME' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
IF NOT MISSING(REP_price ) AND
22400 <= REP_price THEN DO;
P_Posti_a_sedere4 = 0.6;
P_Posti_a_sedere2 = 0.2;
P_Posti_a_sedere5 = 0;
P_Posti_a_sedere3 = 0.2;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.6;
Q_Posti_a_sedere2 = 0.2;
Q_Posti_a_sedere5 = 0;
Q_Posti_a_sedere3 = 0.2;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '4';
U_Posti_a_sedere = 4;
END;
ELSE DO;
P_Posti_a_sedere4 = 0;
P_Posti_a_sedere2 = 1;
P_Posti_a_sedere5 = 0;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0;
Q_Posti_a_sedere2 = 1;
Q_Posti_a_sedere5 = 0;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '2';
U_Posti_a_sedere = 2;
END;
END;
ELSE DO;
P_Posti_a_sedere4 = 0.97809278350515;
P_Posti_a_sedere2 = 0.00386597938144;
P_Posti_a_sedere5 = 0.00386597938144;
P_Posti_a_sedere3 = 0.0090206185567;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0.00515463917525;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.97809278350515;
Q_Posti_a_sedere2 = 0.00386597938144;
Q_Posti_a_sedere5 = 0.00386597938144;
Q_Posti_a_sedere3 = 0.0090206185567;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0.00515463917525;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '4';
U_Posti_a_sedere = 4;
END;
END;
ELSE DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('PARTNER' ) THEN DO;
P_Posti_a_sedere4 = 0;
P_Posti_a_sedere2 = 0;
P_Posti_a_sedere5 = 0;
P_Posti_a_sedere3 = 1;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0;
Q_Posti_a_sedere2 = 0;
Q_Posti_a_sedere5 = 0;
Q_Posti_a_sedere3 = 1;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '3';
U_Posti_a_sedere = 3;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_price ) AND
REP_price < 12720 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_price ) AND
12720 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Anno ) THEN DO;
IF REP_Anno < 2015.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 2015.5 <= REP_Anno THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('STATION WAGON' ,'MONOVOLUME' ) THEN DO;
P_Posti_a_sedere4 = 0;
P_Posti_a_sedere2 = 0.58823529411764;
P_Posti_a_sedere5 = 0.41176470588235;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0;
Q_Posti_a_sedere2 = 0.58823529411764;
Q_Posti_a_sedere5 = 0.41176470588235;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '2';
U_Posti_a_sedere = 2;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('NEW PANDA' ,'PANDA' ,'TWINGO' ,'UP!' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('YPSILON' ,'TIPO' ,'CLIO' ,'SANDERO' ) THEN
DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF REP_Cilindrata < 1305 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1305 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF REP_price < 11925 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 11925 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Posti_a_sedere4 = 0.88532110091743;
P_Posti_a_sedere2 = 0;
P_Posti_a_sedere5 = 0.11467889908256;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.88532110091743;
Q_Posti_a_sedere2 = 0;
Q_Posti_a_sedere5 = 0.11467889908256;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '4';
U_Posti_a_sedere = 4;
END;
ELSE DO;
P_Posti_a_sedere4 = 0.24647887323943;
P_Posti_a_sedere2 = 0;
P_Posti_a_sedere5 = 0.75352112676056;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.24647887323943;
Q_Posti_a_sedere2 = 0;
Q_Posti_a_sedere5 = 0.75352112676056;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '5';
U_Posti_a_sedere = 5;
END;
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( Cilindri , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ,'3' ,'4' ,'6' ,'8' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('2' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF 886.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_Cilindrata < 886.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_Posti_a_sedere4 = 0.83529411764705;
P_Posti_a_sedere2 = 0;
P_Posti_a_sedere5 = 0.16470588235294;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.83529411764705;
Q_Posti_a_sedere2 = 0;
Q_Posti_a_sedere5 = 0.16470588235294;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '4';
U_Posti_a_sedere = 4;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Peso_a_vuoto ) AND
REP_Peso_a_vuoto < 1080 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Peso_a_vuoto ) AND
1080 <= REP_Peso_a_vuoto THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF REP_price < 13495 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 13495 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('METANO' ) THEN DO;
P_Posti_a_sedere4 = 0.75;
P_Posti_a_sedere2 = 0.25;
P_Posti_a_sedere5 = 0;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.75;
Q_Posti_a_sedere2 = 0.25;
Q_Posti_a_sedere5 = 0;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '4';
U_Posti_a_sedere = 4;
END;
ELSE DO;
P_Posti_a_sedere4 = 0.16666666666666;
P_Posti_a_sedere2 = 0;
P_Posti_a_sedere5 = 0.83333333333333;
P_Posti_a_sedere3 = 0;
P_Posti_a_sedere7 = 0;
P_Posti_a_sedere6 = 0;
P_Posti_a_sedere9 = 0;
P_Posti_a_sedere8 = 0;
Q_Posti_a_sedere4 = 0.16666666666666;
Q_Posti_a_sedere2 = 0;
Q_Posti_a_sedere5 = 0.83333333333333;
Q_Posti_a_sedere3 = 0;
Q_Posti_a_sedere7 = 0;
Q_Posti_a_sedere6 = 0;
Q_Posti_a_sedere9 = 0;
Q_Posti_a_sedere8 = 0;
I_Posti_a_sedere = '5';
U_Posti_a_sedere = 5;
END;
END;
ELSE DO;
P_Posti_a_sedere4 = 0.00645786244752;
P_Posti_a_sedere2 = 0.00613496932515;
P_Posti_a_sedere5 = 0.96577332902809;
P_Posti_a_sedere3 = 0.00355182434614;
P_Posti_a_sedere7 = 0.01485308362931;
P_Posti_a_sedere6 = 0.00064578624475;
P_Posti_a_sedere9 = 0.0012915724895;
P_Posti_a_sedere8 = 0.0012915724895;
Q_Posti_a_sedere4 = 0.00645786244752;
Q_Posti_a_sedere2 = 0.00613496932515;
Q_Posti_a_sedere5 = 0.96577332902809;
Q_Posti_a_sedere3 = 0.00355182434614;
Q_Posti_a_sedere7 = 0.01485308362931;
Q_Posti_a_sedere6 = 0.00064578624475;
Q_Posti_a_sedere9 = 0.0012915724895;
Q_Posti_a_sedere8 = 0.0012915724895;
I_Posti_a_sedere = '5';
U_Posti_a_sedere = 5;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: Posti_a_sedere;
*;
length _format200 $200;
drop _format200;
_format200 = strip(I_Posti_a_sedere);
if _format200="9" then IMP_Posti_a_sedere = 9;
else
if _format200="8" then IMP_Posti_a_sedere = 8;
else
if _format200="7" then IMP_Posti_a_sedere = 7;
else
if _format200="6" then IMP_Posti_a_sedere = 6;
else
if _format200="5" then IMP_Posti_a_sedere = 5;
else
if _format200="4" then IMP_Posti_a_sedere = 4;
else
if _format200="3" then IMP_Posti_a_sedere = 3;
else
if _format200="2" then IMP_Posti_a_sedere = 2;
END;
