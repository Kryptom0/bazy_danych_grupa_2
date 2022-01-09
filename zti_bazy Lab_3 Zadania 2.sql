-------------------------------------------
zti_bazy Lab3 Zadania2
-------------------------------------------
Zad1
Select dzial.nazwa, min(pensja) AS 'Minimalna pensja', max(pensja) AS 'Maksymalna pensja', floor(avg(pensja)) AS 'Srednia pensja' from dzial INNER JOIN pracownik
ON dzial.id_dzialu=pracownik.dzial
group by nazwa;
Zad2
Select group_concat(klient.pelna_nazwa) AS 'Pelna nazwa' , zamowienie.numer_zamowienia AS 'Numer zamowienia', sum(ilosc*cena) as 'wartosc zamowienia' from klient INNER JOIN zamowienie
ON klient.id_klienta=zamowienie.klient INNER JOIN pozycja_zamowienia
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
group by zamowienie.numer_zamowienia
order by sum(ilosc*cena) desc LIMIT 10;
Zad3
#Jezeli bierzemy pod uwage wszystkie zamowienia(rowniez anulowane)
select YEAR(data_zamowienia) AS 'Rok', sum(ilosc*cena) AS 'Przychod' from towar INNER JOIN pozycja_zamowienia
ON towar.id_towaru=pozycja_zamowienia.towar INNER JOIN zamowienie
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
group by YEAR(data_zamowienia)
order by sum(ilosc*cena) desc;

#Jezeli bierzemy pod uwage tylko zamowienia zrealizowane
select YEAR(data_zamowienia) AS 'Rok', sum(ilosc*cena) AS 'Przychod' from towar INNER JOIN pozycja_zamowienia
ON towar.id_towaru=pozycja_zamowienia.towar INNER JOIN zamowienie
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
where zamowienie.status_zamowienia=5
group by YEAR(data_zamowienia)
order by sum(ilosc*cena) desc;
Zad4 
select sum(ilosc*cena) AS 'Suma wartosci wszystkich anulowanych zamowien' from towar INNER JOIN pozycja_zamowienia
ON towar.id_towaru=pozycja_zamowienia.towar INNER JOIN zamowienie
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
where status_zamowienia=6;
Zad5 
Select adres_klienta.miejscowosc, count(zamowienie) AS 'Liczba zamowien', sum(ilosc*cena) AS 'Wartosc' from pozycja_zamowienia INNER JOIN zamowienie
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia INNER JOIN klient
ON zamowienie.klient=klient.id_klienta INNER JOIN adres_klienta
ON klient.id_klienta=adres_klienta.klient
where adres_klienta.typ_adresu=1
group by adres_klienta.miejscowosc;
Zad6 
select sum((ilosc*cena)+(towar.cena_zakupu)) AS 'dochod' from zamowienie INNER JOIN status_zamowienia
ON zamowienie.id_zamowienia=status_zamowienia.id_statusu_zamowienia INNER JOIN pozycja_zamowienia
ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie INNER JOIN towar 
ON pozycja_zamowienia.towar=towar.id_towaru
where status_zamowienia=5;
Zad7
select Year(data_zamowienia) AS 'rok', sum(ilosc*cena)-sum(towar.cena_zakupu*pozycja_zamowienia.ilosc) AS 'Dochod' from pozycja_zamowienia INNER JOIN towar
ON pozycja_zamowienia.towar=towar.id_towaru INNER JOIN zamowienie
ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
group by Year(data_zamowienia)
order by Year(data_zamowienia);
Zad8
select kategoria.nazwa_kategori AS 'Nazwa kategori', sum(stan_magazynowy.ilosc*towar.cena_zakupu) AS 'Wartosc stanu magazynowego' from stan_magazynowy INNER JOIN towar 
ON stan_magazynowy.towar=towar.id_towaru INNER JOIN kategoria
ON towar.kategoria=kategoria.id_kategori
group by kategoria.nazwa_kategori;
Zad9
select monthname(data_urodzenia) AS 'Miesiac', count(id_pracownika) AS 'Liczba pracownikow'  from pracownik 
group by monthname(data_urodzenia) ORDER BY monthname(data_urodzenia);
