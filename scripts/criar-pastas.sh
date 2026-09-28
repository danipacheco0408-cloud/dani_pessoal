#!/usr/bin/env bash
# Cria a estrutura de pastas pessoais (macOS / Linux).
# Não move nem apaga nada: só cria as pastas que ainda não existem.
#
# Uso:
#   ./criar-pastas.sh                        # cria em ~/Documents/Meus Arquivos, anos 2024 a 2026
#   ./criar-pastas.sh "/caminho/destino"      # outro destino
#   ./criar-pastas.sh "/caminho/destino" 2020 2026   # outro intervalo de anos

set -euo pipefail

DESTINO="${1:-$HOME/Documents/Meus Arquivos}"
ANO_INICIAL="${2:-2024}"
ANO_FINAL="${3:-$(date +%Y)}"

MESES=(01-Janeiro 02-Fevereiro 03-Marco 04-Abril 05-Maio 06-Junho
       07-Julho 08-Agosto 09-Setembro 10-Outubro 11-Novembro 12-Dezembro)

# Contas: um ano por pasta, um mês por subpasta
for ((ano = ANO_INICIAL; ano <= ANO_FINAL; ano++)); do
  for mes in "${MESES[@]}"; do
    mkdir -p "$DESTINO/01-Contas/$ano/$mes"
  done
done

# Documentos não financeiros
PASTAS=(
  "00-Caixa de Entrada"
  "02-Documentos Pessoais/Identidade e CPF"
  "02-Documentos Pessoais/CNH"
  "02-Documentos Pessoais/Passaporte"
  "02-Documentos Pessoais/Certidoes"
  "03-Saude/Exames"
  "03-Saude/Receitas"
  "03-Saude/Vacinas"
  "03-Saude/Plano de Saude"
  "04-Casa/Contrato e Escritura"
  "04-Casa/Manuais e Garantias"
  "05-Trabalho/Contratos"
  "05-Trabalho/Curriculo"
  "06-Estudos/Diplomas e Certificados"
  "06-Estudos/Cursos"
  "07-Veiculos"
  "08-Viagens"
  "09-Fotos e Memorias"
  "99-Arquivo Morto"
)
for pasta in "${PASTAS[@]}"; do
  mkdir -p "$DESTINO/$pasta"
done

echo "Estrutura criada em: $DESTINO"
