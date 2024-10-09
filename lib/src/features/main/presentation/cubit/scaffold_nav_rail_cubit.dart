import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scaffold_nav_rail_state.dart';

class ScaffoldNavRailCubit extends Cubit<ScaffoldNavRailState> {
  ScaffoldNavRailCubit() : super(const ScaffoldNavRailState(isExtended: true));

  void toggleExtended() {
    emit(ScaffoldNavRailState(isExtended: !state.isExtended));
  }
}
