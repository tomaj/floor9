# Téma: Revo

**Stav:** draft -> issue N°02 ("Stop paying vendors")

## O čom to je (1-2 vety)
Desktop nástroj, ktorý nahráva rozhovory na predajni cez mikrofón a posiela ich na server,
odkiaľ ich analyzuje AI (AIVA). Retail to chcel - a vendor na to dal cenovku.

## Prečo to môže zaujímať kolegov TTL
Lebo je to reálny dôkaz tézy celého čísla: vendor chcel 140k € + opakovaný licenčný
poplatok navždy. My sme prvú funkčnú verziu postavili interne za 2 týždne, jeden developer
s Claude, bez predchádzajúcej skúsenosti s takýmto typom appky.

## Surové poznámky / čísla
- Vendor offer: **140k € + recurring licence fee** navrch (platili by sme rok čo rok).
- Retail to čakal zaplatené z **Omnichannel budgetu** - peniaze, ktoré nemáme.
- Naša odpoveď: nepaltíme externému, postavíme si to sami.
- Výsledok: **2 týždne**, **1 developer**, prompting s Claude, prvá testovateľná verzia.
- Nikto nemal skúsenosť s takýmto typom appky - spravili sme to aj tak.
- Prevádzka: **~260 h** nahrávok / deň, **35-37** pracovísk paralelne, **1 MB ≈ 1 min**.
- Architektúra: capture (desktop + mikrofón na VDI/notebooku) -> Google Cloud Storage -> AIVA.
- Testing ide naživo v **júni**, potom ladenie podľa reálneho používania.
- 100% pod našou kontrolou - rozširujeme bez čakania na vendora, žiadny lock-in.

## Linky
- Interná prezentácia: revo-prezentacia.html

## Úprimná časť (čo nevyšlo / čo bolo ťažké)
Revo nie je hotový, zamknutý produkt. Je to funkčná verzia, ktorú ďalej zlepšujeme spolu
s biznisom. Nemali sme skúsenosť s týmto typom appky - prvá verzia je základ, nie cieľ.

## Čo si z toho kolega zoberie
Keď príde vendor s cenovkou v desiatkach tisíc + licenciou, prvá otázka už nie je
"máme na to budget?", ale "vieme si to spraviť sami - a koľko by to stálo vendora,
keby použil AI tak ako my?".
