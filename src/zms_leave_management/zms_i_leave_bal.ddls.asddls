@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DSFD'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZMS_I_LEAVE_BAL
  as select from    zms_leave_bal                                    as _leave_bal
    left outer join ZMS_DOMAIN_HELP( P_DOM_name: 'ZDMS_LEAVE_TYPE' ) as _Text1 on  _Text1.domain_name = 'ZDMS_LEAVE_TYPE'
                                                                               and _Text1.language    = $session.system_language
                                                                               and _Text1.value_low   = cast(
      _leave_bal.leave_type_1                                        as abap.char(
                                               10
                                             )
    )
    left outer join ZMS_DOMAIN_HELP( P_DOM_name: 'ZDMS_LEAVE_TYPE' ) as _Text2 on  _Text2.domain_name = 'ZDMS_LEAVE_TYPE'
                                                                               and _Text2.language    = $session.system_language
                                                                               and _Text2.value_low   = cast(
      _leave_bal.leave_type_2                                        as abap.char(
                                               10
                                             )
    )
    left outer join ZMS_DOMAIN_HELP( P_DOM_name: 'ZDMS_LEAVE_TYPE' ) as _Text3 on  _Text3.domain_name = 'ZDMS_LEAVE_TYPE'
                                                                               and _Text3.language    = $session.system_language
                                                                               and _Text3.value_low   = cast(
      _leave_bal.leave_type_3                                        as abap.char( 10  )
    )
{
  key _leave_bal.requestor       as Requestor,
      @ObjectModel.text.element: [ 'LeaveType1Text' ]
      @UI.textArrangement: #TEXT_ONLY
      _leave_bal.leave_type_1    as LeaveType1,
      _leave_bal.leave_balance_1 as LeaveBalance1,
      @ObjectModel.text.element: [ 'LeaveType2Text' ]
      @UI.textArrangement: #TEXT_ONLY
      _leave_bal.leave_type_2    as LeaveType2,
      _leave_bal.leave_balance_2 as LeaveBalance2,
      @ObjectModel.text.element: [ 'LeaveType3Text' ]
      @UI.textArrangement: #TEXT_ONLY
      _leave_bal.leave_type_3    as LeaveType3,
      _leave_bal.leave_balance_3 as LeaveBalance3,
      @Semantics.text: true
      _Text1.text                as LeaveType1Text,
      @Semantics.text: true
      _Text2.text                as LeaveType2Text,
      @Semantics.text: true
      _Text3.text                as LeaveType3Text,
      _leave_bal.etag            as Etag
}
