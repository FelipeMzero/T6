# Call of Duty: Black Ops II - Tradução Completa PT-BR (Plutonium T6)

## 📌 Visão Geral

Este repositório contém a tradução completa em **Português Brasileiro** para Call of Duty: Black Ops II no cliente **Plutonium T6**.

O Plutonium carrega os arquivos nativamente a partir da pasta **`raw`**, garantindo que a tradução seja aplicada **automaticamente ao abrir o jogo**, sem precisar ativar nenhum mod no menu de Mods.

---

## 🎮 Como Instalar

### 1. Obtenha os arquivos
Faça o download do repositório ou clone usando Git:
```bash
git clone https://github.com/FelipeMzero/T6.git
```

### 2. Copie a pasta `raw`
Copie a pasta **`raw`** para o seguinte caminho no seu computador:
```
%localappdata%\Plutonium\storage\t6\
```

*(Você pode pressionar `Win + R`, colar a linha acima e apertar Enter).*

### 3. Inicie o jogo
Abra o Plutonium T6 (Zombies ou Multiplayer). O jogo iniciará **100% traduzido**!

---

## 📂 Estrutura do Repositório e Carregamento

O jogo carrega todos os arquivos nativamente da pasta **`raw`**:

```
%localappdata%\Plutonium\storage\t6\
└── raw/                           # Pasta carregada nativamente pelo Plutonium
    ├── localizedstrings/          # 84 arquivos .str com a tradução completa PT-BR
    │   ├── en_code_post_gfx_mp.str
    │   ├── sp_code_post_gfx_mp.str
    │   └── ... (demais arquivos .str)
    └── scripts/                   # Scripts customizados (Zombies)
        └── zm/
            ├── armas_completas.gsc
            └── pap_melhorado.gsc
```

---

## ⚙️ Conteúdo da Pasta `raw`

### 💬 `raw/localizedstrings/`
Contém 84 arquivos `.str` de tradução abrangendo:
- **Zombies Mode** (Todos os mapas)
- **Multiplayer Mode** (Interface, mapas, armas e marcadores)
- **Campanha** (Missões e legendas)
- **Interface e Menus** (Placar, Vantagens, Anexos, Séries de Pontuação, Configurações)

### 📜 `raw/scripts/`
Scripts adicionais opcionais para o modo Zombies:
- `armas_completas.gsc`: Libera wonder weapons DLC, cajados de Origins e armas unificadas na caixa misteriosa.
- `pap_melhorado.gsc`: Permite repack ilimitado e reduz o preço do Pack-a-Punch para 2.500 pontos.

---

## 👤 Créditos e Contribuição

- **Autor:** [FelipeMzero](https://github.com/FelipeMzero)
- Para sugestões ou relatar correções de termos, abra uma [Issue](https://github.com/FelipeMzero/T6/issues).
