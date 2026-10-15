@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSDSD'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet: {
    sizeCategory: #XS
}
define view entity ZMS_DOMAIN_HELP
  with parameters
    P_DOM_name : sxco_ad_object_name
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name : $parameters.P_DOM_name )
{

  key domain_name,
  key language,
      //      @UI.textArrangement: #TEXT_ONLY
      //      @ObjectModel.text.element: ['text']
      value_low,
      @Semantics.text: true
      text
}
