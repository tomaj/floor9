# Téma: firstmate + softvér sa dá skopírovať (ArtCraft, REA)

**Stav:** draft (N°14, plán 23. 10. 2026)

## Časť 1 - firstmate
- https://github.com/kunchenguid/firstmate - "Talk to one agent. Ship with a crew." (~8k stars)
- Hovoríš s jedným agentom, ten spúšťa crew v samostatných worktree, supervízuje, vracia hotové vetvy.
- Po Ruke stavali viacerí agenti naraz: jeden research, ďalší dashboard, ďalší ostatné screeny; firstmate to dal dokopy.
  (Žiadne vymyslené "magic moment" príbehy - Tomáš to nechce.)
- Úprimne: nie je to 5-min setup, žerie tokeny, MacBook Air.

## Časť 2 - na zamyslenie
- ArtCraft (Brandon Thomas, getartcraft.com, github.com/storytold): 7 Rust appiek ako náhrada Adobe,
  postavené s Claude. Tvrdí clean-room (žiadny Adobe kód, verejná dokumentácia + pozorované správanie).
  Výhrady: nikto neoveril, patenty, early alpha (roadmap ~25-35 % toho, čo potrebuje profík).
- REA (github.com/morluto/rea, MIT): MCP/CLI, napája agenta na Ghidra/Hopper, binárky, APK, Electron, web.
  Neobnovuje zdrojáky, neklonuje - vysvetľuje feature s dôkazmi. <10k stars 6. 10. -> 100k+ 12. 10. -> 277k 16. 10.
  Thomas tvrdí, že ArtCraft REA nepoužil.
- Myšlienka: feature prestáva byť moat; ostáva zákazník, dáta, dôvera, rýchlosť.

## Zdroje
- https://dev.to/arshtechpro/rea-let-your-ai-agent-reverse-engineer-the-app-features-you-wish-you-had-3en7
- https://decrypt.co/380741/gta-v-iphone-free-photoshop-ai-tool-rea-upending-software
- https://www.phoronix.com/news/Photocraft-Filmcraft-AI
- https://www.notebookcheck.net/Photoshop-Premiere-more-Experienced-Rust-developer-recreates-Adobe-suite-with-AI-assistance-as-open-source.1419230.0.html

## Pred odoslaním
- Aktualizovať počet hviezd REA (gh api repos/morluto/rea).
