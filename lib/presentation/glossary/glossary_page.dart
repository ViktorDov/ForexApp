import 'package:flutter/material.dart';
import 'package:forexstrategy/constants/app_colors.dart';
import 'package:forexstrategy/presentation/widgets/custom_appbar.dart';

class Glossary {
  final String word;
  final String definition;

  Glossary({required this.word, required this.definition});
}

class GlossaryScreen extends StatefulWidget {
  const GlossaryScreen({super.key});

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  List<Glossary> filteredList = [];
  String filterWord = '';
  final List<Glossary> glossary = [
    Glossary(
      word: 'Блокчейн',
      definition:
          'Блокчейн - распределенная база данных, используемая для хранения и передачи информации в криптовалютных сетях.',
    ),
    Glossary(
      word: 'Биткоин',
      definition:
          'Биткоин - первая и самая популярная криптовалюта, которая работает на основе технологии блокчейн и может использоваться для передачи цифровых активов.',
    ),
    Glossary(
      word: 'Майнинг',
      definition:
          'Майнинг - процесс генерации новых блоков в блокчейне криптовалют, который требует большой вычислительной мощности.',
    ),
    Glossary(
      word: 'Криптовалютный кошелек',
      definition:
          'Криптовалютный кошелек - программное обеспечение или устройство для хранения, отправки и получения криптовалют.',
    ),
    Glossary(
      word: 'Децентрализация',
      definition:
          'Децентрализация - концепция, которая заключается в отсутствии централизованного контроля над криптовалютами и их сетями.',
    ),
    Glossary(
      word: 'Эфир',
      definition:
          'Эфир (Ethereum) - платформа для создания децентрализованных приложений и смарт-контрактов на основе блокчейна.',
    ),
    Glossary(
      word: 'Токен',
      definition:
          'Токен - цифровой актив, представляющий собой определенную стоимость или права и может функционировать на различных блокчейн-платформах.',
    ),
    Glossary(
      word: 'ICO',
      definition:
          'ICO (Initial Coin Offering) - способ привлечения инвестиций, когда команда проекта продает свои токены для финансирования развития.',
    ),
    Glossary(
      word: 'Открытый ключ',
      definition:
          'Открытый ключ - уникальный код, используемый для шифрования и подписи сообщений в криптовалютных транзакциях.',
    ),
    Glossary(
      word: 'Приватный ключ',
      definition:
          'Приватный ключ - конфиденциальный код, используемый для доступа к криптовалютным кошелькам и совершения транзакций.',
    ),
    Glossary(
      word: 'Хеш-функция',
      definition:
          'Хеш-функция - алгоритм, который преобразует входные данные в фиксированную строку символов (хеш), используемую для безопасного хранения паролей и других данных.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredList = glossary;
  }

  void filterGlossary(String word) {
    setState(
      () {
        filterWord = word;
        filteredList = glossary
            .where((element) =>
                element.word.toLowerCase().contains(filterWord.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(
              showIconButton: false,
              leftIconPath: 'assets/logo/leftIcon.svg',
              title: 'Глоссарий',
              backgroundColor: AppColors.floatButtonColor,
              textColor: Colors.white,
              onLeftIconPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: filterGlossary,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filteredList[index].word,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.floatButtonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        filteredList[index].definition,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
