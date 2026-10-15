@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ROLE APP CDS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMS_I_ROLE
  as select from zms_role as _ROLE
  association [1..1] to ZMS_I_VH_ROLE as _TEXT_ROLE on $projection.Role = _TEXT_ROLE.Role
{
  key userid          as Userid,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZMS_I_VH_ROLE', element: 'Role'  }}]
      @ObjectModel.text.element: ['Text']
      @UI.textArrangement: #TEXT_ONLY
  key role            as Role,
      etag            as Etag,
      active          as Active,
      @Semantics.text: true
      _TEXT_ROLE.Text as Text
}

