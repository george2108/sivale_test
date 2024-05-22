import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/enum/options_home_enum.dart';
import '../bloc/selection/selection_bloc.dart';

class HomeItemWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final OptionsHomeEnum value;
  final bool selected;

  const HomeItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SelectionBloc>(context)
            .add(AddElementToSelectionEvent(value));
      },
      child: Card(
        color: selected ? Colors.green : Theme.of(context).cardTheme.color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                selected
                    ? Icons.check_box_outlined
                    : Icons.check_box_outline_blank_sharp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
