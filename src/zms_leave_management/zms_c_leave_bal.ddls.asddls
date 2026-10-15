@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSDS'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZMS_C_LEAVE_BAL
  provider contract transactional_query
  as projection on ZMS_I_LEAVE_BAL
{
  key Requestor,
      @ObjectModel.text.element: [ 'LeaveType1Text' ]
      @UI.textArrangement: #TEXT_ONLY
      LeaveType1,
      LeaveBalance1,
      @ObjectModel.text.element: [ 'LeaveType2Text' ]
      @UI.textArrangement: #TEXT_ONLY
      LeaveType2,
      LeaveBalance2,
      @ObjectModel.text.element: [ 'LeaveType3Text' ]
      @UI.textArrangement: #TEXT_ONLY
      LeaveType3,
      LeaveBalance3,
      @Semantics.text: true
      LeaveType1Text,
      @Semantics.text: true
      LeaveType2Text,
      @Semantics.text: true
      LeaveType3Text,
      Etag
}
