import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_size.dart';
import '../../../domain/entity/strategy_details.dart';

class UserCaseScreen extends StatefulWidget {
  final StrategyDetails strategyDetails;
  const UserCaseScreen({super.key, required this.strategyDetails});

  @override
  State<UserCaseScreen> createState() => _UserCaseScreenState();
}

class _UserCaseScreenState extends State<UserCaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppColors.backgraundColor,
                width: AppSize.myWidth(context),
                child: Text(
                  widget.strategyDetails.caseDefinition,
                  style: const TextStyle(
                    height: 1.5,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              if (widget.strategyDetails.caseImage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(widget.strategyDetails.caseImage),
                ),
            ],
          )),
    );
  }
}
