part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object?> get props => [];
}

final class EmployeesLoading extends EmployeesState {}

final class EmployeesSuccess extends EmployeesState {
  final List<Employee> employees;

  const EmployeesSuccess({this.employees = const []});
}

final class EmployeesFailed extends EmployeesState {
  final DioException? exception;

  const EmployeesFailed({this.exception});
}
