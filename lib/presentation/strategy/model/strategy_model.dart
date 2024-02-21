import 'package:flutter/material.dart';

import '../../../domain/data/api/api_supabase.dart';
import '../../../domain/entity/strategy.dart';
import '../../navigation/routes.dart';


class StrategyCardModel extends ChangeNotifier {
  final api = ApiSupabase();
  Future<void> getStrategysDetailsData(int index) async {
    await ApiSupabase().fetchStrategyDetailsData(index);
  }

  onTap(BuildContext context, Strategy strategy) {
    Navigator.of(context)
        .pushNamed(NavigationRoutesName.strategyDetails, arguments: strategy);
  }

  Future<void> onFavoriteTap(Strategy strategy) async {
    final state = !strategy.favorite;
    await api.updataData(state, strategy.id);
    notifyListeners();
  }
}

class StrategyCardProvider extends InheritedWidget {
  final StrategyCardModel model;
  const StrategyCardProvider(
      {super.key, required this.model, required Widget child})
      : super(child: child);

  static StrategyCardProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StrategyCardProvider>();
  }

  @override
  bool updateShouldNotify(StrategyCardProvider oldWidget) {
    return true;
  }
}
