# Téma: DeckLink

**Stav:** draft - issue N°16 (6. 11. 2026)

## O čom to je (1-2 vety)
Interná platforma na zdieľanie prezentácií a dokumentov v ST. Nahráš HTML alebo Markdown a dostaneš link. Vidíš, kto si to pozrel a ako ďaleko dočítal. Prezentáciu vieš vytvoriť alebo upraviť cez AI. Od 1. 6. 2026 je z toho produkt, ktorý reálne používame (aj FLOOR 9 cez "Read online" a Magazine).

## Prečo to môže zaujímať kolegov TTL
- Nástroj, ktorý si môžu hneď vyskúšať - nie príbeh o niečom, čo nikdy neuvidia.
- Ukážka "postav si vlastný nástroj namiesto licencie" (nadväzuje na N°02 Stop paying vendors).
- Beží na Cortexe (N°05 Meet Cortex) - dôkaz, že platforma funguje aj pre malé interné appky.
- Prezentácie v HTML namiesto PowerPointu: AI ich vie písať, link sa nemení, máš štatistiky.

## Surové poznámky / čísla (z repa ~/Projects/Decklink, stav 16. 10. 2026)
- Prvý commit 1. 6. 2026, launch ("DeckLink is here") v changelogu 2. 6. 2026.
- 280 commitov, 43 dní s commitmi, 25 changelog vydaní ("What's new").
- Ľudia: Tomáš (~146 commitov), Adam Majerčák (~126), Robert Blaško (7). Malý tím - viď téma male-timy.md.
- Stack: Next.js 15, TypeScript, Postgres + Drizzle, S3, AWS EKS, SSO cez F5/EMP.
- Funkcie podľa changelogu:
  - jún: upload, share linky, views, verzie (link ostáva rovnaký), API kľúče, EMP sign-in
  - 11. 6.: Edit with AI, Create with AI, Markdown dokumenty (5 vzhľadov), Events (playlist prezentácií pod jedným linkom), PDF export, ⌘K
  - 13. 6.: knižnica obrázkov/videí, Telekom template (TeleNeo, magenta)
  - 15. 6.: AI načíta web z linku (text, tabuľky, logo, farby)
  - 1. 7.: vlastná doména decklink.sk.tmo
  - 8. 7.: Create with AI za 2-4 min namiesto 13 (nový default model)
  - 31. 7.: Magazine - vydania newslettera/série na jednom mieste, AI navrhne titulok, perex a cover, plánované vydania
  - sep: priečinky, Shared with me, obnovenie zmazaného
  - okt: nový dashboard, "Reading now", read depth, presenter clicker, reuse slides v AI edit
- AI editor: chat vľavo, live preview vpravo, agent si sám robí screenshoty (Playwright) a kontroluje, či výsledok vyzerá dobre.
- Changelog píše Claude v tom istom commite ako feature (pravidlo v CLAUDE.md + changelog skill), vždy SK aj EN.
- Magazine mode bol navrhnutý priamo pre FLOOR 9 (docs/017-magazine-mode.md).
- Build ostal v repe kvôli Chromiu na thumbnaily - nechceli sme nafúknuť zdieľaný Cortex image pre všetky appky o ~300 MB.

## Prečo vznikol (od Tomáša, 20. 10. 2026)
- Každá prezentácia je dnes primárne HTML (robí ju AI). Problém: ako ju zdieľať v Teams alebo Outlooku.
- Ako príloha: príjemca musí HTML stiahnuť a potom otvoriť. Príliš komplikované, na iPade a telefónoch až nefunkčné.
- DeckLink: nahráš HTML prezentáciu, zdieľaš URL a príjemca si ju pozrie hneď, na hocijakom zariadení.
- Potom sa to postupne rozširovalo:
  - Markdown dokumenty a ďalšie súbory
  - Events: viac prezentácií pospájaných pod jedným linkom, každý rečník si pred eventom edituje svoju prezentáciu sám u seba
  - Magazine: archív všetkých vydaní FLOOR 9 na jednom mieste, ale aj iných newsletterov, ktoré píšeme a chceme mať archivované

## Doplniť od Tomáša
- Čísla: koľko ľudí to používa, koľko prezentácií/dokumentov, koľko views (Tomáš zisťuje).

## Linky
- https://decklink.sk.tmo

## Úprimná časť
Nedávame (rozhodnutie Tomáša, 20. 10. 2026).

## Čo si z toho kolega zoberie
Vyskúšaj to: pošli ďalšiu prezentáciu ako DeckLink link namiesto prílohy.
