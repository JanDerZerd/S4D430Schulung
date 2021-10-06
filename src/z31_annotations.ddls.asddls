@AbapCatalog.sqlViewName: 'Z31ANNO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Excersise 5'

@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #GENERIC
@AbapCatalog.buffering.numberOfKeyFields: 4


define view z31_annotations
  as select from sbook   as b
    inner join   scustom as c on b.customid = c.id
{
  key carrid                                as CarrierId,
  key b.connid                              as ConnectionId,
  key b.fldate                              as Flightdate,
  key b.bookid                              as BookingId,
      b.class                               as Class,
      @Semantics.amount.currencyCode:'CUrrency'
      b.forcuram                            as Amount,
      @Semantics.currencyCode: true
      b.forcurkey                           as Currency,
      @Semantics.quantity.unitOfMeasure:'LuggageWeightUnit'
      b.luggweight                          as LuggageWeight,
      @Semantics.unitOfMeasure: true
      b.wunit                               as LuggageWeightUnit,
      b.order_date                          as OrderDate,
      b.agencynum                           as AgencyNumber,
      b.counter                             as Counter,
      b.customid                            as Customid,
      c.name                                as Name,
      c.street                              as Street,
      c.postcode                            as PLZ,
      c.city                                as City,
      c.country                             as Country,
      10000                                 as Zahl,
      'DarthVader'                          as DarkLord,
      1.5                                   as Kommazahl,
      #s_class.'Y'                          as Y1,
      2.5 * 5.0                             as Multiplikation,
      fltp_to_dec( 5.25 as abap.dec(2, 1) ) as FloatingPoint,
      cast( 500 as abap.int4 )              as Integer4,
      case ( c.country )
      when 'DE' then 'X' else '' end        as Germany, //wie case in ABAP
      case when c.city = 'Freiburg' and country = 'DE'
      then 'Very good'
      when c.country = 'DE'
      then 'Good'
      when c.country = 'FR' and c.city <> 'Paris'
      then 'Very bad'
      when c.country = 'FR' and c.city = 'Paris'
      then 'Beautiful'
      else 'Bad' end                        as GoodCity //wie if in ABAP



}
where
  cancelled <> 'X' 
