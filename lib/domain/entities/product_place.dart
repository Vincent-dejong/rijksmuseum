import 'package:equatable/equatable.dart';

class ProductionPlace extends Equatable {
  final String name;

  const ProductionPlace({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}
