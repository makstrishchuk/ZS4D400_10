CLASS zcl_10_compute_case DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_compute_case IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA op TYPE c LENGTH 1.
    DATA output TYPE string.
    number1 = -8.
    number2 = 3.
    op = '+'.

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY .
            result = number1 / number2.
          CATCH cx_sy_zerodivide.
            output = | Division durch Null ist nicht definiert! |.
*            Variant 2
*        catch cx_root into data(lx_root).
*        output = lx_root->get_text( ).

        ENDTRY.

        result = number1 / number2.
      WHEN OTHERS.
        output = | '{ op }' ist kein gültiger Operator! |.
    ENDCASE.

    IF output IS INITIAL.
      output = | { number1 } { op } { number2 } = { result } |.
    ENDIF.
    out->write( output ).

  ENDMETHOD.
ENDCLASS.
