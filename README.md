# BestBuyApp
## Dokumentacija
### Projekat: Best Buy (Najbolja kupovina)
### Student: Marko Mutavdžić 125/16

### Tema projekta:
Aplikacija je zamišljena kao online kupovina koja korisniku pomaže da pri istoj prođe što jefinije i sačuva više novca u džepu. Ispred korisnika se nalaze ponude iz više prodavnica (koje su članice aplikacije) za traženi proizvod na osnovu kojih bira najbolju ponudu. Takođe može izabrati i neku od partnerskih kurirskih službi koje u svojoj ponudi imaju simboličnu fiksnu cenu, nezavisnu od količine ili tereta porudžbine.

### Opis:
Korišćen je code first pristup.

API predstavlja skup endpointa preko kojih korisnik moze da se registruje (kreira svoj korisnički nalog), autorizuje (upotrebom JWT-a) i izvršava privilegije (UseCases) koje su dodeljene autorizovanim korisnicima aplikacije.

Granulacija privilegija je na nivou svakog korisnika, gde adminitrator svakom pojedinačnom korisniku može dodati ili oduzeti privilegiju.
Takođe, pokriven je CRUD za sve entitete. Implementirana je paginacija i pretraga za sve entitete.

Registracijom korisnik dobija mogućnost da kreira svoje porudžbine, pregleda, menja i otkazuje. Nakon uspešne registracije korisniku će stići mejl o uspešnosti.

Mapiranje dto objekata realizovano je preko Automapper-a.

Validacija podataka pri upisu i izmeni realizovana je preko FluentValidation biblioteke.

Administrator ima pristup pokušajima izvršavanja slučaja korišćenja koji su zabeleženi u tabeli koja predstavlja audit log. Moguća je i pretraga audit log-a.

Implementirana je i Swagger specifikacija.

### Dodatna uputstva za pregledanje:
Kredencijali:

Administrator: Email: admin@bestbuy.rs ; Password: admin123

Autorizovani korisnik: Email: marko.mutavdzic.125.16@ict.edu.rs ; Password: sifra123

Postman:
Pri upisu novog proizvoda podatke slati preko Body / form-data.

### Napomene:

Korišćen je code-first pristup ali ne i faker za upis podataka, pa sam u root projekta dodao i dva sql fajla (BestBuyApp.bacpac i BestBuyApp.sql) za ispunjavanje baze podacima. 

Sloj Implementation se prvobino zvao EfCommands pa je iz nekog razloga ostalo to ime foldera, dok je kada se otvori Solution a i sam folder, ime sloja Implementation.

### Database Diagram:
[Link: Dijagram baze podataka](https://imgur.com/gu9iMh2)

