*$Rev: 121017 $ all 2.
SET UNICODE=ON.
SHOW LOCALE.
PRESERVE LOCALE.
SET LOCALE='en_UK'.
SET DECIMAL=DOT.
GET DATA
 /TYPE=TXT
 /FILE='survey_199433_SPSS_data_file.dat'
 /DELCASE=LINE
 /DELIMITERS=","
 /QUALIFIER="'"
 /ARRANGEMENT=DELIMITED
 /FIRSTCASE=1
 /IMPORTCASE=ALL
 /VARIABLES=
 V1 F7
 V2 DATETIME23.2
 V3 F7
 V4 A20
 V5 A31
 V6 DATETIME23.2
 V7 DATETIME23.2
 V8 A7
 V9 A2
 V10 A2
 V11 A2
 V12 A6
 V13 A2
 V14 A2
 V15 A2
 V16 A2
 V17 A2
 V18 A2
 V19 A2
 V20 A2
 V21 A2
 V22 A2
 V23 A2
 V24 A2
 V25 A2
 V26 A2
 V27 A2
 V28 A2
 V29 A2
 V30 A2
 V31 A2
 V32 A2
 V33 A2
 V34 A2
 V35 A2
 V36 A2
 V37 A2
 V38 A2
 V39 A2
 V40 A2
 V41 A2
 V42 A2
 V43 A2
 V44 A2
 V45 A2
 V46 A2
 V47 A2
 V48 A2
 V49 A2
 V50 A2
 V51 A2
 V52 A2
 V53 A2
 V54 A2
 V55 A2
 V56 A2
 V57 A2
 V58 A2
 V59 A2
 V60 A2
 V61 A2
 V62 A2
 V63 A2
 V64 A2
 V65 A2
 V66 A2
 V67 A2
 V68 A2
 V69 A2
 V70 A2
 V71 A2
 V72 F3.0
 V73 A2
 V74 A2
 V75 A2
 V76 A2
 V77 A2
 V78 A2
 V79 A2
 V80 A2
 V81 A2
 V82 A2
 V83 A2
 V84 A2
 V85 A2
 V86 A2
 V87 F3.0
 V88 A2
 V89 A2
 V90 A2
 V91 A2
 V92 A313.
