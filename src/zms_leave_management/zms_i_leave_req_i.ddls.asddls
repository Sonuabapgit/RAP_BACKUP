@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSD'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMS_I_LEAVE_REQ_I 
  as select from zms_lee_req_i 
  association to parent zms_i_leave_req as _HDR on _HDR.ReqId = $projection.ReqId
{
  key req_id       as ReqId,
  key item         as Item,
      from_date    as FromDate,
      to_date      as ToDate,
      leave_hours  as LeaveHours,
      leave_type_3 as LeaveType3,
      _HDR
}
