import 'dart:convert';
import 'dart:io';

import 'package:football/helpers/api_helper.dart';
import 'package:football/helpers/api_response.dart';
import 'package:football/model/users.dart';
import 'package:http/http.dart' as http;

import '../shared_pref_controller/shared_pref_controller.dart';
import 'api_settings.dart';

class AuthApiController with ApiHelper{
  Future<ApiResponse> adminLogin(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.adminLogin);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      AdminModel user = AdminModel.fromJson(json['data']);
      await SharedPrefController().adminSave(user);
      return ApiResponse(json['message'], true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> playerLogin(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.playerLogin);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      PlayerModel user = PlayerModel.fromJson(json['data']);
      await SharedPrefController().playerSave(user);
      return ApiResponse(json['message'], true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> teamLogin(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.teamLogin);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      TeamModel user = TeamModel.fromJson(json['data']);
      await SharedPrefController().teamSave(user);
      return ApiResponse(json['message'], true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> userLogin(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.userLogin);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      VisitorModel user = VisitorModel.fromJson(json['data']);
      await SharedPrefController().saveVisitor(user);
      return ApiResponse(json['message'], true);
    } else if (response.statusCode == 400) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    } else {
      return errorResponse;
    }
  }

  Future<ApiResponse> userRegister({
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    Uri uri = Uri.parse(ApiSettings.userRegister);
    var response = await http.post(uri, body: {
      'name': name,
      'email': email,
      'password':password,
      'mobile': mobile,
    }, headers: {
      HttpHeaders.acceptHeader: 'application/json',
    });
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
  Future<ApiResponse> logout() async {
    Uri uri = Uri.parse(ApiSettings.logout.replaceFirst('{userType}', SharedPrefController().getValueFor(key: PrefKeys.usertype.name)));
    var response = await http.get(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      SharedPrefController().clear();
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], true);
    }else if(response.statusCode==400){
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], false);
    }
    return errorResponse;
  }
}