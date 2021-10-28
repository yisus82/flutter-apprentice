import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

final String apiKey = dotenv.get('EDAMAM_APP_KEY');
final String apiId = dotenv.get('EDAMAM_APP_ID');
final String apiUrl = dotenv.get('EDAMAM_API_URL');

class RecipeService {
  Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
