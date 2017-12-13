% 1. Aufgabe
unartig(susi).
unartig(fridolin).
unartig(ralf).

artig(hanna).
artig(britta).

sehr_artig(klaus).
sehr_artig(sina).

% 2. Aufgabe
wert(schaukelpferd, 100).
wert(kreisel, 20).
wert(buntstifte, 40).
wert(teddybaer, 60).
wert(ritterburg, 110).
wert(bausteine, 90).
wert(buch, 40).
wert(fahrrad, 200).
wert(gameboy, 250).
wert(puppe, 140).
wert(murmeln, 30).

% 3. Aufgabe
wunschzettel(susi, [schaukelpferd, teddybaer, ritterburg, buch, puppe, teddybaer, schaukelpferd]).
wunschzettel(fridolin, [ritterburg, ritterburg, bausteine, buch, buch, murmeln, puppe]).
wunschzettel(ralf, [murmeln, buch, kreisel, fahrrad]).
wunschzettel(hannah, [schaukelpferd, bausteine, fahrrad, fahrrad, bausteine, schaukelpferd]).
wunschzettel(britta, [gameboy, ritterburg, buntstifte, buch, puppe, murmeln]).
wunschzettel(klaus, [teddybaer, ritterburg, fahrrad, puppe, murmeln, bausteine, murmeln]).
wunschzettel(sina, [gameboy, ritterburg, buntstifte, buch, puppe, murmeln]).

% 4. Aufgabe
wunschwert([], 0).
wunschwert([Head|Tail], Wert):-wunschwert(Tail, Res), wert(Head, Preis), Wert is Res + Preis.

% 5. Aufgabe
wunschliste_bereinigen([], []).
wunschliste_bereinigen([Head|Tail], BereinigteListe):-wunschliste_bereinigen(Tail, Res), \+contains(Head, Tail).

% 6. Aufgabe:
preisgrenze(susi, 100).
preisgrenze(fridolin, 100).
preisgrenze(ralf, 100).
preisgrenze(hannah, 200).
preisgrenze(britta, 200).
preisgrenze(klaus, 300).
preisgrenze(sina, 300).

moegliche_geschenke(Kind, Geschenkliste):-wunschwert(Geschenkliste, Wert), preisgrenze(Kind, Grenze), Wert =< Grenze.

% 7. Aufgabe + Zeichnung:
einzigartige_geschenke(Kind1, Geschenkliste1, Kind2, Geschenkliste2):-wunschzettel(Kind1, Wunschzettel1), wunschzettel(Kind2, Wunschzettel2).
einzigartige_geschenke(Kind1, [Head|Tail], Kind2, Geschenkliste2):-einzigartige_geschenke(Kind1, Tail, Kind2, Geschenkliste2), \+contains(Head, Geschenkliste).
einzigartige_geschenke(Kind1, [], Kind2, Geschenkliste2).

% Listenoperationen:
contains(X, [X|_]).
contains(X, [_|Tail]):-contains(X, Tail).
