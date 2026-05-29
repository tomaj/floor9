# FLOOR 9 - TTL newsletter

Piatočný newsletter pre kolegov TTL. Krátko, úprimne a užitočne o tom, čo robíme v Digital & Omnichannel, ako to robíme, čo vyšlo aj čo zabolelo.

Názov je **"FLOOR 9"** (tribes sedia na 9. poschodí). Pokojne ho zmeň, je len v hlavičke šablóny a v HTML. Pokojne ho premenuj, je len na jednom mieste (v hlavičke šablóny a v HTML).

---

## Ako to funguje

1. **Témy si držím v `temy/`.** Každá téma má vlastný `.md` súbor, kde si postupne zapisujem poznámky, čísla, citáty, linky - hocijaký surový materiál. Nemusí to byť pekné.
2. **Keď je téma zrelá**, založím nové vydanie v `vydania/` podľa vzoru `RRRR-MM-DD-poradie-tema/` a do `newsletter.md` napíšem finálny text podľa šablóny.
3. **HTML pre Outlook** vygenerujem zo šablóny `sablona/newsletter-sablona.html` - len vymením obsah. Hotové HTML otvorím v prehliadači, skopírujem (Ctrl+A, Ctrl+C) a vložím do nového mailu v Outlooku. Alebo poviem Claude Code: *"sprav z newsletter.md HTML podľa našej šablóny"*.

## Workflow v Claude Code

Typické vety, ktoré tu fungujú:

- `"založ nové vydanie na tému Paperclip"`
- `"z temy/cortex.md priprav draft newslettera, drž štýl ako v armagedon vydaní"`
- `"sprav z tohto newsletter.md HTML pre Outlook podľa našej šablóny"`
- `"skráť to o tretinu, je to dlhé"`
- `"prejdi to a vyhoď všetko, čo znie ako chválenie sa"`

## Štruktúra priečinka

```
ttl-newsletter/
├── README.md                  <- tento súbor
├── sablona/
│   ├── newsletter-sablona.md  <- prázdna kostra textu
│   └── newsletter-sablona.html<- prázdna kostra HTML pre Outlook
├── temy/
│   ├── 00-backlog.md          <- zoznam tém a v akom sú stave
│   └── *.md                   <- jeden súbor na tému
└── vydania/
    └── 2026-05-29-01-armagedon/
        ├── newsletter.md      <- finálny text
        └── newsletter.html    <- hotové na poslanie
```

## Pravidlá tónu (dôležité - toto je celé o tomto)

- **Žiadne chválenie sa.** Nie "pozrite, čo sme dokázali", ale "toto sme skúsili a takto to dopadlo, možno sa vám zíde".
- **Úprimne aj o tom, čo bolelo / nevyšlo.** Bez toho je to PR leták a nikto to nečíta druhýkrát.
- **Zásluhy tímu, nie moje.** Ja som len ten, čo to píše.
- **Vždy nechať niečo užitočné**, čo si kolega vie zobrať a použiť u seba.
- **Obojsmerné** - na konci pozvať, nech sa ozvú a zdieľajú aj oni.
- Pomlčky píšeme krátke ("-"), nie dlhé.

## Komu to ide

Primárne kolegovia TTL. Píš tak, aby to šéf mohol bez úpravy preposlať vyššie (kludne aj CEO). To znamená: zrozumiteľne aj pre niekoho, kto nie je v IT, a bez interného žargónu, ktorý by mimo tribu nedával zmysel.

## Štýl a jazyk (aktualizované)

- **Newsletter sa píše po anglicky** (publikum vrátane DT / vyššieho vedenia).
- **Vizuál vedie pred textom.** Veľké čísla, before/after, bar compare. Krátke odstavce. Čierny hero blok, magenta + zelený akcent.
- Honest, nie chvastúnsky: vždy nechaj sekciu "Kept honest" (čo nevyšlo / čo by si spravil inak).
- Pomlčky krátke ("-"), nikdy dlhé.
- Display font v HTML je Anton + Archivo cez Google Fonts. V starom Outlook desktop (Word engine) padnú na Arial/Arial Black - štruktúra (tabuľky, bary cez bgcolor) drží aj tak. V novom Outlooku / Outlook web / Apple Mail / Gmail vyzerá presne ako náhľad.

## Stála rubrika: "Tomi's Window"

Toto je **stála sekcia v každom čísle** - nie jednorazovka. Vizuálne je zámerne odlíšená: celý blok má tmavé (čierne) pozadie s rámčekom a zeleným labelom "A regular thing", aby vyskočil z toku a čitateľ ho hneď spoznal.

Obsah: jedna pekná/zaujímavá vec z tech sveta, ktorú práve skúšam alebo sledujem. Krátky popis čo to je + 2-4 body prečo to stojí za pozornosť (a kľudne warning, ak treba). Issue #01 = Paperclip.

V Claude Code: *"do tohto čísla daj do rubriky 'What I'm playing with' [nástroj/odkaz], drž rovnaký tmavý vizuál ako v issue #01"*. Tmavý panel je v šablóne `sablona/newsletter-sablona.html` - len vymeň názov, URL, popis a body.

## Finálny dizajn (v2) + ako poslať issue #01

Aktuálny dizajn je vyladená **v2**: editorial serif (Fraunces) pre kľúčové vety, číslované sekcie 01-04, hero s veľkým FLOOR 9 wordmarkom, štatistiky v paneli s predeľovačmi, full-width "Tomi's Window". Šablóna `sablona/newsletter-sablona.html` je už v tomto dizajne.

Issue #01 (Armagedon) je hotové a ready na poslanie:
1. Otvor `vydania/2026-05-29-01-armageddon/newsletter.html` v prehliadači.
2. Ctrl+A, Ctrl+C.
3. V Outlooku nový mail -> Ctrl+V. (Ak sa rozhodí, skús "Vložiť -> Zachovať formátovanie zdroja".)
4. Predmet napr.: FLOOR 9 · Issue N°01 - Operation Armageddon. Najprv pošli test sebe.

Pozn.: V Outlook desktop (Word engine) serif padne na Georgia, display na Arial Black - layout drží. V novom Outlooku / web / Apple Mail / Gmail vyzerá presne ako náhľad.
