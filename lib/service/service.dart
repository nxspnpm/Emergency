import 'package:http/http.dart' as http;
import 'package:project1/models/apikey.dart';

class RemoteService {
  Future<List<Apikey>?> getDataApi() async {
    var client = http.Client();
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return apikeyFromJson(json);
    }
  }
}
