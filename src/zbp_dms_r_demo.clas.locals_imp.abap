CLASS lsc_zdms_r_demo DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zdms_r_demo IMPLEMENTATION.

  METHOD save_modified.
    IF sy-subrc = 0.
    ENDIF.

    DATA(create_1) = create-zdms_r_demo[ 1 ].

    LOOP AT create-zdms_r_demo ASSIGNING FIELD-SYMBOL(<create>).

*      MODIFY ENTITY IN LOCAL MODE zdms_r_demo
*         UPDATE SET FIELDS WITH VALUE #( (  Id = create_1-Id Name = create_1-Name ) )
*         FAILED DATA(lt_failed).
*
**      <create>-Name = |{ <create>-Name && sy-uname  }|.
*
**      APPEND INITIAL LINE TO reported-zdms_r_demo ASSIGNING FIELD-SYMBOL(<modify>).
**      <modify> = CORRESPONDING #(  <create> ).
**      <modify>- = |{ <create>-Name && sy-uname  }|.
      UPDATE zms_demo SET name = @sy-uname WHERE id = @<create>-Id.
    ENDLOOP.
*    MODIFY ENTITY IN LOCAL MODE zdms_r_demo
*           CREATE SET FIELDS WITH VALUE #( (  Id = create_1-Id Name = create_1-Name ) )
*           FAILED DATA(lt_failed).

*      INSERT into zms_demo VALUES @( value zms_demo( Id = create_1-Id Name = create_1-Name ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZDMS_R_DEMO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zdms_r_demo RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zdms_r_demo RESULT result.
    METHODS earlynumbering_create FOR NUMBERING
       entities FOR CREATE zdms_r_demo.

ENDCLASS.

CLASS lhc_ZDMS_R_DEMO IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.
    SELECT FROM zms_demo
           FIELDS MAX( id ) AS sno
           INTO @DATA(lv_new_id).

    lv_new_id += 1.
    DATA(ls_ent) = entities[ 1 ].

    APPEND VALUE #( %cid =   ls_ent-%cid id =  lv_new_id   ) TO mapped-zdms_r_demo.

  ENDMETHOD.

ENDCLASS.
