CLASS lhc_ZMS_I_LEAVE_BAL DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zms_i_leave_bal RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zms_i_leave_bal RESULT result.
    METHODS getdefaultsforcreate FOR READ
       keys FOR FUNCTION zms_i_leave_bal~getdefaultsforcreate RESULT result.

ENDCLASS.

CLASS lhc_ZMS_I_LEAVE_BAL IMPLEMENTATION.

  METHOD get_instance_authorizations.
    ASSIGN keys[ 1 ] TO FIELD-SYMBOL(<key>).
    IF <key> IS ASSIGNED.
      SELECT SINGLE FROM zms_role
             FIELDS @abap_true
             WHERE userid = @<key>-Requestor AND role = 4 AND active = @abap_true
             INTO @DATA(lv_rec).
      IF lv_rec = abap_true.
        APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<fs_res>).
        <fs_res>-%key-Requestor = <key>-Requestor.
        <fs_res>-%action-Edit   = if_abap_behv=>auth-allowed.
      ELSE.
        APPEND INITIAL LINE TO result ASSIGNING <fs_res>.
        <fs_res>-%key-Requestor = <key>-Requestor.
        <fs_res>-%action-Edit   = if_abap_behv=>auth-unauthorized.
      ENDIF.


    ENDIF.
    IF sy-subrc = 0.
    ENDIF.
  ENDMETHOD.

  METHOD get_global_authorizations.

    result-%create = if_abap_behv=>auth-unauthorized.
  ENDMETHOD.

  METHOD GetDefaultsForCreate.
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<rec>).
      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<result>).
      <result>-%cid = <rec>-%cid.
      <result>-%param-LeaveType1 = 1.
      <result>-%param-LeaveType2 = 2.
      <result>-%param-LeaveType3 = 3.
      <result>-%param-LeaveBalance1 = 40..
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
