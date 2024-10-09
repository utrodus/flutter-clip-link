part of 'scaffold_nav_rail_cubit.dart';

class ScaffoldNavRailState extends Equatable {
  const ScaffoldNavRailState({required this.isExtended});
  final bool isExtended;

  @override
  List<Object> get props => [isExtended];
}
