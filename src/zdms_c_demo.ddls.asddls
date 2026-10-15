@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSDSD'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZDMS_C_DEMO
  provider contract transactional_query
  as projection on ZDMS_R_DEMO
{
  key Id,
      Name
}
