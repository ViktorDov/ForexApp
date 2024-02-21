import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../domain/data/api/api_supabase.dart';
import '../navigation/routes.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/strategy_card.dart';
import 'model/strategy_model.dart';

class StrategysPage extends StatefulWidget {
  const StrategysPage({super.key});

  @override
  State<StrategysPage> createState() => _StrategysPageState();
}

class _StrategysPageState extends State<StrategysPage> {
  late final StrategyCardModel _model;
  @override
  void initState() {
    _model = StrategyCardModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StrategyCardProvider(
      model: _model,
      child: const StrategysPageBody(),
    );
  }
}

class StrategysPageBody extends StatefulWidget {
  const StrategysPageBody({super.key});

  @override
  State<StrategysPageBody> createState() => _StrategysPageBodyState();
}

class _StrategysPageBodyState extends State<StrategysPageBody> {
  final api = ApiSupabase();
  @override
  Widget build(BuildContext context) {
    final model = StrategyCardProvider.of(context)!.model;
    return Scaffold(
      body: FutureBuilder(
        future: api.fetchStrategysData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Error, check your internet connection! or hase error: ${snapshot.error}'),
            );
          }
          final strategys = snapshot.data ?? [];
          if (strategys.isEmpty) {
            return const Center(child: Text('No strategies found!'));
          }
          return Column(
            children: [
              CustomAppBar(
                leftIconPath: 'assets/logo/favorite.svg',
                showIconButton: true,
                title: 'Стратегии',
                backgroundColor: AppColors.floatButtonColor,
                textColor: Colors.white,
                onLeftIconPressed: () => Navigator.of(context)
                    .pushNamed(NavigationRoutesName.favoriteScreen),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: strategys.length,
                  itemBuilder: (context, index) {
                    final strategy = strategys[index];
                    return StrategyCard(
                      strategy: strategy,
                      onTap: () => model.onTap(context, strategy),
                      onFavoriteTap: () {
                        setState(() {
                          model.onFavoriteTap(strategy);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
