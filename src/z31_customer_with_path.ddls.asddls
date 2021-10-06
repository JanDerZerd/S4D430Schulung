@AbapCatalog.sqlViewName: 'Z31CUSTASSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 11'
define view Z31_customer_with_path

    with parameters 
    @EndUserText.label: 'Consider flights up to this date'
    P_date : abap.dats @<Environment.systemField:#SYSTEM_DATE
as select from Z31_association as c {

key c.customid as ID,
c._Customer.Name,
c._Customer.street,
c._Customer.postcode,
c._Customer.city,
c._Customer.country, 
sum( c.amount ) as amount   @<Semantics.amount.currencyCode: 'currency',
c.currency @<Semantics.currencyCode: true,
avg(c.Days_ahead) as days_ahead
}
where c.fldate < $parameters.P_date
group by
c.customid,
c._Customer.Name,
c._Customer.street,
c._Customer.postcode,
c._Customer.city,
c._Customer.country,
c.currency

