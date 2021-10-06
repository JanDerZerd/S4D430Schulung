@AbapCatalog.sqlViewName: 'Z31CUSTREV2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 11'
define view z31_customer_with_parameter

    with parameters 
    @EndUserText.label: 'Consider flights up to this date'
    P_date : abap.dats @<Environment.systemField:#SYSTEM_DATE
as select from z31_booking_and_customer as c {

key c.customid as ID,
c.Name,
c.street,
c.postcode,
c.city,
c.country, 
sum( c.amount ) as amount   @<Semantics.amount.currencyCode: 'currency',
c.currency @<Semantics.currencyCode: true,
avg(c.Days_ahead) as days_ahead
}
where c.fldate < $parameters.P_date
group by
c.customid,
c.Name,
c.street,
c.postcode,
c.city,
c.country,
c.currency

