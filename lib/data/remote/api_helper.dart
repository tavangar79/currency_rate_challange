import 'package:currency_rate_challange/configs.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<String> getRates() async {
    try {
      var res = await http
          .get(Uri.parse("${Configs.baseUrl}/code-challenge/index.php"));
      if (res.statusCode != 200) {
        return Future.error(res.body);
      }

      return Future.value(res.body);
    } catch (x) {
      return Future.error(x);
    }
  }
}
