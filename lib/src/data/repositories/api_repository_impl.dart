import '../../domain/dto/response_dto.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resources/data_state.dart';
import '../datasources/api_service.dart';
import '../datasources/base_api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final ApiService _apiService;

  ApiRepositoryImpl(this._apiService);

  @override
  Future<DataState<ResponseDTO>> getData() {
    return getStateOf(request: () => _apiService.getData());
  }
}
