import 'package:flutter/material.dart';
import 'package:forexstrategy/domain/data/api/api_supabase.dart';
import 'package:forexstrategy/presentation/home/article_screen.dart';
import 'package:forexstrategy/presentation/widgets/tips_card.dart';

class AdviceScreen extends StatefulWidget {
  const AdviceScreen({super.key});

  @override
  State<AdviceScreen> createState() => _AdviceScreenState();
}

class _AdviceScreenState extends State<AdviceScreen> {
  final api = ApiSupabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.fetchAdviceData(),
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
        final tips = snapshot.data ?? [];
        if (tips.isEmpty) {
          return const Center(child: Text('No analytics found!'));
        }
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tips.length,
          itemBuilder: (context, index) {
            return TipsCard(
              tips: tips[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleScreen(tips: tips[index]),
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
