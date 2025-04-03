import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_driver/presentation/card_page.dart';
import 'package:my_driver/config/themes.dart';
import 'package:my_driver/presentation/providers/navigation_provider.dart';
import 'package:my_driver/presentation/providers/theme_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Light Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.lightTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Dark Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.darkTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Blue Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.blueTheme);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Green Theme'),
                onTap: () {
                  ref.read(themeNotifierProvider.notifier).setTheme(AppThemes.greenTheme);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationNotifierProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.palette,
                      color: Theme.of(context).colorScheme.surface,
                      size: 30,
                    ),
                    onPressed: () => _showThemeDialog(context, ref),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.surface,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$18199.24',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(navigationNotifierProvider.notifier).setIndex(index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat'
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Cardpage()),
          );
        },
        child: Icon(Icons.card_membership),
      ),
    );
  }
}
