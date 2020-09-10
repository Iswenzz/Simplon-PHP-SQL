-- no.1
SELECT * FROM Artiste;

-- no.2
SELECT Art_nom, Art_prenom 
FROM Artiste
WHERE Art_code = "C01";

-- no.3
SELECT Art_nom, Art_prenom
FROM Artiste
WHERE Art_nom LIKE "Ch%";

-- no.4
SELECT Art_code, Art_nom, Art_prenom
FROM Artiste
WHERE Art_prenom IN ("Jean-Jacques", "Jean-Louis");

-- no.5
SELECT Dis_code, Dis_titre, Artiste.Art_code, Artiste.Art_nom, Artiste.Art_prenom
FROM Disque
JOIN Artiste ON Artiste.Art_code = Disque.Art_code
WHERE Artiste.Art_nom = "Aubert"
AND Artiste.Art_prenom = "Jean-Louis";

-- no.6
SELECT Salle.Sal_nom, Salle.Sal_num, Concert.Con_jour, Concert.Sal_num 
FROM Concert
JOIN Salle ON Concert.Sal_num = Salle.Sal_num
WHERE Salle.Sal_nom = "Zenith de Lille"
ORDER BY Concert.Con_jour ASC;

-- no.7
SELECT Salle.Sal_nom, Salle.Sal_num, Concert.Con_jour, Concert.Sal_num, Artiste.Art_nom, Artiste.Art_prenom 
FROM Concert
JOIN Salle ON Concert.Sal_num = Salle.Sal_num
JOIN Artiste ON Concert.Art_code = Artiste.Art_code 
WHERE Artiste.Art_nom = "Goldman"
AND YEAR(Concert.Con_jour) = 2002;

-- no.8
SELECT Salle.Sal_nom, Salle.Sal_num, Concert.Con_jour, Concert.Sal_num, Artiste.Art_nom, Artiste.Art_prenom, Disque.Dis_code 
FROM Concert
JOIN Salle ON Concert.Sal_num = Salle.Sal_num
JOIN Artiste ON Concert.Art_code = Artiste.Art_code
JOIN Disque ON Disque.Art_code = Artiste.Art_code 
WHERE Disque.Dis_code = "T5602";

-- no.9
SELECT Disque.Dis_titre, Disque.Art_code, Artiste.Art_code, Artiste.Art_nom, Artiste.Art_prenom
FROM Artiste
JOIN Disque ON Disque.Art_code = Artiste.Art_code 
WHERE LENGTH(Disque.Dis_titre) = 3;

-- no.10
SELECT Art_nom, Art_prenom
FROM Artiste
ORDER BY Art_nom ASC, Art_prenom DESC;