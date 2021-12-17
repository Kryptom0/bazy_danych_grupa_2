lab02 zti_bazy
Zadania Czesc 2
1). 
SELECT p.imie, p.nazwisko, d.nazwa FROM pracownik p 
INNER JOIN dzial d ON p.dzial=d.id_dzialu;
2).
SELECT t.nazwa_towaru, k.nazwa_kategori, sm.ilosc FROM towar t
INNER JOIN kategoria k ON t.kategoria=k.id_kategori
INNER JOIN stan_magazynowy sm ON t.id_towaru=sm.towar 
ORDER BY sm.ilosc DESC;
3).
SELECT * FROM zamowienie z 
INNER JOIN status_zamowienia sz ON z.status_zamowienia=sz.id_statusu_zamowienia
WHERE sz.nazwa_statusu_zamowienia='anulowane';
4).
SELECT * FROM klient k 
INNER JOIN adres_klienta ak ON k.id_klienta=ak.klient 
WHERE ak.miejscowosc='Olsztyn';
5).
SELECT * FROM stan_magazynowy sm 
INNER JOIN jednostka_miary j_m ON sm.jm=j_m.id_jednostki;
6).
SELECT z.numer_zamowienia, t.nazwa_towaru, pz.ilosc, pz.cena FROM zamowienie z 
INNER JOIN pozycja_zamowienia pz ON z.id_zamowienia=pz.zamowienie
INNER JOIN towar t ON pz.towar=t.id_towaru 
WHERE YEAR(z.data_zamowienia)=2018
ORDER BY z.numer_zamowienia;
7).
CREATE TABLE drzaszczk.towary_full_info SELECT t.nazwa_towaru, t.cena_zakupu, k.nazwa_kategori, sm.ilosc, jm.jednostka_miary
INNER JOIN kategoria k ON t.kategoria=k.id_kategori 
INNER JOIN stan_magazynowy sm ON t.id_towaru=sm.towar 
INNER JOIN jednostka_miary jm ON sm.jm=jm.id_jednostki;
8).
SELECT * FROM zamowienie ORDER BY data_zamowienia LIMIT 5;
9).
SELECT * FROM zamowienie z 
INNER JOIN status_zamowienia sz ON z.status_zamowienia=sz.id_statusu_zamowienia
WHERE sz.nazwa_statusu_zamowienia != 'zrealizowane';
10).
SELECT * FROM adres_klienta 
WHERE kod NOT LIKE '__-__';

SELECT * FROM adres_klinta

