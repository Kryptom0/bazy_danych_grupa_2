Lab07
Zad4
Pkt2)
select u.id_wyprawy, round(sum(e.ilosc*i.waga)/cout(distinct u.id.uczestnika),2)
from uczestnicy u
left join ekwipunek e on u.id_uczestnika=e.idKreatury
left join zasob z on z.idZasobu=e.idZasobu 
group by u.id_wyprawy;

Zti_bazy
lab02
Czesc 1:
1) Select nazwisko from pracownik ORDER by nazwisko;
2) Select imie, nazwisko, pensja, data_urodzenia from pracownik WHERE YEAR(data_urodzenia)>1979;
3) Select * from pracownik WHERE pensja BETWEEN 3500 and 5000;
4) Select towar, ilosc from stan_magazynowy WHERE ilosc>10;
5) Select * from towar Where nazwa_towaru LIKE 'A%' OR nazwa_towaru LIKE 'B%' OR nazwa_towaru LIKE 'C%';
6) Select * from klient WHERE czy_firma=0;
7) Select * from zamowienie Order by data_zamowienia DESC LIMIT 10;
8) Select * from pracownik Order by pensja LIMIT 5;
9) Select * from towar WHERE nazwa_towaru NOT LIKE '%a%' Order by cena_zakupu Desc LIMIT 10;
10) Select t.nazwa_towaru, jem.nazwa, t.cena_zakupu FROM towar t
LEFT JOIN stan_magazynowy sm ON t.id_towaru=sm.towar
LEFT JOIN jednostka_miary jem ON sm.jm=jem.id_jednostki
Where jem.nazwa='szt'
ORDER by t.nazwa_towaru ASC, t.cena_zakupu ASC;
11) Create table drzaszczk.towary_powyzej_100 SELECT * FROM towar WHERE cena_zakupu>=100;
12) Create table drzaszczk.pracownik_50_plus SELECT imie, (YEAR(NOW()))-YEAR(data_urodzenia) AS wiek FROM pracownik HAVING wiek>=50;
Koniec---