# Changelog — PT-BR Translation + Mods BO2 Plutonium

## [v2.3] - 13/06/2026

### Corrigido
- **"A mod is required for custom maps"**: Criada pasta `mods/t6_ptbr_completo/` com `mod.json`, `mod.ff` e `mod.all.sabl` copiados do `zm_tranzit_revamped`. Agora o mod aparece no menu MODS e satisfaz o requisito do Plutonium para mapas custom. Selecionar `t6_ptbr_completo` carrega o TranZit Reimagined + tradução PT-BR automaticamente.

### Adicionado
- **Contador de Zumbis PT-BR** (`raw/scripts/zm/traducao_ptbr.gsc` e `scripts/zm/traducao_ptbr.gsc`):
  - Novo HUD "Contador de Zumbis: X" exibido no canto inferior direito da tela.
  - Criado via `createFontString` por jogador ao spawnar — atualiza a cada 0.5s.
  - Se esconde automaticamente no menu ou ao morrer (`hidewheninmenu`, `hidewhendead`).
  - Nota: o arquivo compilado `Counter zm2-compiled.gsc` em `scripts/zm/` exibe "Zombies Left:" em paralelo. Para usar somente o PT-BR, delete esse arquivo.

- **Traducao Completa de Controles** (`raw/ui/t6/menus/optionscontrols.lua`):
  - Tabela `PTBR` com 80+ chaves de localização traduzidas.
  - Helper `L(key)` que retorna PT-BR ou fallback para `Engine.Localize`.
  - Todos os labels de teclas traduzidos: Mover Para Frente, Agachar, Atacar, Recarregar, etc.
  - Abas traduzidas: VISAO, MOVIMENTACAO, COMBATE, INTERACAO, CONTROLE.
  - Opções de controle traduzidas: sensibilidade, vibração, zona morta, inversão.
  - Hints de actionslots traduzidos em PT-BR.

### Sincronizado
- `scripts/zm/traducao_ptbr.gsc` atualizado para espelhar `raw/scripts/zm/`.

## [v2.2] - 12/06/2026

### Adicionado
- **Script de Automação de Build** (`build_mod.ps1`): Script em PowerShell para automatizar a parada de processos do jogo, mesclagem das strings traduzidas com as originais, compilação de fastfiles e cópia para o diretório de carregamento global do Plutonium.
- **Extração de Assets Base de Multiplayer**: Utilizado `Unlinker.exe` para descompilar o `en_patch_mp.ff` original do jogo, extraindo o `en_patch_mp.str` base (com todas as strings oficiais de MP) para mesclar nossas traduções sem perder outras strings do jogo.

### Corrigido
- **Erros de Sintaxe no Parser do Linker (OAT)**: 
  - Corrigido o posicionamento da marcação `ENDMARKER` nos arquivos `.str` gerados (anteriormente inserida antes das traduções customizadas).
  - Renomeadas as chaves com espaços (`UNLOCK ALL` e `RESET STATS`) para referências válidas com underline (`UNLOCK_ALL` e `RESET_STATS`).
- **Remoção de UTF-8 BOM**: Forçado o salvamento dos arquivos `.zone` e `.str` no formato UTF-8 sem BOM (Byte Order Mark), resolvendo o erro de leitura no OpenAssetTools.
- **Sincronização de Scripts**: Copiados os arquivos GSC atualizados da pasta `raw/scripts/` para `scripts/` (resolvendo descompasso em scripts como `traducao_ptbr.gsc` e `ranked.gsc` que estavam desatualizados ou incompletos na pasta `scripts/`).

## [v2.1] - 12/06/2026

### Corrigido
- **CRITICAL FIX — Menus traduzidos via Lua**: O jogo não carrega arquivos `.str` do diretório `raw/scripts/localizedstrings/` — as strings são carregadas de zone files compilados (`.ff`) em `zone/english/`. Solução: substituir chamadas `Engine.Localize()` nos arquivos Lua por texto em português direto.
  - `mainlobby.lua`: Botões (NAVEGADOR DE SERVIDORES, PARTIDA RÁPIDA, PARTIDAS PERSONALIZADAS, TEATRO, QUARTEL, OPÇÕES, MODS, JOGAR SOZINHO, CLASSIFICAÇÕES), hint texts, popups de erro, mensagens de sair/dissolver grupo
  - `partylobby.lua`: Botões (CRIAR CLASSE, SEQÜÊNCIAS DE PONTOS, QUARTEL, DESBLOQUEAR TUDO, REDEFINIR ESTATÍSTICAS, CLASSIFICAÇÕES), popups de confirmação, mensagens de sair/levar grupo, avisos de DLC
  - `en_patch_zm.str` e `en_patch_mp.str` mantidos como fallback (.str não são carregados pelo jogo)
  - `pt_patch_zm.str` e `pt_patch_mp.str` removidos (obsoletos)

