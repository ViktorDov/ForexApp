import 'package:flutter/material.dart';
import 'package:forexstrategy/constants/app_colors.dart';
import 'package:forexstrategy/domain/data/api/api_supabase.dart';
import 'package:forexstrategy/presentation/strategy/model/strategy_model.dart';
import 'package:forexstrategy/presentation/widgets/custom_appbar.dart';
import 'package:forexstrategy/presentation/widgets/strategy_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final StrategyCardModel _model;
  @override
  void initState() {
    _model = StrategyCardModel();
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StrategyCardProvider(
      model: _model,
      child: const FavoriteScreenBody(),
    );
  }
}

class FavoriteScreenBody extends StatefulWidget {
  const FavoriteScreenBody({super.key});

  @override
  State<FavoriteScreenBody> createState() => _FavoriteScreenBodyState();
}

class _FavoriteScreenBodyState extends State<FavoriteScreenBody> {
  final api = ApiSupabase();
  @override
  Widget build(BuildContext context) {
    final model = StrategyCardProvider.of(context)!.model;
    return Scaffold(
      body: FutureBuilder(
        future: api.fetchStrategysFavoriteData(),
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
            return CustomAppBar(
                showIconButton: true,
                leftIconPath: 'assets/logo/leftArrow.svg',
                title: 'Избранное',
                backgroundColor: Colors.white,
                textColor: AppColors.floatButtonColor,
                onLeftIconPressed: () => Navigator.of(context).pop());
          }
          return Column(
            children: [
              CustomAppBar(
                  showIconButton: true,
                  leftIconPath: 'assets/logo/leftArrow.svg',
                  title: 'Избранное',
                  backgroundColor: Colors.white,
                  textColor: AppColors.floatButtonColor,
                  onLeftIconPressed: () => Navigator.of(context).pop()),
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
                          setState(() {});
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
