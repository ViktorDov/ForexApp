import 'dart:convert';
import 'dart:developer';

import 'package:forexstrategy/domain/entity/strategy.dart';
import 'package:forexstrategy/domain/entity/strategy_details.dart';
import 'package:forexstrategy/domain/entity/tips.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiSupabase {
  static const url = 'https://fqmirgdqwcvffjnfinko.supabase.co';
  static const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZxbWlyZ2Rxd2N2ZmZqbmZpbmtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY4ODEwMjQsImV4cCI6MjAyMjQ1NzAyNH0.Hvb-RSyijVrgYIh3fSezHtFWbnp8i4t-znJJCL-Z6fw';

  static SupabaseClient client = SupabaseClient(url, anonKey);

  // get a list of strategies
  Future<List<Strategy>> fetchStrategysData() async {
    final response =
        await client.from('strategy').select('').order('id', ascending: true);

    final List<Strategy> lst =
        response.map((e) => Strategy.fromMap(e)).toList();
    return lst;
  }

  // save strategy data to shared preferences
  Future<void> saveStrategyData(Map<String, dynamic> strategyData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String strategyDataJson = jsonEncode(strategyData);
    await prefs.setString('strategyData', strategyDataJson);
  }

  // get a list of strategy details
  Future<StrategyDetails> fetchStrategyDetailsData(int id) async {
    log('fetchStretegyDetailsData id: $id');
    final response =
        await client.from('strategy_details').select().eq('id', id);
    final List<StrategyDetails> lst =
        response.map((e) => StrategyDetails.fromMap(e)).toList();
    return lst.first;
  }

  Future<List<Tips>> fetchAdviceData() async {
    final response = await client
        .from('trading_tips')
        .select('')
        .eq('content_type', 'advice')
        .order('id', ascending: true);

    final List<Tips> lst = response.map((e) => Tips.fromMap(e)).toList();

    return lst;
  }

  Future<List<Tips>> fetchAnalyticsData() async {
    final response = await client
        .from('trading_tips')
        .select('')
        .eq('content_type', 'analytics')
        .order('id', ascending: true);
    final List<Tips> lst = response.map((e) => Tips.fromMap(e)).toList();

    return lst;
  }

  Future<List<Strategy>> fetchStrategysFavoriteData() async {
    final response = await client
        .from('strategy')
        .select('')
        .eq('favorite', true)
        .order('id', ascending: true);

    final List<Strategy> lst =
        response.map((e) => Strategy.fromMap(e)).toList();
    return lst;
  }

  Future<void> updataData(bool state, int id) async {
    await client.from('strategy').update({'favorite': state}).eq('id', id);
  }
}
