import '../models/telepon.dart';
import 'package:http/http.dart' show Client;

class TeleponService {
  final String baseUrl = "https://damapancana.denpasarkota.go.id/api/telpon";
  Client client = Client();

  Future<List<Telepon>> getData() async {
    final response = await client.get("$baseUrl");
    if (response.statusCode == 200) {
      // print(response.body);
      return teleponFromJson(response.body);
    } else {
      return null;
    }
  }
}
