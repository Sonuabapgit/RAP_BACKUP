CLASS lhc_zms_i_leave_req DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zms_i_leave_req RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zms_i_leave_req RESULT result.
    METHODS getdefaultsforcreate FOR READ
       keys FOR FUNCTION zms_i_leave_req~getdefaultsforcreate RESULT result.

    METHODS earlynumbering_cba_item FOR NUMBERING
       entities FOR CREATE zms_i_leave_req\_item.

ENDCLASS.

CLASS lhc_zms_i_leave_req IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_cba_Item.
  ENDMETHOD.

  METHOD GetDefaultsForCreate.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      APPEND INITIAL LINE TO result ASSIGNING FIELD-SYMBOL(<res>).
      <res>-%cid = <key>-%cid.
      <res>-%param-Requestor = sy-uname.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
