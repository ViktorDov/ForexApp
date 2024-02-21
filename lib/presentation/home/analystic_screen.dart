import 'package:flutter/material.dart';

import '../../domain/data/api/api_supabase.dart';
import '../widgets/tips_card.dart';
import 'article_screen.dart';

class AnalysticScreen extends StatefulWidget {
  const AnalysticScreen({super.key});

  @override
  State<AnalysticScreen> createState() => _AnalysticScreenState();
}

class _AnalysticScreenState extends State<AnalysticScreen> {
  final api = ApiSupabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.fetchAnalyticsData(),
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
        final analytics = snapshot.data ?? [];
        if (analytics.isEmpty) {
          return const Center(child: Text('No analytics found!'));
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: analytics.length,
          itemBuilder: (context, index) {
            return TipsCard(
              tips: analytics[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleScreen(tips: analytics[index]),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
