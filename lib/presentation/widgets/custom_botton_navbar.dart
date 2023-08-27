import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:todo_app/presentation/provider/providers.dart';

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const selectedColor = Colors.green;
    const unSelectedColor = Color.fromARGB(255, 0, 0, 0);
    final currentIndex = ref.watch(todoStatusFilterProvider);
    return StylishBottomBar(
      backgroundColor: Colors.black,
      items: [
        BottomBarItem(
          icon: const Icon(
            Icons.house,
          ),
          selectedIcon: const Icon(Icons.house_rounded),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('All'),
        ),
        BottomBarItem(
          icon: const Icon(Icons.done),
          selectedIcon: const Icon(Icons.done_all_rounded),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Completed'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.pending_actions_rounded,
          ),
          selectedIcon: const Icon(
            Icons.pending_actions_rounded,
          ),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Pending'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.access_time_rounded,
          ),
          selectedIcon: const Icon(
            Icons.access_time_filled_outlined,
          ),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Reminders'),
        ),
      ],
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      currentIndex: currentIndex,
      onTap: (index) {
        ref.read(todoStatusFilterProvider.notifier).update((state) => index);
      },
      option: AnimatedBarOptions(
        // iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.Default,
        // opacity: 0.3,
      ),
    );
  }
}
