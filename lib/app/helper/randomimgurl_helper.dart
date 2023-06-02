class RandomImage {
  static String url = 'https://i.pravatar.cc/200?u=';
  String imageUrl = url + DateTime.now().toString();

  String getImageUrl() {
    return url +
        DateTime.now()
            .toString()
            .replaceAll('-', '')
            .replaceAll(':', '')
            .replaceAll('.', '');
  }
}
