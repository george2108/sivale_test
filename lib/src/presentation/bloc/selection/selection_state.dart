part of 'selection_bloc.dart';

class SelectionState extends Equatable {
  final List<OptionsHomeEnum> elementsSelected;

  const SelectionState({
    this.elementsSelected = const [],
  });

  SelectionState copyWith({
    List<OptionsHomeEnum>? elementsSelected,
  }) =>
      SelectionState(
        elementsSelected: elementsSelected ?? this.elementsSelected,
      );

  @override
  List<Object> get props => [
        elementsSelected,
      ];
}
