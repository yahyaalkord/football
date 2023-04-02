import 'dart:convert';

import 'package:football/helpers/api_helper.dart';
import 'package:football/model/news_model.dart';
import 'package:football/model/player_contacts.dart';
import 'package:http/http.dart' as http;

import '../helpers/api_response.dart';
import '../model/team_match.dart';
import 'api_settings.dart';

class PlayerProcessApiController with ApiHelper{
  Future<List<NewsModel>> playersNews() async{
    Uri uri = Uri.parse(ApiSettings.playersNews);
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => NewsModel.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<List<PlayerContracts>> getPlayerContracts() async{
    Uri uri = Uri.parse(ApiSettings.getPlayerContracts);
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => PlayerContracts.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<ApiResponse> acceptContracts({
    required int id,
  }) async {
    Uri uri = Uri.parse(ApiSettings.acceptContracts.replaceFirst('{id}', id.toString()));
    var response = await http.put(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    }else if(response.statusCode == 400){
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }else{
      return errorResponse;
    }

  }

  Future<ApiResponse> rejectedContracts({
    required int id,
  }) async {
    Uri uri = Uri.parse(ApiSettings.rejectedContracts.replaceFirst('{id}', id.toString()));
    var response = await http.put(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    }else if(response.statusCode == 400){
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }else{
      return errorResponse;
    }

  }

  Future<List<TeamMatch>> playerMatches() async{
    Uri uri = Uri.parse(ApiSettings.playerMatches);
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => TeamMatch.fromJson(jsonObject)).toList();
    }
    return [];
  }
}