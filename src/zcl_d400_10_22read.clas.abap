CLASS zcl_d400_10_22read DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_10_22read IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    data input_keys type taBLE FOR READ IMPORT /dmo/i_agencyTP.
    DATA RESULt_keys type taBLE FOR read result /dmo/I_AgencyTP.

    input_keys = VALUE #( ( AgencyID = '070010' ) ).

    READ ENTITIES OF /dmo/i_agencytp
      ENTITY /dmo/agency
      all FIELDS   WITH input_keys
      RESULT RESULt_keys.

       out->write( result_keys ).



  ENDMETHOD.


ENDCLASS.
