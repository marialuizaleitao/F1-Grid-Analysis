# Análise da Relação entre Posição de Largada e Resultado Final na Fórmula 1

![F1 Banner](https://www.formula1.com/etc/designs/fom-website/images/f1_logo.svg)

## 📝 Descrição do Projeto

Este projeto de análise de dados utiliza a linguagem R e o ambiente RStudio para investigar uma questão fundamental no automobilismo: **Qual a real influência da posição de largada (grid) na posição final de uma corrida de Fórmula 1?**

Através de um ciclo completo de análise — da coleta e limpeza dos dados à modelagem estatística e visualização — o objetivo é quantificar essa relação e validar a hipótese de que largar na frente é um fator determinante para o sucesso.

## 🎯 Objetivos

* Realizar a limpeza e preparação de um dataset real de resultados da F1.
* Conduzir uma Análise Exploratória de Dados (AED) para visualizar a relação entre as variáveis.
* Calcular a correlação entre a posição de largada e a posição final.
* Construir e interpretar um modelo de regressão linear simples para prever o resultado da corrida com base no grid.
* Comunicar os resultados de forma clara e objetiva.

## 💾 Fonte de Dados

O dataset utilizado neste projeto foi obtido do Kaggle e contém resultados de corridas da Fórmula 1 de 1950 a 2020. O arquivo principal para esta análise é o `results.csv`.

* **Link para o Dataset:** [Formula 1 World Championship (1950 - 2020) no Kaggle](https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020)

## 🛠️ Tecnologias e Pacotes Utilizados

* **Linguagem:** R
* **Ambiente:** RStudio
* **Pacotes Principais:**
    * `tidyverse`: Um ecossistema de pacotes para ciência de dados em R, incluindo:
        * `dplyr`: Para manipulação e limpeza de dados.
        * `ggplot2`: Para criação de visualizações de alta qualidade.

## 📂 Estrutura do Projeto

O repositório está organizado da seguinte forma:

```
.
├── data/
│   └── results.csv       # Dataset de resultados
├── plots/
│   └── relacao_grid_posicao.png # Gráfico gerado pela análise
├── scripts/
│   └── analise_f1.R      # Script R com todo o código da análise
└── README.md             # Documentação do projeto
```

## 🚀 Como Executar o Projeto

1.  **Clone este repositório:**
    ```bash
    git clone [https://github.com/marialuizaleitao/F1-Grid-Analysis.git](https://github.com/marialuizaleitao/F1-Grid-Analysis.git)
    cd F1-Grid-Analysis
    ```

2.  **Baixe os dados:**
    * Faça o download do dataset a partir do [link do Kaggle](https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020).
    * Descompacte o arquivo e mova o `results.csv` para a pasta `data/`.

3.  **Instale as dependências:**
    * Abra o RStudio e execute o seguinte comando no console:
    ```r
    install.packages("tidyverse")
    ```

4.  **Execute a análise:**
    * Abra o arquivo `scripts/analise_f1.R` no RStudio.
    * Execute o script linha por linha ou clique em "Source" para rodar o arquivo por completo. O gráfico gerado será salvo automaticamente na pasta `plots/`.

## 📊 Resumo das Etapas da Análise

O script `analise_f1.R` segue as seguintes etapas:

1.  **Configuração:** Carregamento do pacote `tidyverse`.
2.  **Carregamento de Dados:** Leitura do arquivo `results.csv`.
3.  **Limpeza e Preparação:** Seleção das colunas `grid` e `position`, conversão para o tipo numérico e remoção de dados inválidos (e.g., pilotos que não completaram a prova).
4.  **Análise Exploratória de Dados (AED):** Criação de um gráfico de dispersão (`scatterplot`) com uma linha de tendência para visualizar a relação entre as variáveis.
5.  **Modelagem Estatística:**
    * **Teste de Correlação:** Cálculo do coeficiente de correlação de Pearson.
    * **Regressão Linear Simples:** Construção de um modelo (`lm`) para prever a posição final com base no grid.
6.  **Resultados e Conclusão:** Exibição do resumo do modelo e interpretação dos resultados estatísticos (`R-squared`, `p-value` e coeficientes).

## 📈 Resultados Principais

A análise confirma a existência de uma **correlação positiva, forte e estatisticamente significativa** entre a posição de largada e a posição final. O modelo de regressão linear indica que a posição no grid é um preditor relevante para o resultado da corrida, explicando uma porção considerável da variabilidade nos resultados.

Isso valida empiricamente a importância de uma boa qualificação no sábado para o sucesso no domingo na Fórmula 1.
