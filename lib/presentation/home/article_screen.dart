import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../domain/entity/tips.dart';
import '../widgets/custom_appbar.dart';
class ArticleScreen extends StatefulWidget {
  final Tips tips;
  const ArticleScreen({super.key, required this.tips});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    final title = widget.tips.title == 'advice' ? 'Аналытика' : 'Советы';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              leftIconPath: 'assets/logo/leftArrow.svg',
              title: title,
              backgroundColor: AppColors.floatButtonColor,
              textColor: Colors.white,
              showIconButton: true,
              onLeftIconPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    widget.tips.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.tips.description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                  Text(
                    widget.tips.article,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
