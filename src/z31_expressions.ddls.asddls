@AbapCatalog.sqlViewName: 'Z31EXPR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: ABAP Annotations'

@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4
@AbapCatalog.buffering.status: #ACTIVE

define view z31_expressions as select
                 from sbook as b inner join scustom as c 
                                         on b.customid = c.id
                  { key b.carrid,
                    key b.connid,
                    key b.fldate,
                    key b.bookid,
                       case b.class 
                       when 'Y' then 'Economy'
                       when 'C' then 'Business' 
                       when 'F' then 'First'
                       else '???' end as class,
                        b.forcuram  as amount   @<Semantics.amount.currencyCode:'CURRENCY',
                        b.forcurkey as currency @<Semantics.currencyCode: true,
                        b.luggweight            @<Semantics.quantity.unitOfMeasure: 'WUNIT',
                        b.wunit                 @<Semantics.unitOfMeasure: true,         
                        b.order_date,
                        b.agencynum,
                        b.counter,
                        b.customid, 
                        c.name,
                        c.street,
                        c.postcode,
                        c.city,
                        c.country,
                        @EndUserText.label: 'Discount Factor'
                        @EndUserText.quickInfo: 'Customer Specific Discount Factor'
                       cast(c.discount as abap.fltp)/ 100.0  as Discount
                    }
                   where cancelled <> 'X' 
 