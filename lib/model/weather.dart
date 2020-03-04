class Weather{
  String result;
  Weather(this.result);

  Weather.fromMap(Map<String, dynamic> json) {
    this.result = json['title'].toString();
  }
}