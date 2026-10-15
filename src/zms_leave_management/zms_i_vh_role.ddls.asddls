@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZMS_I_VH_ROLE
  as select from zms_role_vh
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'Text' ]
  key role as Role,
      @Semantics.text: true
      text as Text     
}