## [v2.0] - 12/06/2026

### Adicionado
- **Mod oficial** `t6_ptbr_completo` com mod.json
- **Tradução completa de menus ZM** (`en_patch_zm.str`):
  - Menu principal (Jogar Sozinho, Partidas Personalizadas, Teatro, Opções, Sair)
  - Navegador de servidores
  - Lobby de grupo (Criar Classe, Scorestreaks, Quartel)
  - Popups (Sair do jogo, Dissolver grupo, Desconexão)
  - Status de NAT e privacidade
  - Lista de jogadores, amigos online
  - ~180+ strings de interface traduzidas

- **Tradução completa de menus MP** (`en_patch_mp.str`):
  - Menu principal multiplayer
  - Create-a-Class (armas, perks, equipamentos, acessórios)
  - Modos de jogo (Morte Súbita, Dominação, Busca e Destruição, etc.)
  - HUD (placar, kills, mortes, ping, K/D)
  - Configurações de partida (limite de pontos/tempo/rodadas)
  - Filtros de servidor (Ranqueada, Hardcore, Modificada)
  - ~110+ strings de interface traduzidas

- **Tradução ZM aprimorada** (`raw/scripts/zm/traducao_ptbr.gsc`):
  - Power-ups: Morte Instantânea, Pontos Duplos, Bomba Nuclear, Carpinteiro, Munição Máxima, etc.
  - Anúncios de rodada: Mensagens especiais nas rodadas 1, 10, 20, 30, 40, 50 e múltiplos de 5
  - Descrições de perks em PT-BR
  - Suporte a Bau de Construção e Armadilhas
  - Mais armas traduzidas (M8A1, AN-94, Type 25, Ray Gun, Ray Gun Mark II, Wunderwaffe, etc.)
  - Mensagem de boas-vindas mais detalhada

- **Tradução MP aprimorada** (`raw/scripts/mp/traducao_ptbr.gsc`):
  - Medalhas: Primeiro Sangue, Headshot, Abate Duplo/Triplo/Quadruplo
  - Killstreaks: UAV, Care Package, Predator, VSAT, Swarm, K9 Unit, etc.
  - Modos: Bandeira capturada/perdida, Bomba armada/desarmada, Bases Dominadas
  - Mensagens de sequência: Killing Spree, Frenzy, Brutal, Unstoppable, etc.

- **Documentação**:
  - `docs/ESTRUTURA_MOD_PTBR.md` - Estrutura completa do diretório
  - `docs/CHANGELOG_PTBR.md` - Este arquivo

### Modificado
- `raw/scripts/zm/traducao_ptbr.gsc`: Adicionadas ~150 linhas novas
- `raw/scripts/mp/traducao_ptbr.gsc`: Adicionadas ~80 linhas novas
- `raw/scripts/localizedstrings/en_patch_zm.str`: Expandido de parcial (~30) para completo (~180 strings)

### Preservado
- Todos os scripts originais de mod (custom_perk_machines, noperklimit, Perka 1.6, etc.)
- Mod original `zm_tranzit_revamped` intacto
- Ícones .iwi, demos, configurações de jogador

---

## [v1.0] - 26/07/2025

### Adicionado
- `raw/scripts/zm/traducao_ptbr.gsc` - Tradução base ZM
- `raw/scripts/mp/traducao_ptbr.gsc` - Tradução base MP
- `raw/scripts/localizedstrings/en_patch_zm.str` - Tradução parcial de menus
- `raw/ui/t6/mainlobby.lua` - Modificações no menu principal
- `raw/ui/t6/partylobby.lua` - Modificações no lobby
- `raw/ui/t6/mods.lua` - Gerenciador de mods
- `raw/scripts/TRADUCAO_PTBR.md` - Documentação inicial

### Funcionalidades v1.0
- **Zombies**: Portas, escombros, perks, Pack-a-Punch, energia, caixa misteriosa, armas de parede
- **Multiplayer**: Mensagens de início/fim, aguardando jogadores, vitória/derrota, espectador
- **Menus**: Lista de servidores, Jogar Sozinho, Partidas Personalizadas, Teatro, Opções, Voltar

---

## Próximos Passos (Planejados)

- [ ] Tradução completa da Campanha
- [ ] Nomes de camuflagens em PT-BR
- [ ] Desafios (challenges) traduzidos
- [ ] Emblemas/chamados de esquadrão traduzidos
- [ ] Modo Liga (League Play) traduzido
- [ ] Menu de amigos e reportar jogador
- [ ] Popups de erro e desconexão completos
- [ ] Compilar `.ff` para português (via zone tool)
