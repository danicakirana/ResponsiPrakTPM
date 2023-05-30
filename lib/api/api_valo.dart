import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model_details.dart';

class ValoApi {
  Future<List<dynamic>> getCharacterList() async {
    var url = Uri.parse('https://valorant-api.com/v1/agents');
    var response = await http.get(url);

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return data;
  }

  Future<AgentsModel> getCharacterDetail(String name) async {
    var url = Uri.parse('https://valorant-api.com/v1/agents/{uuid}');
    var response = await http.get(url);
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    return CharactersModel.fromJson(data);
  }

}
