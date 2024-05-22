import '../../utils/resources/data_state.dart';
import '../dto/response_dto.dart';

abstract class ApiRepository {
  Future<DataState<ResponseDTO>> getData();
}
