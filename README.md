# Organização de arquivos pessoais

Estrutura de pastas para organizar os arquivos do computador, separando **contas**
(por ano e mês) dos **documentos não financeiros** (por assunto).

## Estrutura

```
Meus Arquivos/
├── 00-Caixa de Entrada/        ← tudo que chega e ainda não foi organizado
├── 01-Contas/
│   ├── 2024/
│   ├── 2025/
│   └── 2026/
│       ├── 01-Janeiro/
│       ├── 02-Fevereiro/
│       ├── ...
│       └── 12-Dezembro/
├── 02-Documentos Pessoais/
│   ├── Identidade e CPF/
│   ├── CNH/
│   ├── Passaporte/
│   └── Certidoes/              ← nascimento, casamento etc.
├── 03-Saude/
│   ├── Exames/
│   ├── Receitas/
│   ├── Vacinas/
│   └── Plano de Saude/
├── 04-Casa/
│   ├── Contrato e Escritura/   ← aluguel, compra, condomínio
│   └── Manuais e Garantias/
├── 05-Trabalho/
│   ├── Contratos/
│   └── Curriculo/
├── 06-Estudos/
│   ├── Diplomas e Certificados/
│   └── Cursos/
├── 07-Veiculos/                ← documento do carro, seguro, revisões
├── 08-Viagens/
├── 09-Fotos e Memorias/
└── 99-Arquivo Morto/           ← coisas antigas que você quer guardar, mas não consulta
```

### Por que assim?

- **Números na frente** (`01-`, `02-`...): as pastas aparecem sempre na mesma ordem,
  e não em ordem alfabética.
- **Meses numerados** (`01-Janeiro`...): os meses ficam em ordem de calendário.
- **Caixa de Entrada**: um lugar só para jogar o que chega (downloads, anexos de e-mail).
  De tempos em tempos, você esvazia a caixa movendo cada arquivo para a pasta certa.
- **Conta vai para o mês em que foi paga** (ou do vencimento, se preferir). Escolha um
  critério e mantenha sempre o mesmo.

## Como nomear os arquivos

Use o padrão `AAAA-MM-DD_tipo_descricao`. Exemplos:

| Arquivo                                  | Onde fica                          |
|------------------------------------------|------------------------------------|
| `2026-09-10_conta-luz_enel.pdf`          | `01-Contas/2026/09-Setembro/`      |
| `2026-09-15_comprovante_aluguel.pdf`     | `01-Contas/2026/09-Setembro/`      |
| `2026-03-02_exame_hemograma.pdf`         | `03-Saude/Exames/`                 |
| `2025-11-20_garantia_geladeira.pdf`      | `04-Casa/Manuais e Garantias/`     |

Com a data no começo do nome, os arquivos ficam em ordem cronológica dentro de cada
pasta, e fica fácil achar qualquer coisa pela busca do computador.

## Criar as pastas no seu computador

Os scripts **só criam pastas**. Eles não movem nem apagam nenhum arquivo, e podem ser
rodados mais de uma vez sem problema (por exemplo, para acrescentar um ano novo).

Por padrão, a estrutura é criada em `Documentos/Meus Arquivos`, com os anos de 2024
até o ano atual.

### Windows

1. Baixe a pasta `scripts` deste repositório.
2. Abra o **PowerShell** dentro dessa pasta.
3. Rode:

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\criar-pastas.ps1
   ```

   Opções: `-Destino "D:\Meus Arquivos"`, `-AnoInicial 2020`, `-AnoFinal 2026`.

### macOS / Linux

```bash
bash scripts/criar-pastas.sh
# ou, com outro destino e outros anos:
bash scripts/criar-pastas.sh "$HOME/Documents/Meus Arquivos" 2020 2026
```

## Próximos passos

- [ ] Criar as pastas no computador
- [ ] Mover tudo que está espalhado (Downloads, Área de Trabalho) para a `00-Caixa de Entrada`
- [ ] Separar a caixa de entrada: contas em `01-Contas`, o resto por assunto
- [ ] Ajustar as categorias: criar ou remover pastas conforme o que aparecer
