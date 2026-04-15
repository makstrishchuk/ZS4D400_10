@AbapCatalog.sqlViewName: 'ZV10PSTVH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Postcode value help'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_CS10_POSTCODEVH
  as select from zcs10_postcity
{
  key postcode as Postcode,
      country  as Country,
      city     as City
}
