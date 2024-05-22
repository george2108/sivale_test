import 'package:equatable/equatable.dart';

import '../entities/employee_entity.dart';

class ResponseDTO extends Equatable {
  final bool success;
  final Data data;

  const ResponseDTO({
    required this.success,
    required this.data,
  });

  ResponseDTO copyWith({
    bool? success,
    Data? data,
  }) =>
      ResponseDTO(
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory ResponseDTO.fromMap(Map<String, dynamic> map) => ResponseDTO(
        success: map["success"],
        data: Data.fromJson(map["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}

class Data extends Equatable {
  final List<Employee> employees;

  const Data({
    required this.employees,
  });

  Data copyWith({
    List<Employee>? employees,
  }) =>
      Data(
        employees: employees ?? this.employees,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        employees: List<Employee>.from(
            json["employees"].map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [employees];
}
