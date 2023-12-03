{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/HISTORICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ORIGIN;

INTERFACE

Type
 OriginType=(
  Chinois,
  Ecossais,
  Francais,
  Irlandais,
  Italien,
  Japonais,
  Quebecois,
  Roumain,
  Russe,
  Vietnamien,
  Inconnu
 );

Function GetLastNameOrigin(LastName:String):OriginType;
Function LanguageToCountryOrigin(Language:String):String;

IMPLEMENTATION

Type
 OriginLanguageRec=Record
  Language:String[15];
  Country:String[15];
 End;

Const
 OriginLanguage:Array[0..20]of OriginLanguageRec=(
  (Language:'Albanais';Country:'Albanie'),
  (Language:'Allemand';Country:'Allemagne'),
  (Language:'Anglais';Country:'Royaume-Uni'),
  (Language:'Breton';Country:'France'),
  (Language:'Castillan';Country:'Espagne'),
  (Language:'Espagnol';Country:'Espagne'),
  (Language:'Franáais';Country:'France'),
  (Language:'Gaulois';Country:'France'),
  (Language:'Grec';Country:'Gräce'),
  (Language:'Japonais';Country:'Japon'),
  (Language:'Latin';Country:'Italie'),
  (Language:'Mandarin';Country:'Chine'),
  (Language:'Mannois';Country:'Ile de Man'),
  (Language:'Mongol';Country:'Mongolie'),
  (Language:'NÇerlandais';Country:'Pays-Bas'),
  (Language:'Picard';Country:'France'),
  (Language:'Polonais';Country:'Pologne'),
  (Language:'Portugais';Country:'Portugal'),
  (Language:'Roumain';Country:'Roumanie'),
  (Language:'Russe';Country:'Russie'),
  (Language:'Turc';Country:'Turquie')
 );

Function Right(S:String;L:Integer):String;
Begin
 If(L>=Length(S))Then Right:=S
                 Else Right:=Copy(S,Length(S)-L,L);
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

Function GetLastNameOrigin(LastName:String):OriginType;
Const
 LastNameChine:Array[0..99]of String[10]=(
  'LI','WANG','ZHANG','LIU','CHEN','YANG','ZHAO','HUANG','ZHOU',
  'WU','XU','SUN','HU','ZHU','GAO','LIN','HE','GUO','MA','LUO',
  'LIANG','SONG','ZHENG','XIE','HAN','TANG','FENG','YU','DONG',
  'XIAO','CHENG','CAO','YUAN','DENG','XU','FU','SHEN','ZENG',
  'PENG','LU','SU','LU','JIANG','CAI','JIA','DING','WEI','XUE',
  'YE','YAN','YU','PAN','DU','DAI','XIA','ZHONG','WANG','TIAN',
  'REN','JIANG','FAN','FANG','SHI','YAO','TAN','SHENG','ZOU',
  'XIONG','JIN','LU','HAO','KONG','BAI','CUI','KANG','MAO',
  'QIU','QIN','JIANG','SHI','GU','HOU','SHAO','MENG','LONG',
  'WAN','DUAN','ZHANG','QIAN','TANG','YIN','LI','YI','CHANG',
  'WU','QIAO','HE','LAI','GONG','WEN'
 );
 LastNameFrance:Array[0..199]of String[15]=(
  'MARTIN','BERNARD','THOMAS','PETIT','ROBERT','RICHARD',
  'DURAND','DUBOIS','MOREAU','LAURENT','SIMON','MICHEL',
  'LEFEBVRE','LEROY','ROUX','DAVID','BERTRAND','MOREL',
  'FOURNIER','GIRARD','BONNET','DUPONT','LAMBERT','FONTAINE',
  'ROUSSEAU','VINCENT','MULLER','LEFEVRE','FAURE','ANDRE',
  'MERCIER','BLANC','GUERIN','BOYER','GARNIER','CHEVALIER',
  'FRANCOIS','LEGRAND','GAUTHIER','GARCIA','PERRIN',
  'ROBIN','CLEMENT','MORIN','NICOLAS','HENRY','ROUSSEL',
  'MATHIEU','GAUTIER','MASSON','MARCHAND','DUVAL','DENIS',
  'DUMONT','MARIE','LEMAIRE','NOEL','MEYER','DUFOUR',
  'MEUNIER','BRUN','BLANCHARD','GIRAUD','JOLY','RIVIERE',
  'LUCAS','BRUNET','GAILLARD','BARBIER','ARNAUD','MARTINEZ',
  'GERARD','ROCHE','RENARD','SCHMITT','ROY','LEROUX','COLIN',
  'VIDAL','CARON','PICARD','ROGER','FABRE','AUBERT','LEMOINE',
  'RENAUD','DUMAS','LACROIX','OLIVIER','PHILIPPE','BOURGEOIS',
  'PIERRE','BENOIT','REY','LECLERC','PAYET','ROLLAND',
  'LECLERCQ','GUILLAUME','LECOMTE','LOPEZ','JEAN','DUPUY',
  'GUILLOT','HUBERT','BERGER','CARPENTIER','SANCHEZ','DUPUIS',
  'MOULIN','LOUIS','DESCHAMPS','HUET','VASSEUR','PEREZ',
  'BOUCHER','FLEURY','ROYER','KLEIN','JACQUET','ADAM',
  'PARIS','POIRIER','MARTY','AUBRY','GUYOT','CARRE','CHARLES',
  'RENAULT','CHARPENTIER','MENARD','MAILLARD','BARON',
  'BERTIN','BAILLY','HERVE','SCHNEIDER','FERNANDEZ','LE GALL',
  'COLLET','LEGER','BOUVIER','JULIEN','PREVOST','MILLET',
  'PERROT','DANIEL','LE ROUX','COUSIN','GERMAIN','BRETON',
  'BESSON','LANGLOIS','REMY','LE GOFF','PELLETIER','LEVEQUE',
  'PERRIER','LEBLANC','BARRE','LEBRUN','MARCHAL','WEBER',
  'MALLET','HAMON','BOULANGER','JACOB','MONNIER','MICHAUD',
  'RODRIGUEZ','GUICHARD','GILLET','ETIENNE','GRONDIN',
  'POULAIN','TESSIER','CHEVALLIER','COLLIN','CHAUVIN',
  'DA SILVA','BOUCHET','GAY','LEMAITRE','BENARD',
  'MARECHAL','HUMBERT','REYNAUD','ANTOINE','HOARAU',
  'PERRET','BARTHELEMY','CORDIER','PICHON','LEJEUNE',
  'GILBERT','LAMY','DELAUNAY','PASQUIER','CARLIER',
  'LAPORTE'
 );
 LastNameItalie:Array[0..19]of String[15]=(
  'ROSSI','RUSSO','FERRARI','ESPOSITO','BIANCHI','ROMANO',
  'COLOMBO','RICCI','MARINO','GRECO','BRUNO','GALLO',
  'CONTI','DE LUCA','COSTA','GIORDANO','MANCINI','RIZZO',
  'LOMBARDI','MORETTI'
 );
 LastNameJapon:Array[0..9]of String[15]=(
  'SATO','SUZUKI','TAKAHASHI','TANAKA','WATANABE',
  'ITO','YAMAMOTO','NAKAMURA','KOBAYASHI','SAITO'
 );
 LastNameQuebec:Array[0..306]of String[15]=(
  'TREMBLAY','GAGNON','ROY','COTE','BOUCHARD','GAUTHIER',
  'MORIN','LAVOIE','FORTIN','GAGNE','OUELLET','PELLETIER',
  'BELANGER','LEVESQUE','BERGERON','LEBLANC','PAQUETTE',
  'GIRARD','SIMARD','BOUCHER','CARON','BEAULIEU','CLOUTIER',
  'DUBE','POIRIER','FOURNIER','LAPOINTE','LECLERC','LEFEBVRE',
  'POULIN','THIBAULT','ST-PIERRE','NADEAU','MARTIN','LANDRY',
  'MARTEL','BEDARD','GRENIER','LESSARD','BERNIER','RICHARD',
  'MICHAUD','HEBERT','DESJARDINS','COUTURE','TURCOTTE',
  'LACHANCE','PARENT','BLAIS','GOSSELIN','SAVARD','PROULX',
  'BEAUDOIN','DEMERS','PERREAULT','BOUDREAU','LEMIEUX',
  'CYR','PERRON','DUFOUR','DION','MERCIER','BOLDUC',
  'BERUBE','BOISVERT','LANGLOIS','MENARD','THERRIEN',
  'BILODEAU','PLANTE','BLANCHETTE','DUBOIS','CHAMPAGNE',
  'PARADIS','FORTIER','ARSENAULT','DUPUIS','GAUDREAULT',
  'HAMEL','HOULE','VILLENEUVE','ROUSSEAU','GRAVEL','THERIAULT',
  'LEMAY','ROBERT','ALLARD','DESCHENES','GIROUX','GUAY',
  'LEDUC','BOIVIN','CHARBONNEAU','LAMBERT','RAYMOND',
  'VACHON','GILBERT','AUDET','JEAN','LAROUCHE','LEGAULT',
  'TRUDEL','FONTAINE','PICARD','LABELLE','LACROIX',
  'JACQUES','MOREAU','CARRIER','BERNARD','DESROSIERS',
  'GOULET','RENAUD','DIONNE','LAPIERRE','VAILLANCOURT',
  'FILLION','LALONDE','TESSIER','BERTRAND','TARDIF',
  'LEPAGE','GINGRAS','BENOIT','RIOUX','GIGUERE','DROUIN',
  'HARVEY','LAUZON','GENDRON','BOUTIN','LAFLAMME','VALLEE',
  'DUMONT','BRETON','PARE','PAQUIN','ROBITAILLE','GELINAS',
  'DUCHESNE','LUSSIER','SEGUIN','VEILLEUX','POTVIN',
  'GERVAIS','PEPIN','LAROCHE','MORISSETTE','CHARRON',
  'LAVALLEE','LAPLANTE','CHABOT','BRUNET','VEZINA',
  'DESROCHERS','LABRECQUE','COULOMBE','TANGUAY','CHOUINARD',
  'NOEL','POULIOT','LACASSE','DAIGLE','MARCOUX','LAMONTAGNE',
  'TURGEON','LAROCQUE','ROBERGE','AUGER','MASSE','PILON',
  'RACINE','DALLAIRE','EMOND','GREGOIRE','BEAUREGARD',
  'SMITH','DENIS','LEBEL','BLOUIN','MARTINEAU','LABBE',
  'BEAUCHAMP','ST-ONGE','CHARETTE','DUPONT','LETOURNEAU',
  'RODRIGUE','CORMIER','RIVARD','MATHIEU','ASSELIN',
  'ST-JEAN','PLOURDE','THIBODEAU','BELISLE','ST-LAURENT',
  'GODIN','DESBIENS','LAVIGNE','DOUCET','LABONTE','MARCHAND',
  'BRASSARD','FORGET','PATEL','MARCOTTE','BELAND','LAROSE',
  'DUVAL','ARCHAMBAULT','MALTAIS','TREPANIER','LALIBERTE',
  'BISSON','BRISSON','DUFRESNE','BEAUDRY','CHARTRAND',
  'HOUDE','FRECHETTE','LAFONTAINE','GUILLEMETTE','DROLET',
  'VINCENT','RICHER','GERMAIN','LARIVIERE','FERLAND',
  'TROTTIER','PICHE','BOULANGER','SIROIS','CHAREST',
  'PROVOST','DURAND','DUMAS','SOUCY','LAMOUREUX',
  'LACHAPELLE','BEGIN','BOILY','CROTEAU','SAVOIE','PROVENCHER',
  'PREVOST','DUGUAY','LEMIRE','DELISLE','DESMARAIS','LABERGE',
  'NAULT','BOURGEOIS','LAFRANCE','LAGACE','DAOUST',
  'BRAULT','CASTONGUAY','VALLIERES','PELLERIN','RIVEST',
  'BROCHU','SAMSON','LEPINE','LEROUX','LAROCHELLE',
  'BROUSSEAU','SAUVE','LAURIN','CLEMENT','BISSONNETTE',
  'LAJOIE','AUBIN','DOYON','LABRIE','GRONDIN','FAUCHER',
  'CORRIVEAU','TETREAULT','BOURQUE','DAGENAIS','DUCHARME',
  'CARRIERE','DUQUETTE','LAFLEUR','LANGEVIN','CORBEIL',
  'BOURASSA','PAGE','TRUDEAU','GAUDET','CANTIN','GOYETTE',
  'BOYER','FRANCOEUR','ST-LOUIS','BARRETTE','VIGNEAULT',
  'OUIMET','BARIL','LAFRENIERE','MEUNIER','LAPORTE',
  'JOSEPH','BRODEUR','LEGARê','LAFOND'
 );
 LastNameRoumanie:Array[0..55]of String[15]=(
  'ALEXANDRESCO','ALIMANESCO','ANTONESCU','BALANESCO',
  'BALASKO','BERBEC','BLAS','BOBESCO','BOTEZARIU',
  'BRUTAR','BUCATAR','CARNATAR','CIOBAN','CONSTANTINESCU',
  'DANIELESCO','DRAGOMAN','DUCA','FORASCO','GAVRIL',
  'GEORGIU','GHEORGHE','GHEORGHIU','GHERMAN','GREGORIU',
  'IOANS','LAPTAR','LUCA','LUPESCO','MACELAR','MAIORESCO',
  'MARTINESCU','MATESCO','MELITARU','MOLDAVAN','MORARIU',
  'MUNTEANO','NEGRESCO','NEGUS','NEGUSTOR','PALARIAR',
  'PIETRU','POPESCO','PRETORIAN','ROMAN','ROTAR','RUSSESCO',
  'SARBESCO','SPANIOL','TAMPIAR','TESADOR','TESATOR','TURCUS',
  'VACARESCO','VULPESCO','WALKIL','ZIDAR'
 );
 LastNameRusse:Array[0..87]of String[15]=(
  'ANDREEV','BOGATYRYOV','BELINSKI','BOLKONSKI','VARSHAVSKY',
  'VASSILIEVSKI','VELICHANSKI','VETROGRAD','VORONTSOV',
  'GLINSKY','GRADOV','DMITRIEV','DORONINE','DUBROVSKI',
  'DOROFEEV','EJEVSKY','YELSKY','ZADONSKI','ZARNITSKI',
  'ZVEZDINSKY','ZLATOUM','IGNATOV','IGNATIEV','KAKHOVSKI',
  'KIRSANOV','KNYAZEV','KNIAJINE','KOVALEVSKI','KONDRATIEV',
  'LAVROV','LAVROVSKI','LARIN','LARSKY','LAZAREV','LEBEDINSKY',
  'LEVITANOV','LOGINOV','MAIOROV','MAKAROV','MAXIMOV',
  'MEDVEDEV','MIKHAILOV','MELNIKOV','MOZHAISKY','MOUROMOV',
  'MOUROMTSEV','NIKOLSKI','NEMIROFF','NOVGOROD','NEJINSKI',
  'ORLOV','ORLOVSKI','OSTROUMOV','OBOLENSKI','BRULURES',
  'PAUSTOVSKI','PETROVSKY','POGODINE','POLYANSKY',
  'RJEVSKY','ROMANOV','ROMANOVSKI','SADOVSKI','SAKHAROV',
  'SAMOILOV','SAFRONOV','SALTEVSKI','STRELTSOV','STRELETSKY',
  'TROITSKI','TARASSOV','TITOV','FILATOV','FEDOROV',
  'FONVIZINE','KHMELNYTSKY','KHARITONOV','TCHERNYCHEVSKI',
  'TCHERKASOV','CHERYOMUSHKIN','SHESTAKOV','CHEREMETIEV',
  'CHOUSTROV','ELINSKY','ELBROUZ','YURIEV','YAKHONTOV',
  'YASSENSKI'
 );
 LastNameVietnam:Array[0..13]of String[15]=(
  'NGUYEN','TRAN','LE','PHAM','HUYNH-HOANG','PHAN','VU-VO',
  'DANG','BUI','DO','HO','NGO','DUONG','LY'
 );
Var
 I:Integer;
Begin
 GetLastNameOrigin:=Inconnu;
 For I:=Low(LastNameChine)to High(LastNameChine)do Begin
 If StrToUpper(LastName)=LastNameFrance[I]Then Begin
   GetLastNameOrigin:=Francais;
   Exit;
  End;
 End;
 For I:=Low(LastNameFrance)to High(LastNameFrance)do Begin
  If StrToUpper(LastName)=LastNameFrance[I]Then Begin
   GetLastNameOrigin:=Francais;
   Exit;
  End;
 End;
 For I:=Low(LastNameItalie)to High(LastNameItalie)do Begin
  If StrToUpper(LastName)=LastNameItalie[I]Then Begin
   GetLastNameOrigin:=Italien;
   Exit;
  End;
 End;
 For I:=Low(LastNameJapon)to High(LastNameJapon)do Begin
  If StrToUpper(LastName)=LastNameJapon[I]Then Begin
   GetLastNameOrigin:=Japonais;
   Exit;
  End;
 End;
 For I:=Low(LastNameQuebec)to High(LastNameQuebec)do Begin
  If StrToUpper(LastName)=LastNameQuebec[I]Then Begin
   GetLastNameOrigin:=Quebecois;
   Exit;
  End;
 End;
 For I:=Low(LastNameRoumanie)to High(LastNameRoumanie)do Begin
  If StrToUpper(LastName)=LastNameQuebec[I]Then Begin
   GetLastNameOrigin:=Roumain;
   Exit;
  End;
 End;
 For I:=Low(LastNameRusse)to High(LastNameRusse)do Begin
  If StrToUpper(LastName)=LastNameRusse[I]Then Begin
   GetLastNameOrigin:=Russe;
   Exit;
  End;
 End;
 For I:=Low(LastNameVietnam)to High(LastNameVietnam)do Begin
  If StrToUpper(LastName)=LastNameVietnam[I]Then Begin
   GetLastNameOrigin:=Vietnamien;
   Exit;
  End;
 End;
 If StrToUpper(Copy(LastName,1,2))='MC'Then GetLastNameOrigin:=Ecossais Else
 If StrToUpper(Copy(LastName,1,2))='O'''Then GetLastNameOrigin:=Irlandais Else
 If StrToUpper(Right(LastName,3))='ING'Then GetLastNameOrigin:=Chinois;
End;

Function LanguageToCountryOrigin(Language:String):String;
Var
 I:Integer;
Begin
 LanguageToCountryOrigin:='';
 For I:=Low(OriginLanguage)to High(OriginLanguage)do Begin
  If StrToUpper(Language)=StrToUpper(OriginLanguage[I].Language)Then Begin
   LanguageToCountryOrigin:=OriginLanguage[I].Country;
   Exit;
  End;
 End;
End;

END.
