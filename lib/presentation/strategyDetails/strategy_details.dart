import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:forexstrategy/constants/app_colors.dart';
import 'package:forexstrategy/domain/data/api/api_supabase.dart';
import 'package:forexstrategy/domain/entity/strategy.dart';
import 'package:forexstrategy/presentation/strategyDetails/pages/about_screen.dart';
import 'package:forexstrategy/presentation/strategyDetails/pages/case_screen.dart';
import 'package:forexstrategy/presentation/strategyDetails/pages/example.dart';
import 'package:forexstrategy/presentation/strategyDetails/strategy_details_model.dart';
import 'package:forexstrategy/presentation/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class StrategyDetailsScreen extends StatefulWidget {
  final Strategy strategy;
  const StrategyDetailsScreen({super.key, required this.strategy});

  @override
  State<StrategyDetailsScreen> createState() => _StrategyDetailsScreenState();
}

class _StrategyDetailsScreenState extends State<StrategyDetailsScreen> {
  late final StrategyDetailsModel _model;

  @override
  void initState() {
    _model = StrategyDetailsModel(
      strategy: widget.strategy,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _model,
      child: const StrategyDetailsScreenBody(),
    );
  }
}

class StrategyDetailsScreenBody extends StatefulWidget {
  const StrategyDetailsScreenBody({super.key});

  @override
  State<StrategyDetailsScreenBody> createState() =>
      _StrategyDetailsScreenBodyState();
}

class _StrategyDetailsScreenBodyState extends State<StrategyDetailsScreenBody> {
  @override
  Widget build(BuildContext context) {
    final api = ApiSupabase();
    final model = context.watch<StrategyDetailsModel>();
    return Scaffold(
      body: FutureBuilder(
        future: api.fetchStrategyDetailsData(model.strategy.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error, check your internet connection! or hase error: ${snapshot.error}'));
          }
          final strategyDetails = snapshot.data ?? [];
          if (strategyDetails == []) {
            return const Center(child: Text('No strategies found!'));
          }
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Column(
                children: [
                  CustomAppBar(
                    showIconButton: true,
                    leftIconPath: 'assets/logo/leftArrow.svg',
                    backgroundColor: Colors.white,
                    textColor: AppColors.floatButtonColor,
                    title: 'Стратегии',
                    onLeftIconPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.strategy.title,
                          style: const TextStyle(
                            color: AppColors.floatButtonColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 13),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              model.strategy.currencyPair.length,
                              (index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: AppColors.floatButton),
                                    ),
                                    label: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/logo/dollar.svg'),
                                        const SizedBox(width: 6),
                                        Text(
                                          model.strategy.currencyPair[index],
                                          style: const TextStyle(
                                            color: AppColors.floatButtonColor,
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(
                              model.strategy.timeOfString.length, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Chip(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(
                                    color: Color(0xFF78C589),
                                  ),
                                ),
                                label: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/logo/schedule.svg'),
                                    const SizedBox(width: 6),
                                    Text(
                                      model.strategy.timeOfString[index],
                                      style: const TextStyle(
                                        color: Color(0xFF78C589),
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        const TabBar(
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'О стратегии',
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: AppColors.floatButtonColor,
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Кейсы',
                                  style: TextStyle(
                                    color: AppColors.floatButtonColor,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Примеры',
                                  style: TextStyle(
                                    color: AppColors.floatButtonColor,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AboutScreen(strategyDetails: strategyDetails),
                        UserCaseScreen(strategyDetails: strategyDetails),
                        ExampleScreen(strategyDetails: strategyDetails),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
