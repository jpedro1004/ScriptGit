@echo off
setlocal

rem Configuração: Nome da organização e lista de sistemas
set "organizacao=NOME DA SUA ORGANIZAÇÃO"
set "diretorios="NOME" "DOS" "DIRETORIOS" "SEPARADOS" "POR" "ASPAS""

for %%s in (%diretorios%) do (
    if exist "%%s" (
        echo 📢 Criando repositório %%s no GitHub...
        
        rem Criar repositório automaticamente no GitHub (privado)
        gh repo create %organizacao%/%%s --private --confirm
        
        cd %%s
        echo 📢 Inicializando Git e enviando para o GitHub...

        git init
        git add .
        git commit -m "Primeiro commit automático"
        git branch -M main

        rem Adiciona repositório remoto e faz o push
        git remote add origin https://github.com/%organizacao%/%%s.git
        git push -u origin main

        cd ..
    ) else (
        echo ⚠️ Diretório %%s não encontrado! Pulando...
    )
)

echo ✅ Todos os sistemas foram enviados para o GitHub!
pause
