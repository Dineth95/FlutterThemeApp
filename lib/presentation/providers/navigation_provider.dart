import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

@riverpod
class NavigationNotifier extends _$NavigationNotifier {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
} 