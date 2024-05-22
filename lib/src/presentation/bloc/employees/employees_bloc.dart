import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/employee_entity.dart';
import '../../../domain/repositories/api_repository.dart';
import '../../../utils/resources/data_state.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  final ApiRepository _apiRepository;

  EmployeesBloc(this._apiRepository) : super(EmployeesLoading()) {
    on<GetDataEvent>(_getData);
  }

  _getData(GetDataEvent event, Emitter<EmployeesState> emit) async {
    final response = await _apiRepository.getData();

    if (response is DataSuccess) {
      final employees = response.data!.data.employees;
      emit(EmployeesSuccess(employees: employees));
    } else if (response is DataError) {
      emit(EmployeesFailed(exception: response.exception));
    }
  }
}
