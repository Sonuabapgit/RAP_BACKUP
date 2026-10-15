@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSFDF'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZDMS_R_DEMO
  as select from zms_demo
{
  key id   as Id,
      name as Name
}
