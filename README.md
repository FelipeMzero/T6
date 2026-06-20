# T6 - Tradução PT-BR + Scripts Custom para Call of Duty: Black Ops II

Mod de tradução completa em Português Brasileiro + scripts custom (armas completas, Pack-a-Punch melhorado) para Call of Duty: Black Ops II via Plutonium.

**Versão:** 2.4

## O que está traduzido

- Modo **Zombies** — Transit, Buried, Die Rise, Nuketown, Prison, Tomb, Highrise
- Modo **Multiplayer** — 30+ mapas
- **Campanha** — múltiplas missões
- **Menus** — completamente em Português
- **45.000+ strings** traduzidas

## Instalação

1. Baixe este repositório (botão **Code → Download ZIP**) ou clone:
   ```
   git clone https://github.com/FelipeMzero/T6.git
   ```

2. Copie a pasta `mods\t6_ptbr_completo` para dentro da pasta do Plutonium:
   ```
   %localappdata%\Plutonium\storage\t6\mods\
   ```
   A estrutura final deve ficar assim:
   ```
   %localappdata%\Plutonium\storage\t6\mods\t6_ptbr_completo\
   ```

3. A pasta `AppData` fica oculta — ative **Exibir itens ocultos** no Explorador de Arquivos se necessário.

## Como Usar

1. Abra o **Plutonium T6** (Zombies ou Multiplayer)
2. No menu principal, clique em **Mods**
3. Selecione **t6_ptbr_completo**
4. Clique em **Load** — o jogo reinicia automaticamente
5. Pronto! O jogo estará em Português Brasileiro

## Estrutura do Repositório

```
mods/
└── t6_ptbr_completo/
    ├── mod.json              ← identificação do mod
    ├── mod.all.sabl          ← strings compiladas (arquivo principal)
    ├── localizedstrings/     ← 84 arquivos .str com todas as traduções
    └── scripts/
        └── zm/
            ├── armas_completas.gsc   ← TODAS as armas DLC na caixa + parede (cajados, paralyzer, etc.)
            ├── pap_melhorado.gsc     ← Pack-a-Punch com repack ilimitado e preço reduzido
            └── ... (demais scripts)
raw/
└── scripts/
    └── zm/
        ├── armas_completas.gsc   ← mesma versão para usar SEM o mod
        └── pap_melhorado.gsc     ← mesma versão para usar SEM o mod
```

## 📋 Scripts Custom (armas_completas.gsc + pap_melhorado.gsc)

### armas_completas.gsc
- **Caixa Misteriosa unificada** — todas as armas de todas as fases disponíveis desde o round 1
- **Todas as Wonder Weapons DLC**: Jet Gun, Sliquifier, Blundergat, Acid Gat, Paralyzer, Ray Gun Mark II, One Inch Punch, Tomahawk
- **Cajados de Origins** (Gelo, Fogo, Vento, Raio) + versões upgraded em qualquer mapa
- **Novas armas na parede** com preços personalizados

### pap_melhorado.gsc
- **Repack Ilimitado** — use o Pack-a-Punch quantas vezes quiser na mesma arma
- Cada nível: +35% dano, +15 balas no carregador, +100 munição total
- **Preço reduzido**: 2500 ao invés de 5000
- Todas as armas funcionam no PaP (incluindo wonder weapons)

## ⚠️ Atenção: Preciso das Pastas `mods` e `raw`

Os scripts funcionam de **duas formas**:

### 1️⃣ Usando o Mod (recomendado)
Copie a pasta `mods\t6_ptbr_completo` para:
```
%localappdata%\Plutonium\storage\t6\mods\
```
Carregue o mod "t6_ptbr_completo" na tela de Mods do Plutonium.

### 2️⃣ Sem o Mod (raw)
Copie o conteúdo de `raw\scripts\` para:
```
%localappdata%\Plutonium\storage\t6\raw\scripts\
```
Isso faz os scripts carregarem automaticamente sem precisar ativar o mod.

**Você PRECISA de AMBAS as pastas se quiser usar o mod + scripts juntos.**

## Observações

- Ao selecionar o mod o jogo irá reiniciar — isso é normal.
- Para desativar a tradução, basta não carregar o mod na tela de Mods.
- Compatível com a versão mais recente do Plutonium T6.

## Reportar Erros de Tradução

Encontrou alguma tradução incorreta? Abra uma [Issue](../../issues) com:
- Texto incorreto encontrado
- Texto correto sugerido
- Onde aparece (menu, gameplay, mapa)

## Créditos

- **Autor:** FelipeMzero
- **Tradução:** Google Translate API com ajustes manuais

---

**Call of Duty: Black Ops II** é uma marca registrada da Activision. Este projeto não é afiliado, endossado ou patrocinado pela Activision ou Treyarch.
