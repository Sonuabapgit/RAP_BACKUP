@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CXXCX'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZMS_C_LEAVE_REQ_I
  as projection on ZMS_I_LEAVE_REQ_I
{
  key ReqId,
  key Item,
      FromDate,
      ToDate,
      LeaveHours,
      LeaveType3,
      /* Associations */
      _HDR : redirected to parent ZMS_C_LEAVE_REQ
}
