#!/bin/bash

# Verificar se o ImageMagick está instalado
if ! command -v convert &> /dev/null
then
    echo "ImageMagick não está instalado. Instalando agora..."
    sudo apt-get install -y imagemagick
fi

# Definir o tamanho máximo da imagem (em pixels)
max_size=1000

# Criar a pasta "low" se ela não existir
mkdir -p low

# Contar o total de arquivos JPEG
total_files=$(find . -maxdepth 1 -iname "*.jpg" | wc -l)

# Inicializar a contagem de arquivos processados
processed_files=0

# Loop pelos arquivos JPEG na pasta atual (insensível à caixa)
find . -maxdepth 1 -iname "*.jpg" | while read file
do
  # Incrementar a contagem de arquivos processados
  processed_files=$((processed_files + 1))

  # Exibir o progresso atual
  echo "Processando imagem $processed_files de $total_files: $file"

  # Obter as dimensões da imagem
  width=$(identify -format "%w" "$file")
  height=$(identify -format "%h" "$file")

  # Se a imagem for maior que o tamanho máximo, redimensioná-la proporcionalmente
  if [[ $width -gt $max_size || $height -gt $max_size ]]
  then
    convert "$file" -resize "${max_size}x${max_size}>" "low/$file"
  else
    cp "$file" "low/$file"
  fi

  # Adicionar a marca d'água com o texto "@marceloguimaraesfotos"
  convert "low/$file" -pointsize 24 -fill white -gravity south -annotate +0+10 "@marceloguimaraesfotos" "low/$file"

  # Ajustar automaticamente os níveis de cor e contraste e aplicar um filtro de nitidez
  convert "low/$file" -auto-level -unsharp 0x0.75+0.75+0.008 "low/$file"
done
