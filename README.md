# T6 - Tradução PT-BR Completa para Call of Duty: Black Ops II (Plutonium)

Tradução completa em Português Brasileiro para Call of Duty: Black Ops II via Plutonium T6 (Zombies, Multiplayer, Campanha e Menus) + Scripts Customizados.

> 🚀 **Carregamento Automático**: O jogo carrega a tradução automaticamente direto da pasta `raw`, sem necessidade de usar ou carregar a pasta `mods`.

---

## 🎯 Conteúdo Traduzido

- **Modo Zombies** — Transit, Buried, Die Rise, Nuketown, Mob of the Dead (Prison), Origins (Tomb), Highrise
- **Modo Multiplayer** — Todos os mapas e modos de jogo
- **Campanha** — Missões e diálogos
- **Menus e Interface** — Placar, Vantagens (Perks), Anexos de Armas, Séries de Pontuação e Configurações
- **Nomenclaturas Originais e Ajustadas** — Armas, anexos e dificuldades dos bots (Recruta, Regular, Casca Grossa, Veterano)

---

## 📥 Instalação

1. Baixe ou clone este repositório:
   ```bash
   git clone https://github.com/FelipeMzero/T6.git
   ```

2. Copie a pasta **`raw`** para o diretório de dados do Plutonium:
   ```
   %localappdata%\Plutonium\storage\t6\
   ```

   > 💡 *Dica*: Pressione `Win + R`, cole `%localappdata%\Plutonium\storage\t6\` e aperte **Enter** para abrir a pasta diretamente.

3. A estrutura das pastas deve ficar assim:
   ```
   %localappdata%\Plutonium\storage\t6\raw\
   ├── localizedstrings/   ← Arquivos de tradução (.str)
   └── scripts/            ← Scripts customizados (Zombies)
   ```

---

## 🎮 Como Usar

1. Abra o **Plutonium T6** (Zombies ou Multiplayer).
2. Pronto! O jogo será iniciado **automaticamente traduzido em Português Brasileiro**.
3. **Não** é necessário acessar o menu "Mods" nem carregar nada manualmente.

---

## 📂 Estrutura do Repositório

O jogo carrega todo o conteúdo automaticamente a partir da pasta **`raw`**:

```
%localappdata%\Plutonium\storage\t6\
└── raw/                           ← Pasta carregada automaticamente pelo Plutonium
    ├── localizedstrings/          ← 84 arquivos .str com a tradução completa PT-BR
    │   ├── en_code_post_gfx_mp.str
    │   ├── en_patch.str
    │   ├── sp_code_post_gfx_mp.str
    │   └── ... (demais arquivos .str)
    └── scripts/                   ← Scripts customizados opcionais (Zombies)
        └── zm/
            ├── armas_completas.gsc   ← Armas DLC na caixa + parede (cajados, paralyzer, etc.)
            └── pap_melhorado.gsc     ← Pack-a-Punch com repack ilimitado e preço reduzido
```

---

## 📋 Scripts Customizados (Modo Zombies)

### 🔫 `armas_completas.gsc`
- **Caixa Misteriosa Unificada**: todas as armas de todos os mapas disponíveis desde o round 1.
- **Wonder Weapons DLC**: Jet Gun, Sliquifier, Blundergat, Acid Gat, Paralyzer, Ray Gun Mark II, One Inch Punch, Tomahawk.
- **Cajados de Origins** (Gelo, Fogo, Vento, Raio) + versões upgraded em qualquer mapa.
- **Armas na parede** com preços ajustados.

### ⚡ `pap_melhorado.gsc`
- **Repack Ilimitado**: use o Pack-a-Punch quantas vezes quiser na mesma arma.
- **Bônus por Nível**: +35% de dano, +15 balas no carregador e +100 munição reserva por upgrade.
- **Preço Reduzido**: 2.500 pontos (em vez de 5.000).

---

## 🐞 Reportar Erros ou Sugestões

Encontrou algum termo ou tradução que pode ser melhorada? Abra uma [Issue](../../issues) informando:
- O termo atual e a sugestão de correção
- Onde o texto aparece (Menu, HUD, Multiplayer, Zombies)

---

## 👤 Créditos

- **Autor:** [FelipeMzero](https://github.com/FelipeMzero)

---

*Call of Duty: Black Ops II é marca registrada da Activision/Treyarch. Este projeto é uma modificação criada pela comunidade para uso com o cliente Plutonium T6.*
