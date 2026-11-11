@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'dsdsd'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZMS_Leave_T_HELP
  as select from ZMS_DOMAIN_HELP( P_DOM_name : 'ZDMS_LEAVE_TYPE' )
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'text' ]
  key cast( value_low as abap.int1 ) as value_low,
      @Semantics.text: true
      text
}
