CLASS lcl_house DEFINITION.

  PUBLIC SECTION.
    DATA mv_id TYPE i.
    DATA mv_color TYPE string.
    METHODS set_data IMPORTING iv_id    TYPE i
                               iv_color TYPE string.

    METHODS get_data EXPORTING ev_id    TYPE i
                               ev_color TYPE string.

    CLASS-DATA gv_house_counter TYPE i.
    METHODS compute IMPORTING iv_number1       TYPE i
                              iv_number2       TYPE i
                    RETURNING VALUE(rv_result) TYPE i.




  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_house IMPLEMENTATION.

  METHOD set_data.
    mv_id = iv_id.
    mv_color = iv_color.
    gv_house_counter = gv_house_counter + 1.
  ENDMETHOD.

  METHOD get_data.
    ev_id = mv_id.
    ev_color = mv_color.
  ENDMETHOD.

  METHOD compute.
    rv_result = iv_number1 + iv_number2 + mv_id.
  ENDMETHOD.

ENDCLASS.
