import 'dart:convert';
import 'dart:io';

import 'package:football/helpers/api_helper.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/model/punishments.dart';
import 'package:football/model/users.dart';
import 'package:http/http.dart' as http;

import '../model/admid_all_team.dart';
import 'api_settings.dart';

class SaffProcessApiController with ApiHelper{

  Future<List<AdminAllTeam>> adminAllTeam() async{
    Uri uri = Uri.parse(ApiSettings.adminAllTeam);
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => AdminAllTeam.fromJson(jsonObject)).toList();
    }
    return [];
  }

  Future<ApiResponse> adminCreateTeam({
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    Uri uri = Uri.parse(ApiSettings.adminCreateTeam);
    var response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'password':password,
      'mobile': mobile,
    }, headers: headers);
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

  Future<ApiResponse> adminUpdateTeam({
    required int id,
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    Uri uri = Uri.parse(ApiSettings.adminUpdateTeam.replaceFirst('{id}', id.toString()));
    var response = await http.put(uri, body: {
      'name': name,
      'email': email,
      'password':password,
      'mobile': mobile,
    }, headers: headers);
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

  Future<ApiResponse> deleteSearchStoreRecent({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.adminDeleteTeam.replaceFirst('{id}', id.toString()));
    var response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    }
    return errorResponse;
  }

  Future<List<Punishments>> adminPunishments() async{
    Uri uri = Uri.parse(ApiSettings.adminPunishments);
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => Punishments.fromJson(jsonObject)).toList();
    }
    return [];
  }
  Future<ApiResponse> adminCreatePunishments({
    required String title,
    required String description,
    required String teamId,
  }) async {
    Uri uri = Uri.parse(ApiSettings.adminCreatePunishments);
    var response = await http.post(uri, body: {
      'title': title,
      'description': description,
      'team_id':teamId,
    }, headers: headers);
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

  Future<ApiResponse> adminUpdatePunishments({
    required int id,
    required String title,
    required String description,
    required String teamId,
  }) async {
    Uri uri = Uri.parse(ApiSettings.adminUpdatePunishments.replaceFirst('{id}', id.toString()));
    var response = await http.put(uri, body: {
      'title': title,
      'description': description,
      'team_id':teamId,
    }, headers: headers);
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

  Future<ApiResponse> adminDeletePunishments({required int id}) async {
    Uri uri = Uri.parse(ApiSettings.adminDeletePunishments.replaceFirst('{id}', id.toString()));
    var response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    }
    return errorResponse;
  }

  Future<List<PlayerModel>> adminPlayers({required int id}) async{
    Uri uri = Uri.parse(ApiSettings.adminPlayers.replaceFirst('{id}', id.toString()));
    var response = await http.get(uri, headers: headers);
    if(response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObject = json['data'] as List;
      return dataJsonObject.map((jsonObject) => PlayerModel.fromJson(jsonObject)).toList();
    }
    return [];
  }
}