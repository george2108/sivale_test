import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/enum/options_home_enum.dart';
import '../../../utils/constants/routes_constants.dart';
import '../../../utils/models/option_home_item_model.dart';
import '../../bloc/selection/selection_bloc.dart';
import '../../widgets/home_item_widget.dart';

class HomePage extends StatelessWidget {
  final List<OptionHomeItemModel> optionsList = [
    OptionHomeItemModel(
      title: 'Cámara',
      icon: Icons.camera,
      value: OptionsHomeEnum.camera,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Lista de empleados',
      icon: Icons.group,
      value: OptionsHomeEnum.listEmployees,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Nombre completo',
      icon: Icons.person,
      value: OptionsHomeEnum.fullName,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Número telefónico',
      icon: Icons.phone,
      value: OptionsHomeEnum.phoneNumber,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Fecha de nacimiento',
      icon: Icons.baby_changing_station,
      value: OptionsHomeEnum.birthDate,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Sexo',
      icon: Icons.wc_outlined,
      value: OptionsHomeEnum.sex,
      selected: false,
    ),
    OptionHomeItemModel(
      title: 'Color favorito',
      icon: Icons.color_lens,
      value: OptionsHomeEnum.favoriteColor,
      selected: false,
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectionBloc>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: optionsList.length,
              itemBuilder: (_, index) {
                final element = optionsList[index];
                return HomeItemWidget(
                  icon: element.icon,
                  title: element.title,
                  value: element.value,
                  selected: bloc.state.elementsSelected.contains(element.value),
                );
              },
            ),
          ),
          if (bloc.state.elementsSelected.isEmpty)
            const Text('Seleccionar al menos una opción'),
          FilledButton.icon(
            onPressed: bloc.state.elementsSelected.isEmpty
                ? null
                : () {
                    Navigator.of(context).pushNamed(optionsRoute);
                  },
            label: const Text('Continuar'),
            icon: const Icon(Icons.check_circle_outline_outlined),
          ),
        ],
      ),
    );
  }
}
