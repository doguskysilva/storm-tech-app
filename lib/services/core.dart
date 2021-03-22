Uri mountApiURl(String endpoint) {
  return Uri.https(
      'https://storm-tech.herokuapp.com', 'api/$endpoint?code=XFTH3478');
}

Uri mountShareUrl(String endpoint) {
  return Uri.https(
      'https://storm-tech.herokuapp.com', '$endpoint?reseller=XFTH3478');
}
