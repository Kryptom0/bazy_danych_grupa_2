Lab07
Zad3
select k.idKreatury, if(e.idKreatury is null,'Brak własciciela', e.idKreatury) 
from ekwipunek e
left join kreatura k on k.idKreatury=e.idKreatury;

Pkt1)
select sektor, count(sektor) from etapy_wyprawy group by sektor;

select * from sektor s 
left join etapy_wyprawy ew on s.id_sektora=ew.sektor;

Select s.nazwa, COUNT(ew.sektor) AS 'ilosc odwiedzin'
from sektor s
left join etapy_wyprawy ew ON s.id_sektora=ew.sektor
GROUP by s.nazwa
ORDER by COUNT(ew.sektor);

Pkt2)
select k.nazwa, if(count(u.id_uczestnika)=0, ' Nie Bral udzialu', 'Bral udzial')
from uczestnicy u
right join kreatura k on k.idKreatury = u.id_uczestnika
group by k.nazwa;

Zad4
Pkt1)
select idwyprawy, sum(length(dziennik)) from etapy_wyprawy
group by idwyprawy having sum(length(dziennik))<400;

Pkt2)
SELECT * wyprawa
LEFT JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy
LEFT JOIN kreatura k ON u.id_uczestnika=k.idKreatury
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury
LEFT JOIN zasob z ON e.idZasobu=z.idZasobu
GROUP by w.id_wyprawy;
Zad5
Pkt1)
select datediff(curdate(), dataUr) from kreatura;
select datediff(dataUr, curdate()) from kreatura;
select abs(datediff(dataUr, curdate())) from kreatura k;

select k.nazwa, datediff(w.data_rozpoczecia,k.dataUr) AS 'Wiek w dniach' from kreatura k
INNER JOIN uczestnicy u ON k.idKreatury=u.id_uczestnika
INNER JOIN wyprawa w ON u.id_wyprawy=w.id_wyprawy
INNER JOIN etapy_wyprawy ew ON w.id_wyprawy=ew.idWyprawy
INNER JOIN sektor s ON ew.sektor=s.id_sektora
WHERE s.nazwa='Chatka dziadka';





