@AbapCatalog.sqlViewName: 'ZV10CTVH'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country value help'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_CS10_COUNTRYVH
  as select from zcs10_postcity
{
  key country as Country
}
