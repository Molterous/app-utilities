/// All supported date format used in app.
enum SupportedDateFormat {
  eeDdMmmmYyyy("EE dd MMMM yyyy"),
  ddMmYyyyHHmm("dd MMMM yyyy | hh:mm a"),
  yyyyMMddHHMMss("yyyy-MM-dd HH:mm:ss"),
  ddMmmmYyyy("dd MMMM yyyy"),
  ddMmYyyy("dd/MM/yyyy"),
  ddMmmYyyy("dd MMM yyyy"),
  ddMmmYyyy1("dd MMM, yyyy"),
  mmmYyyy('MMM yyyy'),
  yyyyMMDD('yyyy-MM-dd'),
  yyyy("yyyy"),
  hhma("hh:mm a");


  final String value;
  const SupportedDateFormat(this.value);
}

/// All supported message type can be shown in app.
enum MessageType {
  success,
  error,
  warning
}