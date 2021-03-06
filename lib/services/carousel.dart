import '../models/carousel.dart';
import 'package:http/http.dart' show Client;

class CarouselService {
  final String baseUrl = "https://damapancana.denpasarkota.go.id/api/getslider";
  Client client = Client();

  Future<List<Carousel>> getData() async {
    final response = await client.get("$baseUrl");
    if (response.statusCode == 200) {
      // print(response.body);
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }
}
