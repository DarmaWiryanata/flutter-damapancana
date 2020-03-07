import '../models/daftarKejadian.dart';
import 'package:http/http.dart' show Client;

class DaftarKejadianService {
  final String baseUrl = "http://himatistiki.id/api/blog";
  Client client = Client();

  Future<List<DaftarKejadian>> getData() async {
    final response = await client.get("$baseUrl");
    if (response.statusCode == 200) {
      print(response.body);
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }
}
