import '../models/peringatan.dart';
import 'package:http/http.dart' show Client;

class PeringatanService {
  final String baseUrl = "https://damapancana.denpasarkota.go.id/api/peringatan";
  Client client = Client();

  Future<List<Peringatan>> getData() async {
    final response = await client.get("$baseUrl");
    if (response.statusCode == 200) {
      print(response.body);
      return peringatanFromJson(response.body);
    } else {
      return null;
    }
  }
}
