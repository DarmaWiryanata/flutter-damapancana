import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://damapancana.denpasarkota.go.id/api/";

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(fullUrl, headers: _setheaders());
  }

  _setheaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
