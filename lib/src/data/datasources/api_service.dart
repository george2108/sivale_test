import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/dto/response_dto.dart';
import '../../utils/constants/base_url.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: kBaseUrl, parser: Parser.MapSerializable)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/employees/jorge')
  Future<HttpResponse<ResponseDTO>> getData();
}
