@AbapCatalog.sqlViewName: 'Z31JOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 4'
define view z31_join_and_selection
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{
  key carrid       as CarrierId,
  key b.connid     as ConnectionId,
  key b.fldate     as Flightdate,
  key b.bookid     as BookingId,
      b.class      as Class,
      b.forcuram   as Amount,
      b.forcurkey  as Currency,
      b.luggweight as LuggageWeight,
      b.wunit      as LuggageWeightUnit,
      b.order_date as OrderDate,
      b.agencynum  as AgencyNumber,
      b.counter    as Counter,
      b.customid   as Customid,
      c.name       as Name,
      c.street     as Street,
      c.postcode   as PLZ,
      c.city       as City,
      c.country    as Country
}
where
  cancelled <> 'X'
