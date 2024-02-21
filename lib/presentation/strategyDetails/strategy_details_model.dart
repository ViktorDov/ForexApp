import 'package:flutter/material.dart';
import '../../domain/entity/strategy.dart';

class StrategyDetailsModel extends ChangeNotifier {
  final Strategy strategy;

  StrategyDetailsModel({required this.strategy});
}

class StrategyDetailsProvider extends InheritedNotifier {
  final StrategyDetailsModel model;
  const StrategyDetailsProvider(
      {super.key,required Widget child, required this.model})
      : super(notifier: model, child: child);

  static StrategyDetailsProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<StrategyDetailsProvider>();
  }

  @override
  bool updateShouldNotify(StrategyDetailsProvider oldWidget) {
    return true;
  }
}
