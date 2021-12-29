-------------------------------------------
zti_bazy Lab3 Zadania1
-------------------------------------------
Zad 1
select imie, nazwisko, YEAR(data_urodzenia) AS 'rok urodzenia' from pracownik;
Zad 2
select imie, nazwisko, year(curdate()) - YEAR(data_urodzenia) AS 'wiek pracowmika' from pracownik;
Zad 3
select dzial.nazwa, count(dzial.id_dzialu) AS 'Liczba pracownikow' from dzial INNER JOIN pracownik
ON dzial.id_dzialu=pracownik.dzial
group by dzial.id_dzialu;
Zad 4 
select kategoria.nazwa_kategori, count(towar.kategoria) as 'liczba produktow' from kategoria INNER JOIN towar
On kategoria.id_kategori=towar.kategoria
group by kategoria.id_kategori;
Zad 5
select kategoria.nazwa_kategori,  group_CONCAT(towar.nazwa_towaru) AS 'produkt' from kategoria INNER JOIN towar
On kategoria.id_kategori=towar.kategoria group by kategoria.nazwa_kategori;
Zad 6
select ROUND(avg(pensja),2) as 'srednie zarobki' from pracownik;
Zad 7
select  ROUND(avg(pensja),2) as 'srednie zarobki dla pracownikow pracujacych od 5 lat' from pracownik where datediff(current_date(), data_zatrudnienia)/365>5;
Zad 8
Select towar.nazwa_towaru, count(towar.nazwa_towaru) from towar INNER JOIN pozycja_zamowienia
ON towar.id_towaru=pozycja_zamowienia.towar
group by towar.nazwa_towaru
order by count(towar.nazwa_towaru) desc
Limit 10;
Zad 9
Select zamowienie.numer_zamowienia, sum(pozycja_zamowienia.cena*pozycja_zamowienia.ilosc) from zamowienie INNER JOIN pozycja_zamowienia
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
where zamowienie.data_zamowienia BETWEEN '2017-01-01' AND '2017-03-31'
group by zamowienie.numer_zamowienia;
Zad 10
select pracownik.id_pracownika, pracownik.imie, pracownik.nazwisko, sum(pozycja_zamowienia.cena*pozycja_zamowienia.ilosc) from zamowienie INNER JOIN pozycja_zamowienia 
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie INNER JOIN pracownik
ON zamowienie.pracownik_id_pracownika=pracownik.id_pracownika
group by pracownik.id_pracownika
order by sum(pozycja_zamowienia.cena*pozycja_zamowienia.ilosc) desc;