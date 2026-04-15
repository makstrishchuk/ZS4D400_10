CLASS zcl_10_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencyTP.
    agencies_upd = VALUE #( (  AgencyID = '070020' Name = 'Demo_Change Gruppe 10' ) ).

    MODIFY ENTITIES OF /dmo/i_agencyTP ENTITY /dmo/agency
         UPDATE FIELDS ( Name ) WITH agencies_upd.
    COMMIT ENTITIES.
    out->write( 'Anderungen wurden durchgefuhrt' ).


  ENDMETHOD.
ENDCLASS.