CACHE.
EXECUTE.
*Define Variable Properties.
VARIABLE LABELS V1 "id".
VARIABLE LABELS V2 "submitdate".
VARIABLE LABELS V3 "lastpage".
VARIABLE LABELS V4 "startlanguage".
VARIABLE LABELS V5 "seed".
VARIABLE LABELS V6 "startdate".
VARIABLE LABELS V7 "datestamp".
VARIABLE LABELS V8 "Um Ihre Daten anonymisieren zu können und gleichzeitig die EEG Daten zuordnen zu können, möchten wir Sie bitten, einen Versuchspersonen-Code nach den folgenden Vorgaben zu erstellen:    	 	1. Zweiter Buchstabe des Vornamens der M"+
"utter (z.B.: Birgit = I)  	 	 	2. Die ersten beiden Buchstaben des Geburtsorts (z.B.: Bern = BE) (sollten diese Buchstaben einen Umlaut haben, verwenden Sie bitte die Schreibweise ohne Umlaut z.B. Zürich =Zu) 	 	 	3. Geburtstag d"+
"es Vaters (z.B.: 14.02. = 14)  	 	 	4. Monat des eigenen Geburtstags (z.B.: Juni = 06) 	   In diesem Beispiel würde der Code folgendermaßen aussehen = IBE1406). Bitte nehmen sie den gleichen Code wie den bereits erstellten Code a"+
"uf dem bereitliegenden Papier!".
VARIABLE LABELS V9 "Welchem Geschlecht fühlen Sie sich zugehörig? ".
VARIABLE LABELS V10 "Wie alt sind Sie?".
VARIABLE LABELS V11 "Welcher ist Ihr höchster Bildungsabschluss? ".
VARIABLE LABELS V12 "Zu welchem Prozentsatz sind Sie in Ihrem aktuellen Beschäftigungsverhältnis angestellt?".
VARIABLE LABELS V13 "[Ich kann KI-Anwendungen im täglichen Leben einsetzen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V14 "[Ich kann KI-Anwendungen nutzen, um meinen Alltag zu erleichtern.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V15 "[Ich kann KI sinnvoll einsetzen, um meine Alltagsziele zu erreichen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V16 "[Ich kann im Alltag mit KI so interagieren, dass meine Aufgaben erleichtert werden.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen."+
" ".
VARIABLE LABELS V17 "[Ich kann im Alltag gewinnbringend mit KI zusammenarbeiten.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V18 "[Ich kann im Alltag gewinnbringend mit KI kommunizieren.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V19 "[Ich kenne die wichtigsten Begriffe zum Thema ""KI"".] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V20 "[Ich kenne Definitionen von KI.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V21 "[Ich kann die Grenzen und Möglichkeiten des Einsatzes von KI einschätzen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V22 "[Ich kann die Vor- und Nachteile des Einsatzes von KI einschätzen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V23 "[Ich kann mir neue Einsatzmöglichkeiten für KI vorstellen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V24 "[Ich kann mir mögliche zukünftige Anwendungen von KI vorstellen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V25 "[Ich kann erkennen, ob ich es mit einer Anwendung zu tun habe, die auf KI basiert.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V26 "[Ich kann Geräte, die KI verwenden, von solchen unterscheiden, die dies nicht tun.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V27 "[Ich kann unterscheiden, ob ich mit einer KI oder einem ""echten Menschen"" interagiere.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutre"+
"ffen. ".
VARIABLE LABELS V28 "[Ich kann die Folgen des Einsatzes von KI für die Gesellschaft abwägen.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen. ".
VARIABLE LABELS V29 "[Ich kann KI-basierte Anwendungen auf ihre ethischen Implikationen hin analysieren.] Bitte geben Sie an, inwiefern die folgenden Aussagen zur Nutzung von künstlicher Intelligenz (KI), wie zum Beispiel ChatGPT, auf Sie zutreffen."+
" ".
VARIABLE LABELS V30 "[Bei Routinetransaktionen würde ich lieber mit einem KI System interagieren als mit einem Menschen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V31 "[Ein KI Agent wäre bei vielen Routineaufgaben besser als ein/e Angestellte/r.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V32 "[Ich bin daran interessiert, KI Systeme in meinem täglichen Leben einzusetzen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V33 "[Ich denke, dass künstlich intelligente Systeme viele Fehler machen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V34 "[Ich schaudere vor Unbehagen, wenn ich an künftige Anwendungen von künstlicher Intelligenz denke.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V35 "[Organisationen nutzen künstliche Intelligenz auf unethische Weise.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen. ".
VARIABLE LABELS V36 "[Ich mag blaue Kleidung] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V37 "[Ich mag die Farbe Blau] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V38 "[Im Vergleich zu anderen Farben bevorzuge ich die Farbe Blau] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V39 "[Ich bin eher zurückhaltend, reserviert.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V40 "[Ich bin begeisterungsfähig und kann andere leicht mitreißen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V41 "[Ich bin eher der „stille Typ“, wortkarg.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V42 "[Ich gehe aus mir heraus, bin gesellig.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V43 "[Ich neige dazu, andere zu kritisieren.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V44 "[Ich schenke anderen leicht Vertrauen, glaube an das Gute im Menschen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V45 "[Ich kann mich kalt und distanziert verhalten.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V46 "[Ich kann mich schroff und abweisend anderen gegenüber verhalten.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V47 "[Ich erledige Aufgaben gründlich.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V48 "[Ich bin bequem, neige zur Faulheit.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V49 "[Ich bin tüchtig und arbeite schnell.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V50 "[Ich mache Pläne und führe sie auch durch.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V51 "[Ich werde leicht deprimiert, niedergeschlagen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V52 "[Ich bin entspannt, lasse mich durch Stress nicht aus der Ruhe bringen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V53 "[Ich mache mir viele Sorgen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V54 "[Ich werde leicht nervös und unsicher.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V55 "[Ich bin vielseitig interessiert.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V56 "[Ich bin tiefsinnig, denke gerne über Sachen nach.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V57 "[Ich habe eine aktive Vorstellungskraft, bin phantasievoll.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V58 "[Ich schätze künstlerische und ästhetische Eindrücke.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V59 "[Ich habe nur wenig künstlerisches Interesse.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Sie persönlich zutreffen.".
VARIABLE LABELS V60 "Als nächstes werden Sie zu unserer Plattform weitergeleitet. Sie werden insgesamt zwei Aufgaben dort lösen.  Über den Ablauf dieser Studie (bitte sorgfältig lesen):  Wenn Sie auf ""Weiter"" klicken, erhalten Sie den Link zur Pla"+
"ttform. Klicken Sie auf den Link und es wird sich nun ein Pop Up Fenster öffnen.  Das Browser-Fenster der Umfrage sollte die ganze Zeit geöffnet bleiben.   Sie können dann den Anweisungen auf der Plattform folgen. Nach der erste"+
"n Aufgabe werden Sie zurück zur Umfrage wechseln, um hier einige Fragen zu beantworten. Danach können Sie zurück zum Browserfenster mit der Plattform navigieren und bekommen dort eine zweite Aufgabe. Sobald diese fertig ist, nav"+
"igieren Sie zurück zur Umfrage und beantworten erneut einige Fragen.   Für das Experiment ist es sehr wichtig, dass Sie das Browserfenster mit der Umfrage und das Browser-Fenster mit der Plattform ständig geöffnet halten. Die Pl"+
"attform kann erkennen, wenn Sie in andere Tabs wechseln bzw. Tabs schliessen und wird Sie automatisch aus der Studie entfernen.  Haben Sie den weiteren Ablauf der Studie gelesen und verstanden?".
VARIABLE LABELS V61 "Ich habe Aufgabe 1 auf der Plattform gelöst".
VARIABLE LABELS V62 "[Die Aufgabe hat mich dabei unterstützt, meine Fähigkeiten zu entwickeln.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V63 "[Die Aufgabe hat mich dabei unterstützt, mich beruflich weiterzuentwickeln.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V64 "[Ich konnte neue Dinge lernen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V65 "[Ich konnte meine Fähigkeiten voll ausschöpfen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V66 "[Ich konnte selbst entscheiden, wie ich die Aufgabe erledige.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V67 "[Ich konnte dafür sorgen, dass die Aufgabe geistig weniger anstrengend ist.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V68 "[Ich konnte dafür sorgen, dass die Aufgabe emotional weniger intensiv ist.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V69 "[Ich konnte die Aufgabe so organisieren, dass ich mich nicht über einen zu langen Zeitraum am Stück konzentrieren muss.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V70 "[Ich würde zusätzliche Aufgaben übernehmen, auch wenn ich dafür kein zusätzliches Gehalt erhalte.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V71 "[Ich habe versucht, die Aufgabe anspruchsvoller zu gestalten, indem ich die zugrunde liegenden Beziehungen zwischen den einzelnen Aspekten einbezogen habe.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige "+
"Aufgabe zugetroffen haben.".
VARIABLE LABELS V72 "Bitte schätzen Sie Ihren wahrgenommenen Eigenanteil an dieser Aufgabe in einer Prozentzahl zwischen 1% und 100% ein.".
VARIABLE LABELS V73 "[Ich habe Dinge getan, die mich interessieren] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V74 "[Ich hatte das Gefühl, dass ich auch schwierige Aufgaben sehr gut bewältigen konnte] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V75 "[Wie würden Sie Ihre Gesamtproduktivität bei der vorherigen Aufgabe bewerten?] Bitte geben Sie an, inwiefern die folgenden Aussage auf die vorherige Aufgabe zutrifft".
VARIABLE LABELS V76 "[Wie würden sie die Schwierigkeit der Aufgabe bewerten?] Bitte geben Sie an, inwiefern die folgenden Aussage auf die vorherige Aufgabe zutrifft".
VARIABLE LABELS V77 "[Die Nutzung von ChatGPT hat mir dabei geholfen, meine Fähigkeiten zu entwickeln.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V78 "[Die Nutzung von ChatGPT hat mir dabei geholfen, mich beruflich weiterzuentwickeln.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V79 "[Die Nutzung von ChatGPT hat mir dabei geholfen, bei der Aufgabenlösung neue Dinge zu lernen.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V80 "[Die Nutzung von ChatGPT hat dafür gesorgt, dass ich meine Fähigkeiten voll ausschöpfen konnte.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V81 "[Ich konnte selbst entscheiden, wie ich Dinge tue.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V82 "[Die Nutzung von ChatGPT hat dafür gesorgt, dass die Aufgabe geistig weniger anstrengend ist.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V83 "[Die Nutzung von ChatGPT hat mir dabei geholfen, dass die Aufgabe emotional weniger intensiv ist.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V84 "[Die Nutzung von ChatGPT hat mir dabei geholfen, dass ich bei der Aufgabe nicht viele schwierige Entscheidungen treffen musste.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen "+
"Aufgabe zutreffen.".
VARIABLE LABELS V85 "[Die Nutzung von ChatGPT hat mir dabei geholfen die Aufgabe so zu organisieren, dass ich mich nicht über einen zu langen Zeitraum am Stück konzentrieren muss.] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit"+
" mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V86 "[Bitte wähle Option ""trifft teilweise zu"" aus ] Bitte geben Sie an, inwiefern die folgenden Aussagen auf Ihre Arbeit mit ChatGPT in der vorherigen Aufgabe zutreffen.".
VARIABLE LABELS V87 "Bitte schätzen Sie Ihren wahrgenommenen Eigenanteil an dieser Aufgabe in einer Prozentzahl zwischen 1% und 100% ein.".
VARIABLE LABELS V88 "[Ich habe Dinge getan, die mich interessieren] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V89 "[Ich hatte das Gefühl, dass ich auch schwierige Aufgaben sehr gut bewältigen  konnte] Bitte geben Sie an, inwiefern die folgenden Aussagen auf die vorherige Aufgabe zugetroffen haben.".
VARIABLE LABELS V90 "[Wie würden Sie Ihre Gesamtproduktivität bei der vorherigen Aufgabe bewerten?] Bitte geben Sie an, inwiefern die folgende Aussage auf die vorherige Aufgabe zutrifft. ".
VARIABLE LABELS V91 "[Wie würden Sie die Schwierigkeit der Aufgabe bewerten?] Bitte geben Sie an, inwiefern die folgende Aussage auf die vorherige Aufgabe zutrifft.".
VARIABLE LABELS V92 "Bitte beschreiben Sie 2 - 3 Sätzen, was Sie in der zweiten Aufgabe tun mussten und welche Hilfsmittel Ihnen zur Verfügung standen. ".
*Define Value labels.
VALUE LABELS  V9
 "A1" "Weiblich"
 "A2" "Männlich"
 "A3" "Nicht-binär"
 "A5" "Keine Angabe".
VALUE LABELS  V11
 "A1" "Mittlere Reife (Realschulabschluss)"
 "A5" "Abitur oder Fachabitur"
 "A4" "Abgeschlossene Berufsausbildung"
 "A3" "Bachelor"
 "A2" "Master"
 "A6" "Doktortitel".
VALUE LABELS  V13
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V14
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V15
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V16
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V17
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V18
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V19
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V20
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V21
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V22
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V23
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V24
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V25
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V26
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V27
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V28
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V29
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V30
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V31
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V32
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V33
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V34
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V35
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V36
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V37
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V38
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V39
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V40
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V41
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V42
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V43
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V44
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V45
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V46
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V47
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V48
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V49
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V50
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V51
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V52
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V53
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V54
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V55
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V56
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V57
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V58
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V59
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V60
 "A1" "Ja".
VALUE LABELS  V61
 "A1" "Ja".
VALUE LABELS  V62
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V63
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V64
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V65
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V66
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V67
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V68
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V69
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V70
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V71
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V73
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V74
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V75
 "A1" "Gar nicht zufriedenstellend"
 "A2" "Eher nicht zufriedenstellend"
 "A3" "Teils, teils"
 "A4" "Eher zufriedenstellend"
 "A5" "Voll zufriedenstellend".
VALUE LABELS  V76
 "A1" "Extrem schwierig"
 "A2" "Eher schwierig"
 "A3" "Teils, teils"
 "A4" "Eher leicht"
 "A5" "Extrem leicht".
VALUE LABELS  V77
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V78
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V79
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V80
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V81
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V82
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V83
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V84
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V85
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V86
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V88
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V89
 "A1" "Trifft gar nicht zu"
 "A5" "Trifft eher nicht zu"
 "A4" "Teils, teils"
 "A3" "Trifft teilweise zu"
 "A2" "Trifft voll zu".
VALUE LABELS  V90
 "A1" "Gar nicht zufriedenstellend"
 "A2" "Eher nicht zufriedenstellend"
 "A3" "Teils, teils"
 "A4" "Eher zufriedenstellend"
 "A5" "Voll zufriedenstellend".
VALUE LABELS  V91
 "A1" "Extrem schwierig"
 "A2" "Eher schwierig"
 "A3" "Teils, teils"
 "A4" "Eher leicht"
 "A5" "Extrem leicht".
VARIABLE LEVEL V72(SCALE).
VARIABLE LEVEL V87(SCALE).
RENAME VARIABLE ( V1 = id ).
RENAME VARIABLE ( V2 = submitdate ).
RENAME VARIABLE ( V3 = lastpage ).
RENAME VARIABLE ( V4 = startlanguage ).
RENAME VARIABLE ( V5 = seed ).
RENAME VARIABLE ( V6 = startdate ).
RENAME VARIABLE ( V7 = datestamp ).
RENAME VARIABLE ( V8 = VPNCode ).
RENAME VARIABLE ( V9 = Gender ).
RENAME VARIABLE ( V10 = AGE ).
RENAME VARIABLE ( V11 = Edu ).
RENAME VARIABLE ( V12 = WORK ).
RENAME VARIABLE ( V13 = AILiteracy_Use1 ).
RENAME VARIABLE ( V14 = AILiteracy_Use2 ).
RENAME VARIABLE ( V15 = AILiteracy_Use3 ).
RENAME VARIABLE ( V16 = AILiteracy_Use4 ).
RENAME VARIABLE ( V17 = AILiteracy_Use5 ).
RENAME VARIABLE ( V18 = AILiteracy_Use6 ).
RENAME VARIABLE ( V19 = AILiteracy_Kno1 ).
RENAME VARIABLE ( V20 = AILiteracy_Kno2 ).
RENAME VARIABLE ( V21 = AILiteracy_Kno3 ).
RENAME VARIABLE ( V22 = AILiteracy_Kno4 ).
RENAME VARIABLE ( V23 = AILiteracy_Kno5 ).
RENAME VARIABLE ( V24 = AILiteracy_Kno6 ).
RENAME VARIABLE ( V25 = AILiteracy_Det1 ).
RENAME VARIABLE ( V26 = AILiteracy_Det2 ).
RENAME VARIABLE ( V27 = AILiteracy_Det3 ).
RENAME VARIABLE ( V28 = AILiteracy_Eth1 ).
RENAME VARIABLE ( V29 = AILiteracy_Eth3 ).
RENAME VARIABLE ( V30 = PGAT_PGAT1 ).
RENAME VARIABLE ( V31 = PGAT_PGAT2 ).
RENAME VARIABLE ( V32 = PGAT_PGAT3 ).
RENAME VARIABLE ( V33 = NGAT_NGAT1 ).
RENAME VARIABLE ( V34 = NGAT_NGAT2 ).
RENAME VARIABLE ( V35 = NGAT_NGAT3 ).
RENAME VARIABLE ( V36 = CMV_SQ001 ).
RENAME VARIABLE ( V37 = CMV_SQ002 ).
RENAME VARIABLE ( V38 = CMV_SQ003 ).
RENAME VARIABLE ( V39 = NEO_E1R ).
RENAME VARIABLE ( V40 = NEO_E2 ).
RENAME VARIABLE ( V41 = NEO_E3R ).
RENAME VARIABLE ( V42 = NEO_E4 ).
RENAME VARIABLE ( V43 = NEO_V1R ).
RENAME VARIABLE ( V44 = NEO_V2 ).
RENAME VARIABLE ( V45 = NEO_V3R ).
RENAME VARIABLE ( V46 = NEO_V4R ).
RENAME VARIABLE ( V47 = NEO_G1 ).
RENAME VARIABLE ( V48 = NEO_G2R ).
RENAME VARIABLE ( V49 = NEO_G3 ).
RENAME VARIABLE ( V50 = NEO_G4 ).
RENAME VARIABLE ( V51 = NEO_N1 ).
RENAME VARIABLE ( V52 = NEO_N2R ).
RENAME VARIABLE ( V53 = NEO_N3 ).
RENAME VARIABLE ( V54 = NEO_N4 ).
RENAME VARIABLE ( V55 = NEO_O1 ).
RENAME VARIABLE ( V56 = NEO_O2 ).
RENAME VARIABLE ( V57 = NEO_O3 ).
RENAME VARIABLE ( V58 = NEO_O4 ).
RENAME VARIABLE ( V59 = NEO_O5R ).
RENAME VARIABLE ( V60 = ERK ).
RENAME VARIABLE ( V61 = TEST ).
RENAME VARIABLE ( V62 = JC_IStR1 ).
RENAME VARIABLE ( V63 = JC_IStR2 ).
RENAME VARIABLE ( V64 = JC_IStR3 ).
RENAME VARIABLE ( V65 = JC_IStR4 ).
RENAME VARIABLE ( V66 = JC_IStR5 ).
RENAME VARIABLE ( V67 = JC_HRJD1 ).
RENAME VARIABLE ( V68 = JC_HRJD2 ).
RENAME VARIABLE ( V69 = JC_HRJD3 ).
RENAME VARIABLE ( V70 = JC_ICJD1 ).
RENAME VARIABLE ( V71 = JC_ICJD2 ).
RENAME VARIABLE ( V72 = SE1 ).
RENAME VARIABLE ( V73 = SDT1_SDT1 ).
RENAME VARIABLE ( V74 = SDT1_SDT2 ).
RENAME VARIABLE ( V75 = PROD1_SQ001 ).
RENAME VARIABLE ( V76 = TASKDIF1_SQ001 ).
RENAME VARIABLE ( V77 = JC2_2IStR1 ).
RENAME VARIABLE ( V78 = JC2_2IStR2 ).
RENAME VARIABLE ( V79 = JC2_2IStR3 ).
RENAME VARIABLE ( V80 = JC2_2IStR4 ).
RENAME VARIABLE ( V81 = JC2_2IStR5 ).
RENAME VARIABLE ( V82 = JC2_2HRJD1 ).
RENAME VARIABLE ( V83 = JC2_2HRJD2 ).
RENAME VARIABLE ( V84 = JC2_2HRJD5 ).
RENAME VARIABLE ( V85 = JC2_2HRJD6 ).
RENAME VARIABLE ( V86 = JC2_AC ).
RENAME VARIABLE ( V87 = SE2 ).
RENAME VARIABLE ( V88 = SDT2_2SDT1 ).
RENAME VARIABLE ( V89 = SDT2_2SDT2 ).
RENAME VARIABLE ( V90 = PROD2_SQ001 ).
RENAME VARIABLE ( V91 = TASKDIF2_SQ001 ).
RENAME VARIABLE ( V92 = MANI ).
RESTORE LOCALE.
