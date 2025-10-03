# ------------------------------------------------------------------
# PROJETO: Análise da Influência do Grid de Largada na Fórmula 1
# AUTOR: Maria Leitão
# DATA: 03 de out. de 2025
# ------------------------------------------------------------------


# 1. CONFIGURAÇÃO DO AMBIENTE
# ---------------------------
# Instala o pacote tidyverse se ainda não estiver instalado
if (!require(tidyverse)) {
  install.packages("tidyverse")
}

# Carrega o pacote para a sessão atual
library(tidyverse)


# 2. CARREGAMENTO DOS DADOS
# -------------------------
# Define o caminho para o arquivo de dados
# O RStudio define o diretório do projeto como o diretório raiz,
# então podemos usar caminhos relativos.
caminho_dados <- "data/results.csv"

# Carrega os dados do arquivo CSV
resultados_f1 <- read.csv(caminho_dados)

# Visualiza as primeiras linhas e a estrutura do dataset
# head(resultados_f1)
# str(resultados_f1)


# 3. LIMPEZA E PREPARAÇÃO DOS DADOS
# ---------------------------------
# Seleciona apenas as colunas de interesse: grid (largada) e position (final)
dados_analise <- resultados_f1 %>%
  select(grid, position)

# A coluna 'position' pode ter valores não numéricos (ex: "\\N", "W").
# Vamos converter para numérico. Isso transformará valores não numéricos em NA (Not Available).
# `suppressWarnings` é usado para não poluir o console com avisos de conversão.
dados_analise$position <- suppressWarnings(as.numeric(dados_analise$position))

# Filtra os dados para manter apenas as linhas relevantes:
# - Remove linhas onde a posição final é NA (piloto não terminou).
# - Remove linhas onde o grid é 0 (geralmente significa largada do pit lane).
dados_limpos <- dados_analise %>%
  filter(!is.na(position), grid > 0)

# Verifica o resultado da limpeza
# head(dados_limpos)
# summary(dados_limpos)


# 4. ANÁLISE EXPLORATÓRIA DE DADOS (AED)
# --------------------------------------
# Cria um gráfico de dispersão para visualizar a relação entre grid e posição final
grafico_dispersao <- ggplot(dados_limpos, aes(x = grid, y = position)) +
  geom_point(alpha = 0.1, color = "blue") +      # Pontos com transparência para ver a densidade
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Adiciona linha de tendência linear
  labs(
    title = "Relação entre Posição de Largada e Posição Final na F1",
    subtitle = "Dados de 1950 a 2020",
    x = "Posição no Grid de Largada",
    y = "Posição Final na Corrida"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))

# Exibe o gráfico no RStudio
print(grafico_dispersao)

# Salva o gráfico na pasta 'plots'
ggsave("plots/relacao_grid_posicao.png", plot = grafico_dispersao, width = 8, height = 6)


# 5. MODELAGEM ESTATÍSTICA
# ------------------------
# A. Teste de Correlação de Pearson
correlacao <- cor(dados_limpos$grid, dados_limpos$position)
cat("--- Análise de Correlação ---\n")
cat("Coeficiente de Correlação de Pearson:", round(correlacao, 3), "\n\n")


# B. Modelo de Regressão Linear Simples
# Queremos prever 'position' (variável dependente) a partir de 'grid' (variável independente)
modelo_linear <- lm(position ~ grid, data = dados_limpos)


# 6. RESULTADOS E CONCLUSÃO
# -------------------------
# Exibe o resumo detalhado do modelo
cat("--- Resumo do Modelo de Regressão Linear ---\n")
summary(modelo_linear)

# Interpretação final com base no output do summary:
# - O p-value (Pr(>|t|)) para a variável 'grid' muito baixo (< 2e-16) indica que a relação é estatisticamente significativa.
# - O coeficiente 'grid' mostra o quanto a posição final aumenta, em média, para cada posição a mais no grid.
# - O 'Multiple R-squared' indica a porcentagem da variação da posição final que é explicada pela posição no grid.