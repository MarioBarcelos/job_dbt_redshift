with source_sales as (
    select *
    from sales 

),

renamed as (
    select
        SALESID AS ID_VENDA,
        LISTID AS ID_LISTA,
        SELLERID AS ID_VENDENDOR,
        BUYERID AS ID_COMPRADOR,
        EVENTID AS ID_EVENTO,
        DATEID AS ID_DATA,
        QTYSOLD AS QTDADE_VENDIDA,
        PRICEPAID AS VALOR_PAGO,
        COMMISSION AS COMISSAO, 
        TO_CHAR(saletime, 'dd/mm/yyyy HH24:MI:SS') AS DATA_HORA_VENDA,
        TO_CHAR(saletime, 'HH24:MI:SS') AS HORA_VENDA,
        cast(saletime as date) AS DATA_VENDA

    FROM source_sales
)

select * from renamed