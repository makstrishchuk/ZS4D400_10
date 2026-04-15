@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZCS10_CUSTOMERS'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_CS10_CUSTOMERS
  provider contract transactional_query
  as projection on ZR_CS10_CUSTOMERS
  association [1..1] to ZR_CS10_CUSTOMERS as _BaseEntity on $projection.Customerid = _BaseEntity.Customerid
{
  key Customerid,
  Salutation,
  FirstName,
  LastName,
  Street,
  City,
  @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_CS10_COUNTRYVH', element: 'Country' } } ]
  Country,
  @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_CS10_POSTCODEVH', element: 'Postcode' } } ]
  Postcode,
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.lastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
