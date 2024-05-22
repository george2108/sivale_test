import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String lastName;
  final int birthday;

  const Employee({
    required this.id,
    required this.name,
    required this.lastName,
    required this.birthday,
  });

  Employee copyWith({
    int? id,
    String? name,
    String? lastName,
    int? birthday,
  }) =>
      Employee(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        birthday: birthday ?? this.birthday,
      );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        birthday: json["birthday"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "birthday": birthday,
      };

  @override
  List<Object?> get props => [
        id,
        lastName,
        name,
        birthday,
      ];
}
