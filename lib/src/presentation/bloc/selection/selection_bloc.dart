import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../config/enum/options_home_enum.dart';

part 'selection_event.dart';
part 'selection_state.dart';

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  SelectionBloc() : super(const SelectionState()) {
    on<AddElementToSelectionEvent>(_addElementToSelection);
  }

  _addElementToSelection(
    AddElementToSelectionEvent event,
    Emitter<SelectionState> emit,
  ) {
    final copyList = List<OptionsHomeEnum>.from(state.elementsSelected);
    final indexElement =
        copyList.indexWhere((element) => element == event.value);
    if (indexElement > -1) {
      copyList.removeAt(indexElement);
    } else {
      copyList.add(event.value);
    }
    emit(state.copyWith(elementsSelected: copyList));
  }
}
