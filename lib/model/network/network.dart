import 'dart:convert';

import 'package:catapp/model/common.dart';
import 'package:catapp/model/detail/detail.dart';
import 'package:catapp/model/home/breeds.dart';
import 'package:catapp/model/network/end_points.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Future<dynamic> getListBreeds({
    Map<String, dynamic> params = const {},
  }) async {
    String content = '';
    List<CatBreeds> myListBreeds = [];

    content = (params.keys.map((key) => '$key=${Uri.encodeQueryComponent(params[key])}')).join('&');

    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Length': utf8.encode(content).length.toString(),
      'x-api-key': Common().apiKey,
    };

    try {
      debugPrint('-> ${Common().baseUrl + EndPoints().breeds}?$content');
      await http
          .get(
        headers: headers,
        Uri.parse('${Common().baseUrl + EndPoints().breeds}?$content'),
      )
          .then((response) {
        if (response.statusCode == 200) {
          List jsonList = jsonDecode(response.body.replaceAll('\'', '')) as List;
          myListBreeds = jsonList.map((jsonElement) => CatBreeds.fromJson(jsonElement)).toList();
        } else {
          myListBreeds = [];
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
        }
      });
    } catch (e) {
      debugPrint('Ha ocurrido un error:');
      debugPrint(e.toString());
      return [];
    }
    return myListBreeds;
  }

  Future<dynamic> getDetailCat({
    id = '',
  }) async {
    String content = '';
    CatBreedsImage? catDetail;

    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Length': utf8.encode(content).length.toString(),
      'x-api-key': Common().apiKey,
    };

    try {
      debugPrint('-> ${Common().baseUrlDetail + id}?$content');
      await http
          .get(
        headers: headers,
        Uri.parse('${Common().baseUrlDetail + id}?$content'),
      )
          .then((response) {
        if (response.statusCode == 200) {
          var catDetailResponse = CatBreedsImage.fromJson(jsonDecode(response.body.replaceAll('\'', '')));
          catDetail = catDetailResponse;
        } else {
          catDetail = null;
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
        }
      });
    } catch (e) {
      debugPrint('Ha ocurrido un error:');
      debugPrint(e.toString());
      return null;
    }
    return catDetail;
  }
}
