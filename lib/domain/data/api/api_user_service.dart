import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:forexstrategy/domain/data/data_provider/user_data_provider.dart';
import 'package:uuid/uuid.dart';

class ApiUserService {
  final UserDataProvider _userDataProvider = UserDataProvider();
  final Dio _dio = Dio();
  final Uuid _uuid = const Uuid();
  Future<void> sendRequest() async {
    const String apiUrl = "https://api.byteplex.info/api/leads/";
    final String quizResult = await _userDataProvider.getQuizResult();

    String? domainName = "telegram.me";
    String? name = await _userDataProvider.getName();
    String? surname = await _userDataProvider.getSurname();
    String? phone = await _userDataProvider.getPhone();
    String? email = await _userDataProvider.getEmail();
    int? offerId = 942927841304313857;
    String? ip = '192.168.1.1';

    final Map<String, dynamic> data = {
      "domain_name": domainName,
      "email": email,
      "first_name": name,
      "last_name": surname,
      "ip": ip,
      "phone": phone,
      "offer": offerId,
      "click_id": _uuid.v4(),
      "answers": quizResult,
    };

    try {
      final Response response = await _dio.post(apiUrl,
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));

      if (response.statusCode == 201) {
        log('Request success ${response.data}');
      } else {
        log('HTTP Status Code:  ${response.statusCode}');
        if (response.data != null) {
          log("Response data: ${response.data}");
        }
      }
    } on DioException catch (dioError) {
      log('Request failed with error: ${dioError.error}');
      log("DioError occurred: ${dioError.message}");
      if (dioError.response != null) {
        // Если есть ответ от сервера, выводим его статус и данные
        log("HTTP Status Code: ${dioError.response?.statusCode}");
        log("Failed data: ${dioError.response?.data}");
      }
    } catch (e) {
      log('Request failed with error: $e');
    }
  }
}
