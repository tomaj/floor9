# Téma: Rýchlosť je nový štandard (Speed is the new normal)

**Stav:** odoslané (N°12, 25. 9. 2026)

## O čom to je (1-2 vety)
Za poslednú dobu sa u nás postavilo prekvapivo veľa vecí a všetky rýchlo. Nie je to
séria výnimiek ani hrdinstiev - je to nová normálna rýchlosť. Vydanie to pomenuje
a ukáže na konkrétnych veciach, čo za ten čas vzniklo.

## Prečo to môže zaujímať kolegov TTL
Presúva očakávania. Keď sa "toto by trvalo rok" zmení na "toto stálo pár týždňov",
mení to plánovanie, rozhodovanie aj to, čo si vôbec dovolíme navrhnúť. Zoznam nižšie
je dôkaz, nie sľub.

## Čo sa postavilo (kostra vydania)

### Communication hub
Dnes posielame e-maily a SMS na zákazníka z kopy rôznych miest. Niečo je zadrôtované
v kóde, niečo sa klikne v UI nejakej aplikácie. Nikto nemá centrálnu kontrolu nad tým,
čo zákazníkovi vlastne odchádza. Hub je odpoveď: jedna krabica, do ktorej streamlinujeme
všetku komunikáciu na zákazníka. A zároveň podmienka pre Siebel decommissioning.

_Doplniť: koľko systémov dnes posiela, koľko ich už je zapojených do hubu._

### Vyvolávací systém
Retail prišiel s tým, že by chcel nový vyvolávací systém prepojený s OneApp. Easy ;-)

_Doplniť: ako dlho to trvalo od nápadu po funkčnú vec, na koľkých predajniach beží._

### Nové IWD
IWD = intelligent workload distribution. Na starom riešení v Genesyse sme mali veľké
a komplexné IWD, ktoré prestalo fungovať. Status na SK bol, že sa bez toho zvládne
fungovať. Potom prišla správa, že Vianoce takto nedajú. Tak sme rýchlo začali stavať
náhradu - takú, ktorá pokryje čo najviac prípadov, ale nebude taká komplexná ako
originál. Presne ten kompromis, ktorý sa dá postaviť za týždne namiesto rokov.

_Doplniť: kedy prišla tá správa, dokedy to muselo stáť, koľko % prípadov pokrýva._

### Flow
Nový frontend namiesto Siebelu. Fully AI, moderný, rýchly a pripravený na akékoľvek
rozširovanie. Ako backend používa nové DPS. Detailne si ho ukážeme nabudúce - tu len
teaser.

## Surové poznámky / čísla
- Ku každej veci doplniť: kto na tom robil (počet ľudí), ako dlho to trvalo, čo by to
  stálo/trvalo klasickou cestou.
- Spoločná niť: Communication hub aj Flow sú kúsky Siebel decommissioningu. Nie sú to
  štyri nesúvisiace vecičky, je to posun z monolitu na vlastné veci, ktoré ovládame.
- IWD a vyvolávací systém sú "prišla požiadavka, postavili sme" - dôkaz, že rýchlosť
  nie je len o veľkých programoch.
- Nadväznosť: [[male-timy]] (prečo to ide rýchlo) a "Where AI is fast" (kde to naopak drhne).
- Flow si zaslúži vlastné vydanie - viď [[flow]].

## Linky


## Úprimná časť (čo nevyšlo / čo bolo ťažké)
- Rýchlosť má cenu - kde sme platili technickým dlhom, kde sme museli niečo prerobiť.
- Čo z toho ešte nie je "hotové", len funkčné.

## Čo si z toho kolega zoberie
