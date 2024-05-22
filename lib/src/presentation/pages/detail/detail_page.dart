import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/enum/options_home_enum.dart';
import '../../bloc/selection/selection_bloc.dart';
import '../../widgets/camera_widget.dart';
import '../../widgets/full_name_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SelectionBloc>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de opciones'),
      ),
      body: ListView(
        children: [
          if (bloc.state.elementsSelected.contains(OptionsHomeEnum.camera))
            const CameraWidget(),
          if (bloc.state.elementsSelected.contains(OptionsHomeEnum.fullName))
            const FullNameWidget(),
        ],
      ),
    );
  }
}
