CLASS zmsi_custom_code_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmsi_custom_code_class IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_zms_role_vh TYPE TABLE OF zms_role_vh.
    DELETE FROM zms_role_vh.
    COMMIT WORK.
    lt_zms_role_vh =  VALUE #( (  role = 1 text = 'Creator' )
                               (  role = 2 text = 'L1 Approver' )
                               (  role = 3 text = 'L2 Approver' ) ).

    INSERT zms_role_vh FROM TABLE @lt_zms_role_vh.
    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
