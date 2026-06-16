# Estrutura Completa do Mod + Tradução PT-BR — BO2 Plutonium

## Visão Geral do Diretório `storage\t6`

```
t6/
├── .claude/                  # Config Claude Code
├── demos/                    # Demos/Demonstrações gravadas
│   ├── *.demo               # Arquivos de demo
│   └── *.json               # Metadados das demos
├── docs/                     # Documentação (NOVO)
│   ├── ESTRUTURA_MOD_PTBR.md
│   └── CHANGELOG_PTBR.md
├── images/                   # Imagens customizadas
│   ├── specialty_*.iwi      # Ícones de perks ZM
│   └── minimap_icon_*.iwi   # Ícones de minimapa
├── main/                     # Logs do jogo
│   ├── console_zm.log.*     # Logs do console Zombies
│   └── console_mp.log       # Log do console Multiplayer
├── mods/
│   ├── zm_tranzit_revamped/ # Mod original "TranZit Reimagined 2025"
│   │   ├── mod.json         # Manifesto do mod
│   │   ├── mod.ff           # Fastfile compilado
│   │   ├── mod.all.sabl     # Compilado
│   │   ├── iwd.iwd          # Assets do mod
│   │   ├── zmStats          # Estatísticas
│   │   └── games_mp.log     # Log
│   └── t6_ptbr_completo/    # (NOVO) Mod PT-BR Completo
│       └── mod.json         # Manifesto do mod PT-BR
├── players/                  # Config de jogadores
│   ├── user_*.cgp          # Stats dos jogadores
│   ├── bindings_*.bdg      # Bindings de teclas
│   ├── hardware_*.chp      # Config de hardware
│   ├── plutonium_*.cfg     # Config do Plutonium
│   ├── screenshots/        # Screenshots
│   └── mods/               # Config de mods (zm_tranzit_revamped)
├── plutonium/               # Arquivos do Plutonium
│   ├── dvar_descriptions.json  # Descrições de dvars
│   ├── unlockstats_mp      # Stats de desbloqueio MP
│   ├── unlockstats_zm      # Stats de desbloqueio ZM
│   └── soundaliaslists     # Listas de áudio
├── raw/                     # Scripts carregados pelo jogo
│   ├── scripts/
│   │   ├── zm/
│   │   │   ├── traducao_ptbr.gsc         # (ATUALIZADO) Tradução ZM
│   │   │   ├── custom_perk_machines.gsc  # Máquinas de perks custom
│   │   │   ├── ranked.gsc               # Sistema de ranked
│   │   │   ├── *.gsc                    # Outros mods
│   │   ├── mp/
│   │   │   ├── traducao_ptbr.gsc        # (ATUALIZADO) Tradução MP
│   │   │   └── ranked.gsc              # Sistema de ranked MP
│   │   └── localizedstrings/
│   │       ├── en_patch_zm.str          # (FALLBACK) ~180 strings ZM (não carregado pelo jogo)
│   │       └── en_patch_mp.str          # (FALLBACK) ~110 strings MP (não carregado pelo jogo)
│   ├── ui/t6/
│   │   ├── mainlobby.lua                # Menu principal (modificado)
│   │   ├── partylobby.lua               # Lobby de grupo
│   │   ├── mods.lua                     # Menu de mods
│   │   └── dvarleftrightselector.lua    # Seletor de dvars
│   └── ui_mp/t6/
│       ├── zombie/                      # UI de Zombies
│       │   ├── hudcompetitivescoreboardzombie.lua
│       │   └── hudcompetitivescoreboardzombieOG.lua
│       ├── hud/                         # HUD elements
│       │   ├── scoreboard.lua
│       │   ├── loading.lua
│       │   ├── class.lua
│       │   └── spectateplayercard.lua
│       └── menus/                       # Menus
│           ├── theaterlobby.lua
│           ├── privategamelobby_project.lua
│           └── editgameoptionspopup.lua
├── scripts/                  # (CÓPIA) Scripts duplicados (não usados diretamente)
│   ├── zm/                  # Duplicatas de raw/scripts/zm/
│   ├── zm_transit/          # Scripts de mapas compilados
│   ├── zm_town/             # Scripts de Town compilados
│   ├── zm_tomb/             # Scripts de Origins compilados
│   └── mp/                  # Duplicatas de raw/scripts/mp/
├── zone/                     # Fastfiles (.ff) de localização
│   ├── plutonium_*.ff       # Fastfile base
│   ├── en_plutonium_*.ff    # Inglês
│   ├── pt_plutonium_*.ff    # (NOVO) Português (via .str)
│   ├── es_plutonium_*.ff    # Espanhol
│   ├── fr_plutonium_*.ff    # Francês
│   ├── de_plutonium_*.ff    # Alemão
│   ├── it_plutonium_*.ff    # Italiano
│   ├── po_plutonium_*.ff    # Polonês
│   ├── ru_plutonium_*.ff    # Russo
│   └── ja_plutonium_*.ff    # Japonês
├── imgui.ini                 # Config da interface ImGui
└── sufixo.size               # Arquivo de tamanho
```

