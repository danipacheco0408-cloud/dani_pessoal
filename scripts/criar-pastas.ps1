# Cria a estrutura de pastas pessoais (Windows / PowerShell).
# Não move nem apaga nada: só cria as pastas que ainda não existem.
#
# Uso (no PowerShell, dentro da pasta scripts):
#   .\criar-pastas.ps1
#   .\criar-pastas.ps1 -Destino "D:\Meus Arquivos"
#   .\criar-pastas.ps1 -AnoInicial 2020 -AnoFinal 2026

param(
    [string]$Destino = (Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Meus Arquivos'),
    [int]$AnoInicial = 2024,
    [int]$AnoFinal = (Get-Date).Year
)

$meses = @('01-Janeiro', '02-Fevereiro', '03-Marco', '04-Abril', '05-Maio', '06-Junho',
           '07-Julho', '08-Agosto', '09-Setembro', '10-Outubro', '11-Novembro', '12-Dezembro')

# Contas: um ano por pasta, um mês por subpasta
foreach ($ano in $AnoInicial..$AnoFinal) {
    foreach ($mes in $meses) {
        New-Item -ItemType Directory -Force -Path (Join-Path $Destino "01-Contas\$ano\$mes") | Out-Null
    }
}

# Documentos não financeiros
$pastas = @(
    '00-Caixa de Entrada',
    '02-Documentos Pessoais\Identidade e CPF',
    '02-Documentos Pessoais\CNH',
    '02-Documentos Pessoais\Passaporte',
    '02-Documentos Pessoais\Certidoes',
    '03-Saude\Exames',
    '03-Saude\Receitas',
    '03-Saude\Vacinas',
    '03-Saude\Plano de Saude',
    '04-Casa\Contrato e Escritura',
    '04-Casa\Manuais e Garantias',
    '05-Trabalho\Contratos',
    '05-Trabalho\Curriculo',
    '06-Estudos\Diplomas e Certificados',
    '06-Estudos\Cursos',
    '07-Veiculos',
    '08-Viagens',
    '09-Fotos e Memorias',
    '99-Arquivo Morto'
)
foreach ($pasta in $pastas) {
    New-Item -ItemType Directory -Force -Path (Join-Path $Destino $pasta) | Out-Null
}

Write-Host "Estrutura criada em: $Destino"
