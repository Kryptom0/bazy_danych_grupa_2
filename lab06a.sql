Lab06
WAZNE:
# avg() - srednia
# count()- zlicza ilosc elementow
# sum()-suma wartosci(liczbowych)
# min()-minimum
# max()-maksimum

Zadanie 1
select avg(udzwig) from kreatura;
select round(avg(udzwig),0) from kreatura; --- zaokreglenie
select floor(avg(udzwig)) from kreatura;   ----- w dol
select ceil(avg(udzwig)) from kreatura;   ----- do gory 

Pkt1)
select nazwa, rodzaj, waga from kreatura;
select rodzaj, avg(waga), count(nazwa)
 from kreatura group by rodzaj;
 
Pkt2)
 select rodzaj, avg(waga), count(*)
 from kreatura group by rodzaj;
 
Pkt3)
#now()
select rodzaj, avg(year(curdate()) - year(dataUr)) as 'sredni wiek' from kreatura group by rodzaj;

Zadanie 2
Pkt1)
select rodzaj, sum(waga) as suma_wag from zasob group by rodzaj;

Pkt2)
select rodzaj, avg(year(curdate()) - year (dataUr)) as 'sredni wiek' from kreatura
group by rodzaj having 'sredni wiek' > 350;
select nazwa, avg(waga) as 'srednia_waga' from zasob where ilosc >= 4 group by nazwa having avg(waga) > 10;

Pkt3)
select count(distrinct(nazwa)) from zasob;
where ilosc >
 lub  having sum(ilosc) > 1;
 ====
 Select distinct nazwa, COUNT(nazwa) AS 'ilosc_roznych_nazw' FROM zasob GROUP BY nazwa HAVING sum(ilosc)>1;
 Select count(distrinct(nazwa)) from zasob; --- nie dziala cos
 
 
 
 Zadanie 3
 Pkt2)
 select * from kreatura, ekwipunek
 where kreatura.idKretury=ekwipunek.idKreatury;
 lub uzywajac INNER JOIN
 select * from kreatura INNER JOIN ekwipunek
 ON kreatura.idKreatury=ekwipunek.idKreatury;
  select k.nazwa from kreatura INNER JOIN ekwipunek e
 ON k.idKreatury=e.idKreatury;
 === zle===
 select kreatura.nazwa,zasob.nazwa 
 from ekwipunek
 join kreatura in ekwipunek.idKreatury=kreatura.idKreatury
 join zasob on ekwipunek.idZasobu=zasob.idZasobu
 order by kreatura.nazwa;
 =====================================================
 Pkt3)
 select from kreatura kreatura kreatura k
 INNER JOIN ekwipunek e 
 ON k.idKreatury=e.idKreatury 
 INNER JOIN zasob z ON e.idZasobu=z.idZasobu;
 
 #left join 
  select k.idkreatury, k.nazwa, e.idKreatury, e.idZasobu from kreatura
 LEFT JOIN ekwipunek e 
 ON k.idKreatury=e.idKreatury 
 where e.idKreatury is null;
 podzapytanie
 select idKreatury from kreatura where idKreatury not in
 (select distinct idKreatury from ekwipunek where idKreatury is not null);
 
 ============ to git jest
 select kreatura.idKreatury,kreatura.nazwa,idEkwipunku
 from kreatura
 left join ekwipunek on kreatura.idkreatury=ekwipunek.idKreatury 
 where idEkwipunku is null;
 
 ==========
 
 Zaadanie 4
 Pkt 1)
 
 


 
 