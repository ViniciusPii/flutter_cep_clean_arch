# Solicitar o nome da pasta do usuário
$pastaNome = Read-Host "Digite o nome da pasta"

# Converter a primeira letra de cada palavra do nome da pasta para maiúscula
$nomePastaMaiusculo = ($pastaNome -split "_") | ForEach-Object { $_.Substring(0,1).ToUpper() + $_.Substring(1) }

# Juntar as partes em uma única string
$nomePastaMaiusculo = $nomePastaMaiusculo -join ""

# Caminho completo da nova pasta
$caminhoPasta = Join-Path -Path "lib\src\repositories" -ChildPath $pastaNome

# Criar a nova pasta
New-Item -Path $caminhoPasta -ItemType Directory -Force

# Template do repository_impl.dart
$repositoryImplTemplate = @"
import '${pastaNome}_repository.dart';

class ${nomePastaMaiusculo}RepositoryImpl implements ${nomePastaMaiusculo}Repository {}
"@

# Template do repository.dart
$repositoryTemplate = @"
abstract class ${nomePastaMaiusculo}Repository {}
"@

# Caminho completo para o arquivo repository_impl.dart
$caminhoRepositoryImpl = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_repository_impl.dart"

# Criar o arquivo repository_impl.dart com base no template
$repositoryImplTemplate | Set-Content -Path $caminhoRepositoryImpl

# Caminho completo para o arquivo repository.dart
$caminhoRepository = Join-Path -Path $caminhoPasta -ChildPath "${pastaNome}_repository.dart"

# Criar o arquivo repository.dart com base no template
$repositoryTemplate | Set-Content -Path $caminhoRepository