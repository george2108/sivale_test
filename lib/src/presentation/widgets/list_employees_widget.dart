import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../locator.dart';
import '../../domain/repositories/api_repository.dart';
import '../bloc/employees/employees_bloc.dart';
import 'title_section_widget.dart';

class ListEmployeesWidget extends StatelessWidget {
  const ListEmployeesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EmployeesBloc(locator<ApiRepository>())..add(GetDataEvent()),
      child: BlocBuilder<EmployeesBloc, EmployeesState>(
        builder: (context, state) {
          return Column(
            children: [
              const TitleSectionWidget(title: 'Lista de empleados'),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: BlocBuilder<EmployeesBloc, EmployeesState>(
                  builder: (context, state) {
                    if (state is EmployeesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is EmployeesFailed) {
                      return const Center(child: Text('Hubo un error'));
                    }

                    if (state is EmployeesSuccess) {
                      return ListView.builder(
                        itemCount: state.employees.length,
                        itemBuilder: (context, index) {
                          final e = state.employees[index];
                          return ListTile(
                            title: Text('${e.name} ${e.lastName}'),
                          );
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
