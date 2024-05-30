import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../domain/models/film_model.dart';

class ApiService {
  Future<List<FilmModel>> getTopRate() async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}/movie/top_rated?api_key=${ApiConstants.secretKey}');

      var response = await http.get(url);

      log(response.body.toString());

      if (response.statusCode == 200) {
        List<FilmModel> films = filmModelListFromJson(response.body);
        return films.sublist(0, 5);
      } else {
        throw Exception('Failed to update user: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<FilmModel>> getLatest() async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}/movie/upcoming?api_key=${ApiConstants.secretKey}');

      var response = await http.get(url);

      log(response.body.toString());

      if (response.statusCode == 200) {
        List<FilmModel> films = filmModelListFromJson(response.body);
        return films;
      } else {
        throw Exception('Failed to update user: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<FilmModel>> searchFilms(String query) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}/search/movie?api_key=${ApiConstants.secretKey}&query=$query');

      var response = await http.get(url);

      log(response.body.toString());

      if (response.statusCode == 200) {
        List<FilmModel> films = filmModelListFromJson(response.body);
        return films;
      } else {
        throw Exception('Failed to update user: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to update user: $e');
    }
  }

  Future<FilmModel> getFilm(String id) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl}/movie/$id?api_key=${ApiConstants.secretKey}');

      var response = await http.get(url);

      log(response.body.toString());

      if (response.statusCode == 200) {
        FilmModel film = filmModelFromJson(response.body);
        return film;
      } else {
        throw Exception('Failed to update user: ${response.body}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to update user: $e');
    }
  }

  // Future<String?> sendCode(
  //     {required String phone, required String code}) async {
  //   try {
  //     var url = Uri.parse('${ApiConstants.baseUrl}/sendcode.php');

  //     var body = {
  //       'api_key': ApiConstants.secretKey,
  //       'phone': phone,
  //       'code': code,
  //     };

  //     var response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //       body: body,
  //     );

  //     log(response.body.toString());

  //     if (response.statusCode == 200) {
  //       return response.body;
  //     } else {
  //       throw Exception('Failed to send code: ${response.body}');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     throw Exception('Failed to send code: $e');
  //   }
  // }

  // Future<FilmModel?> getUser({required String phone}) async {
  //   try {
  //     var url = Uri.parse('${ApiConstants.baseUrl}/getuser.php');

  //     var body = {
  //       'api_key': ApiConstants.secretKey,
  //       'phone': phone,
  //     };

  //     var response = await http.post(
  //       url,
  //       headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //       body: body,
  //     );

  //     log(response.body.toString());

  //     if (response.statusCode == 200) {
  //       FilmModel res = userModelFromJson(response.body);
  //       return res;
  //     } else {
  //       throw Exception('Failed to get user: ${response.body}');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     throw Exception('Failed to get user: $e');
  //   }
  // }
}

class ApiConstants {
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String secretKey = '793d51730f788c9d34fc40892d0317f9';
}
