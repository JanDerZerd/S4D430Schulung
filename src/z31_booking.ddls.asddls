@AbapCatalog.sqlViewName: 'Z31BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: ABAP Annotations'

@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4
@AbapCatalog.buffering.status: #ACTIVE

define view z31_booking as select
                 from sbook as b
                  { key b.carrid,
                    key b.connid,
                    key b.fldate,
                    key b.bookid,
                       case b.class 
                       when 'Y' then 'Economy'
                       when 'C' then 'Business' 
                       when 'F' then 'First'
                       else '???' end as class,
                        currency_conversion( 
                        amount => b.forcuram, 
                        source_currency => forcurkey, 
                        target_currency => cast('USD' as abap.cuky),
                        exchange_rate_type => 'M', 
                        exchange_rate_date => b.order_date,
                        error_handling => 'SET_TO_NULL'
                         )  as amount 
                           @<Semantics.amount.currencyCode:'CURRENCY',
                        cast('USD' as abap.cuky) as currency @<Semantics.currencyCode: true,
                        b.luggweight            @<Semantics.quantity.unitOfMeasure: 'WUNIT',
                        b.wunit                 @<Semantics.unitOfMeasure: true,         
                        b.order_date,
                        dats_days_between(b.order_date, b.fldate) as Days_ahead,
                        b.agencynum,
                        b.counter,
                        b.customid
              
                    }
                   where cancelled <> 'X' 
 