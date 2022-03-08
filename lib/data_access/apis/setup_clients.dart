import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shopping_list/common/config/environment.dart';
import 'package:shopping_list/data_access/apis/rest_client.dart';

void setupRestClient() {
  final dio = Dio();
  dio.options = BaseOptions(
    headers: <String, dynamic>{},
  );

  Get.put<RestClient>(
    RestClient(
      dio,
      baseUrl: EnvironmentUtil.getEnvironmentConfigs().apiUrl,
    ),
    permanent: true,
  );
}
