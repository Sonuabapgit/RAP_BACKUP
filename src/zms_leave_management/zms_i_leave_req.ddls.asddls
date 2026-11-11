@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'dfd'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zms_i_leave_req
  as select from zms_leave_req
  composition [ 1..* ] of ZMS_I_LEAVE_REQ_I as _ITEM
{
  key req_id        as ReqId,
      requestor     as Requestor,
      creation_date as CreationDate,
      status        as Status,
       etag            as Etag,
      _ITEM

}
