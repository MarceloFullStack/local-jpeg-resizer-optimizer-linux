## Redimensionador e Otimizador de Imagens JPEG
Este script processa imagens JPEG na pasta atual, redimensionando-as proporcionalmente caso excedam o tamanho máximo definido, adiciona uma marca d'água, ajusta níveis de cor e contraste e aplica um filtro de nitidez.

# Requisitos
Sistema operacional linux
# Uso
Clone este repositório ou baixe o script redimensionar.sh.
Dê permissão de execução ao script com o comando chmod +x redimensionar.sh.
Coloque o script na pasta onde estão as imagens JPEG que deseja processar.
Execute o script com ./redimensionar.sh.
As imagens processadas serão salvas na pasta low dentro do diretório atual.

# Personalização
Você pode personalizar o tamanho máximo da imagem e a marca d'água alterando os valores das variáveis no script.

# bash
```shell
# Definir o tamanho máximo da imagem (em pixels)
max_size=1000

# Adicionar a marca d'água com o texto "@marceloguimaraesfotos"
convert "low/$file" -pointsize 24 -fill white -gravity south -annotate +0+10 "@marceloguimaraesfotos" "low/$file"
```
Altere o valor de max_size para o tamanho máximo desejado e modifique o texto da marca d'água conforme necessário.
