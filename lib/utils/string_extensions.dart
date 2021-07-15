import 'dart:convert' as convert;
extension StringExtensions on String {
  double get toDouble => double.parse(this);

  int get toInt => int.parse(this);

  Map<String, dynamic> get toJson => convert.jsonDecode(this);

  List<int> get toUtf8 => convert.utf8.encode(this);

  String get base64Encode => convert.base64Encode(convert.utf8.encode(this));

  String get base64Decode => convert.utf8.decode(convert.base64Decode(this));

  Uri get toUri => Uri.parse(this);

  String get scheme => Uri.parse(this).scheme;

  String get host => Uri.parse(this).host;

  String get path => Uri.parse(this).path;

  int get port => Uri.parse(this).port;

  Map<String, String> get queryParameters => Uri.parse(this).queryParameters;

  String get removeAllSpace => replaceAll(new RegExp(r"\s+\b|\b\s"), "");

  bool isEmail() {
    if (isEmpty) return false;
    return RegExp('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}')
        .hasMatch(this);
  }

  bool isPhoneNumber() {
    if (isEmpty) return false;
    return RegExp(
        '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$')
        .hasMatch(this);
  }
}
