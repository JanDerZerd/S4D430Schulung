@AbapCatalog.sqlViewName: 'Z31BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: ABAP Annotations'

@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4
@AbapCatalog.buffering.status: #ACTIVE

define view z31_booking_and_customer
  as select from z31_booking  as b
    inner join   Z31_Customer as c on b.customid = c.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.class,
      b.amount,
      b.currency,
      b.order_date,
      b.Days_ahead,
      b.agencynum,
      b.counter,
      b.customid,
      c.Name,
      c.street,
      c.postcode,
      c.city,
      c.country,
      c.Discount

}
