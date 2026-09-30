@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'NEW CDS THEY SAY'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZMSI_CDS_1
  as select from /dmo/a_book_cd
{
  key booking_uuid  as BookingUuid,
      parent_uuid   as ParentUuid,
      booking_id    as BookingId,
      booking_date  as BookingDate,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode
}
