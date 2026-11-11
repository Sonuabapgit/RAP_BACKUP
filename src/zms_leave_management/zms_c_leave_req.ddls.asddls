@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMS_C_LEAVE_REQ
  provider contract transactional_query
  as projection on zms_i_leave_req
{
  key ReqId,
      Requestor,
      CreationDate,
      Status,
      /* Associations */
      _ITEM : redirected to composition child ZMS_C_LEAVE_REQ_I
}
