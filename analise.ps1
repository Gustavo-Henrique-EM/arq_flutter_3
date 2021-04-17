Write-Output "Realizando analise do codigo"
& flutter analyze
& dart analyze
Write-Host ""

Write-Output "Realizando testes"
& flutter test
Write-Host ""

Write-Output "Formatacoes a serem feitas:"
& flutter format -n lib
Write-Host ""

# Write-Output "Formatando código"
# & flutter format lib
# Write-Host ""

# Write-Output "Realizando build"
# & flutter build apk
# Write-Host ""

Write-Host "Analise finalizada" -ForegroundColor DarkCyan

Write-Host "Tecle [ENTER] para continuar" -ForegroundColor Green
Read-Host