# 🇧🇷 Tradução PT-BR v2.0 — Call of Duty: Black Ops 2 (Plutonium T6)

## 📋 Sobre

Projeto de tradução para português brasileiro do **Call of Duty: Black Ops 2** rodando no **Plutonium T6**.
Tradução completa de **menus, HUD, popups, gameplay (MP + ZM)** e mods inclusos.

---

## 📁 Estrutura dos Arquivos (v2.0)

```
raw/                              ← Scripts carregados pelo jogo
├── scripts/
│   ├── zm/
│   │   ├── traducao_ptbr.gsc       → Tradução ZM completa (v2.0)
│   │   ├── custom_perk_machines.gsc → Custom Perks (Downer's, Rampage, PhD, etc)
│   │   └── *.gsc                    → Outros mods (ranked, noperklimit, Perka, etc)
│   ├── mp/
│   │   ├── traducao_ptbr.gsc       → Tradução MP completa (v2.0)
│   │   └── ranked.gsc              → Sistema ranqueado
│   └── localizedstrings/
│       ├── en_patch_zm.str          → Tradução menus ZM (original)
│       ├── pt_patch_zm.str          → ★ NOVO ~180+ strings ZM
│       └── pt_patch_mp.str          → ★ NOVO ~110+ strings MP
├── ui/t6/
│   ├── mainlobby.lua               → Menu principal
│   ├── partylobby.lua              → Lobby de grupo
│   └── mods.lua                    → Gerenciador de mods
└── ui_mp/t6/
    ├── zombie/                     → UI de Zombies
    └── hud/                        → HUD elements

mods/
└── t6_ptbr_completo/               → ★ NOVO Mod PT-BR Completo
    └── mod.json                    → Manifesto do mod

docs/                               → ★ NOVO Documentação
├── ESTRUTURA_MOD_PTBR.md          → Estrutura completa
└── CHANGELOG_PTBR.md              → Histórico de versões
```

---

## ✅ O QUE JÁ FOI FEITO (v2.0)

### 1. Menus ZM — `pt_patch_zm.str` (NOVO!)
- **Menu principal**: Jogar Sozinho, Partidas Personalizadas, Teatro, Opções, Sair
- **Navegador de Servidores**: Lista, filtros, favoritos, pesquisa
- **Lobby**: Criar Classe, Scorestreaks, Quartel, Privacidade do Grupo
- **Popups**: Sair do jogo, Dissolver grupo, Desconexão, AVISO
- **HUD**: Placar, kills, mortes, ping, K/D, tempo, rodada
- **Config**: Áudio, Vídeo, Controles, Jogabilidade, FPS Máx
- **Multiplayer**: Partida Rápida, Modos de jogo, Tipos de partida
- **Ações**: Conectar, Desconectar, Expulsar, Banir, Silenciar, Denunciar
- **~180+ referências de interface traduzidas**

### 2. Menus MP — `pt_patch_mp.str` (NOVO!)
- **Create-a-Class**: Armas primárias/secundárias, acessórios, perks, equipamentos
- **Scorestreaks/Killstreaks**: Todos os nomes traduzidos
- **Modos de jogo**: TDM, Dominação, S&D, FFA, Demolição, CTF, HQ, Kill Confirmed
- **Acessórios**: Miras, silenciador, grip, etc.
- **Camuflagens**: Menu de camuflagens
- **Wildcards/Coringas**: Menu de wildcards
- **~110+ referências de interface traduzidas**

### 3. Zombies GSC — `zm/traducao_ptbr.gsc` (ATUALIZADO)
- **Portas**: "Mantenha [{+activate}] para abrir a passagem [Custo: X]"
- **Escombros**: "Mantenha [{+activate}] para remover os escombros [Custo: X]"
- **Perks**: Nomes + custos de todas as 12 perks com descrições em PT-BR
- **Pack-a-Punch**: "Mantenha [{+activate}] para melhorar sua arma [Custo: 5000]"
- **Caixa Misteriosa**: "Mantenha [{+activate}] para comprar uma arma aleatória [Custo: 950]"
- **Energia**: "Mantenha [{+activate}] para ligar a energia"
- **Armas de parede**: 50+ armas traduzidas (incluindo wonder weapons)
- **Power-ups**: Morte Instantânea, Pontos Duplos, Nuke, Carpinteiro, Munição Máxima, etc.
- **Anúncios de rodada**: Mensagens especiais nas rodadas 1, 10, 20, 30, 40, 50
- **Bau de Construção**: "Mantenha [{+activate}] para construir: [nome]"
- **Armadilhas**: "Mantenha [{+activate}] para ativar a armadilha [Custo: X]"
- **Verificação de energia**: Bloqueia compras sem energia
- **Loop de atualização 3s**: Mantém traduções mesmo quando o jogo sobrescreve

