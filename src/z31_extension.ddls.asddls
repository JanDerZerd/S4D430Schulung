@AbapCatalog.sqlViewAppendName: 'Z31EXTENSION'
@EndUserText.label: 'Excersise 14'
extend view Z31_extended with z31_extension
  association[1] to spfli as _connection on  b.carrid = _connection.carrid
                                          and b.connid = _connection.connid
{
  b.class,
  b.counter,
  _connection
}
