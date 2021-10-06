@AbapCatalog.sqlViewName: 'Z31SIMPLE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 3'
define view z31_Simple
  as select from sbook
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
  key bookid     as Bookid,
      class      as Class,
      forcuram   as Forcuram,
      forcurkey  as Forcurkey,
      luggweight as Luggweight,
      wunit      as Wunit,
      order_date as OrderDate,
      agencynum  as Agencynum,
      counter    as Counter,
      customid   as Customid
}
