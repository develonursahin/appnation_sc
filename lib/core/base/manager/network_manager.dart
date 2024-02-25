import 'package:appnation_sc/core/constants/app_statics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  final String _baseUrl = AppStatics.breedsBaseUrl;
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl))
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (DioException error, ErrorInterceptorHandler handler) async {
            if (error.response?.statusCode == 404) {
              if (kDebugMode) {
                print("404 Hatası: İstenen kaynak bulunamadı.");
              }
              return handler.resolve(Response(
                requestOptions: error.requestOptions,
                statusCode: 404,
              ));
            }
            return handler.next(error);
          },
        ),
      );
  }
}