## Mods Disponíveis

### 1. zm_tranzit_revamped (Original)
- **Autor**: Ultimateman
- **Versão**: Build 29_01_2025
- **Descrição**: TranZit Reimagined 2025 - Warmer Days Update
- **Status**: Mantido como está (não modificado)

### 2. t6_ptbr_completo (NOVO)
- **Autor**: Ultimateman + Comunidade
- **Versão**: Build 06_2026 (v2.1)
- **Descrição**: Tradução PT-BR Completa + Custom Perks + Mods
- **Inclui**: Menu (Lua), HUD, Popups, Armas, Perks, Portas traduzidos
- **Nota**: Tradução de menus é feita via modificação direta dos arquivos Lua (Engine.Localize substituído por texto PT-BR), pois o jogo não carrega arquivos .str do raw/

## Arquivos Criados/Modificados

| Arquivo | Ação | Descrição |
|---------|------|-----------|
| `mods/t6_ptbr_completo/mod.json` | CRIADO | Manifesto do mod PT-BR |
| `raw/scripts/localizedstrings/en_patch_zm.str` | MANTIDO | ~180+ referências de menu ZM (.str não carregado pelo jogo) |
| `raw/scripts/localizedstrings/en_patch_mp.str` | CRIADO | ~110+ referências de menu MP (.str não carregado pelo jogo) |
| `raw/ui/t6/mainlobby.lua` | MODIFICADO | Engine.Localize substituído por texto PT-BR direto (botões, hints, erros) |
| `raw/ui/t6/partylobby.lua` | MODIFICADO | Engine.Localize substituído por texto PT-BR direto (botões, popups, avisos) |
| `raw/scripts/zm/traducao_ptbr.gsc` | ATUALIZADO | Tradução ZM com powerups, rounds, descrições |
| `raw/scripts/mp/traducao_ptbr.gsc` | ATUALIZADO | Tradução MP com killstreaks, modos, medalhas |
| `docs/ESTRUTURA_MOD_PTBR.md` | CRIADO | Este documento |
| `docs/CHANGELOG_PTBR.md` | CRIADO | Histórico de alterações |

## Scripts de Mod Existentes (Preservados)

