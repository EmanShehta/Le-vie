import 'package:dio/dio.dart';

import '../../components/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
        receiveDataWhenStatusError: true,
        connectTimeout: 20 *1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  static Future<Response?> getData(
      {
        required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
        String? accessToken,
        String? refreshToken,
      }) async{
    print(">>>>>>>>>>>>>>>>>>>>>>> accessToken $accessToken");
    dio?.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $accessToken',
      'refreshToken':refreshToken,
    };

    // ["Authorization"] = "Bearer $accessToken";
    return await dio?.get(
      url,
      queryParameters: query,
    );
  }




  static Future<Response?> postData( {
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String? accessToken,
    String? refreshToken,
  }) async
  {
    dio?.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'application/json',
      'Authorization':'Bearer $accessToken',
      'refreshToken':refreshToken,
    };
    return await dio?.post(
      url,
      queryParameters:query,
      data:data,
    );
  }

  static Future<Response?> patchData(
      {
        required String url,
        Map<String, dynamic>? query,
        required Map<String,dynamic> data,
        String lang = 'en',
        String? refreshToken,
      }) async{
    dio?.options.headers["Authorization"] = "Bearer $accessToken";
    return await dio?.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }



}

