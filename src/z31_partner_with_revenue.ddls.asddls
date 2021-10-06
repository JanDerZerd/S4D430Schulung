@AbapCatalog.sqlViewName: 'Z31PARTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 10'
define view z31_partner_with_revenue
  as select from z31_customer_with_revenue as c
{
  key c.ID,
      'C' as type,
      c.Name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      c.amount,
      c.currency,
      c.days_ahead
}
union select from S4d430_Agency_With_Revenue as c
{

  key c.id,
      'A' as type,
      c.name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      c.amount,
      c.currency,
      c.days_ahead

}