### Zombies (`raw/scripts/zm/` e `scripts/zm/`)
| Script | Função |
|--------|--------|
| `traducao_ptbr.gsc` | Tradução PT-BR para ZM (portas, perks, armas, energia, Pack-a-Punch, caixa misteriosa) |
| `custom_perk_machines.gsc` | Sistema de máquinas de perks customizados (Downer's Delight, Rampage, PhD Flopper, Electric Cherry, Thunder Wall, Dying Wish, etc.) |
| `noperklimit-compiled.gsc` | Remove limite de perks que o jogador pode comprar |
| `Perka 1.6.gsc` | Sistema de perks alternativo |
| `plutonium_t6_zombies_custom_perk_powerup (1).gsc` | Power-ups para perks custom |
| `ranked.gsc` | Sistema de partidas ranqueadas |
| `shared_box_compiled.gsc` | Caixa de armas compartilhada |
| `stuminup-compiled.gsc` | Modificação do Stamin-Up |
| `wunder-compiled.gsc` | Modificação de armas wonder weapon |
| `Health bar2-compiled.gsc` | Barra de vida para zumbis |
| `HIT.gsc` | Sistema de hitmarker/indicador de dano |
| `dropar_arma-compiled2.gsc` | Sistema de dropar armas |
| `Counter zm2-compiled.gsc` | Contador de rodadas/abalos |
| `TIMER ET TIMER ROUND.gsc` | Timer de partida e rodada |
| `fog.gsc` (zm_transit) | Modificação do sistema de névoa em TranZit |
| `nacht_t6_zombies.gsc` (zm_transit) | Modificação do mapa Nacht em TranZit |
| `originsrewardfix-compiled.gsc` (zm_tomb) | Correção de recompensas em Origins |
| `wunder-compiled.gsc` (zm_town) | Wonder weapons em Town |

### Multiplayer (`raw/scripts/mp/` e `scripts/mp/`)
| Script | Função |
|--------|--------|
| `traducao_ptbr.gsc` | Tradução PT-BR para MP (mensagens de partida, vitória/derrota, etc.) |
| `ranked.gsc` | Sistema de ranqueadas MP |

### UI Lua Modificada
| Arquivo | Modificações |
|---------|--------------|
| `raw/ui/t6/mainlobby.lua` | Botões do menu principal (Server Browser, Solo, Custom, Theater, Options, Mods) |
| `raw/ui/t6/partylobby.lua` | Lobby de grupo (Criar Classe, Scorestreaks, Unlock All, Reset Stats) |
| `raw/ui/t6/mods.lua` | Gerenciador de mods |
| `raw/ui_mp/t6/zombie/hudcompetitivescoreboardzombie.lua` | Scoreboard competitivo ZM (parcialmente comentado) |

## Compilação e Deploy (Script de Build)

Para facilitar a edição e compilação do mod, foi criado o script de automação [build_mod.ps1](file:///C:/Users/Felipe/AppData/Local/Plutonium/storage/t6/build_mod.ps1) na raiz do diretório.

### O que o script faz:
1. Encerra quaisquer instâncias ativas do jogo (`plutonium-bootstrapper-win32`, `t6zm`, `t6mp`) para destravar os arquivos `.ff`.
2. Mescla automaticamente os arquivos de tradução customizados (`raw/scripts/localizedstrings/*.str`) com os arquivos originais extraídos do jogo, inserindo corretamente a marcação `ENDMARKER` no final.
3. Compila os arquivos de tradução em novos arquivos de zona (`en_patch_zm.ff` e `en_patch_mp.ff`) usando o **OpenAssetTools** (`Linker.exe`).
4. Move os arquivos compilados diretamente para a pasta global de localização do Plutonium (`storage/t6/zone/`).

### Como rodar o build:
Abra o PowerShell e execute:
```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\build_mod.ps1
```

## Como Usar

1. Execute o script `build_mod.ps1` para compilar e implantar as traduções.
2. As traduções globais serão carregadas automaticamente do diretório `zone/` na inicialização do jogo.
3. Os scripts `traducao_ptbr.gsc` carregam automaticamente.

### Testando a Tradução
- **Menus**: Os botões e descrições do menu principal e lobbies estarão em português via fastfiles localizados `.ff`.
- **Zombies**: Portas, escombros, Perks, armas e energia aparecerão em português.
- **Multiplayer**: Medalhas, mensagens de killstreak, vitória/derrota e modos de jogo estarão em português.

## Notas Técnicas

- **Placeholder `[{+activate}]`**: Mostra automaticamente a tecla correta (PC: F, Xbox: X, PS: Quadrado).
- **Sistema de custo dinâmico**: Extrai o valor numérico do final das chaves para mostrar "[Custo: X]".
- **Sem Erros de Sintaxe**: Referências no arquivo `.str` como `UNLOCK_ALL` e `RESET_STATS` foram corrigidas para conter underline (`_`) em vez de espaços, evitando falhas de parser no Linker.
- **UTF-8 sem BOM**: O build gera os arquivos `.zone` e `.str` sem o cabeçalho BOM (Byte Order Mark) que causava erros de compilação no OpenAssetTools.
- **Sincronização de GSC**: Os scripts em `raw/scripts/` e `scripts/` foram sincronizados para garantir a execução do mesmo código atualizado.
