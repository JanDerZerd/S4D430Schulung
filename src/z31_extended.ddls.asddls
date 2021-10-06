@AbapCatalog.sqlViewName: 'Z31EXTENDED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Solution: ABAP Annotations'



define view Z31_extended
  as select from z31_booking  as b
    association to Z31_Customer as _Customer on $projection.customid = _Customer.id
{
  key b.carrid,
  key b.connid,
  key b.fldate,
  key b.bookid,
      b.amount,
      b.currency,
      b.order_date,
      b.Days_ahead,
      b.agencynum,
      b.customid,
      _Customer
      

}