### 4. Multiplayer GSC — `mp/traducao_ptbr.gsc` (ATUALIZADO)
- **Mensagens de partida**: Aguardando times/jogadores, partida começando/iniciada
- **Resultados**: Vitória!, Derrota, Empate, Rodada vencida/perdida
- **Intervalo/Prorrogação**: Troca de lado, bônus da partida
- **Limites**: Pontos/tempo/rodadas atingidos
- **Objetivos**: Bomba armada/desarmada/explodida, bandeira capturada/perdida
- **Dominação**: Base A/B/C capturada/perdida
- **Medalhas**: Primeiro Sangue, Headshot, Abate Duplo/Triplo/Quadruplo
- **Killstreaks**: UAV, Counter-UAV, Care Package, Predator, VSAT, Swarm, K9, etc.
- **Sequências**: Killing Spree, Frenzy, Brutal, Unstoppable, etc.

### 5. Mods Existentes (Preservados)
- **TranZit Reimagined 2025** (zm_tranzit_revamped)
- **Custom Perk Machines**: Downer's Delight, Rampage, PhD Flopper, Electric Cherry, Thunder Wall, Dying Wish, Widow's Wine, Bloodthirst, Guarding Strike, Headshot Mayhem, Ammo Regen, Burn Heart, Executioner's Edge, Mule Kick
- **No Perk Limit**: Remove limite de perks
- **Health Bars**: Barra de vida para zumbis
- **Hitmarkers**: Indicador de dano
- **Drop Weapon**: Sistema de dropar armas
- **Timer/Round Counter**: Contador de rodadas
- **Fog Mod**: Modificação da névoa em TranZit
- **Origins Reward Fix**: Correção de recompensas em Origins

---

## ✅ ATUALIZADO em v2.3

### Adicionado
- **Contador de Zumbis PT-BR**: HUD "Contador de Zumbis: X" no canto inferior direito. Atualiza a cada 0.5s. Para remover o duplicado em inglês, delete `scripts/zm/Counter zm2-compiled.gsc`.
- **Menu de Controles Traduzido**: `optionscontrols.lua` — todos os labels de teclas, abas e opções de controle/gamepad em PT-BR.

## ❌ AINDA PENDENTE

### Prioridade Média
- [ ] Nomes de camuflagens em PT-BR
- [ ] Desafios (challenges) traduzidos
- [ ] Emblemas/chamados de esquadrão (calling cards)
- [ ] Modo Liga (League Play) traduzido

### Prioridade Baixa
- [ ] Campanha (nomes de missões, briefings, legendas)
- [ ] Menu de amigos completo
- [ ] Menu de reportar jogador
- [ ] Compilar arquivo `.ff` para português

---

## 🛠️ Como Funciona

### Arquivos GSC (scripts)
Os arquivos `.gsc` usam a engine do jogo para substituir dinamicamente textos em tempo real:
- `game["strings"]["chave"] = "texto"` → substitui mensagens internas
- `sethintstring()` → altera dicas de interação (portas, perks, etc)
- Loop de atualização com `wait 3` → mantém as traduções mesmo quando o jogo sobrescreve

### Arquivos STR (localized strings)
O arquivo `.str` contém referências de localização que o jogo carrega nos menus.
Formato:
```
REFERENCE           "NOME_DA_CHAVE"
LANG_ENGLISH        "Texto traduzido"
```

---

## 🔧 Como Usar

1. Entre no jogo → Main Menu → MODS
2. Selecione "PT-BR Complete Translation + Mods"
3. Os scripts GSC carregam automaticamente via `raw/`
4. Os arquivos `.str` são lidos pelo sistema de localização

---

## 📌 Notas Técnicas

- O placeholder `[{+activate}]` mostra automaticamente o botão correto (tecla PC, X Xbox, Quadrado PS)
- O sistema de `ptbr_substituir()` só troca chaves que existem, evitando erros
- O loop de atualização de 3 segundos é necessário porque o jogo frequentemente recria objetos
- Compatível com mouse/teclado e controles
- Os mods `custom_perk_machines.gsc` e `noperklimit-compiled.gsc` já estão inclusos

---

## 📄 Documentação Adicional

- `docs/ESTRUTURA_MOD_PTBR.md` - Estrutura completa de diretórios
- `docs/CHANGELOG_PTBR.md` - Histórico completo de alterações
