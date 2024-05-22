part of 'selection_bloc.dart';

sealed class SelectionEvent extends Equatable {
  const SelectionEvent();

  @override
  List<Object> get props => [];
}

class AddElementToSelectionEvent extends SelectionEvent {
  final OptionsHomeEnum value;

  const AddElementToSelectionEvent(this.value);

  @override
  List<Object> get props => [value];
}
