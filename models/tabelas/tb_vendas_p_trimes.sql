-- definindo as variáveis meses e ano
{% set meses = ('JAN','FEB','MAR') %}
{% set ano = 2008 %}

-- criando uma fonte com os dados de 'date' e converte o nomes das colunas
with source_data as (
    SELECT dateid as id_data,
           month as mes,
           year as ano
    FROM date 
),

-- criando uma fonte de dados unindo a tabela 'sales' com a 'date'
sales_date as (
    SELECT source_data.mes,
           sum(qtdade_vendida)
    FROM {{ ref('vw_sales') }} sales INNER JOIN source_data
    ON sales.id_data = source_data.id_data
    WHERE source_data.mes in {{meses}}
    AND source_data.ano = '{{ano}}'
    GROUP BY source_data.mes
)

SELECT * FROM sales_date