import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sport/presentation/body_weight/weight_page.dart';
import 'package:sport/presentation/common/navigation/bottom_navigation_items.dart';
import 'package:sport/presentation/debug/debugpage.dart';
import 'package:sport/presentation/routines/routines_page.dart';

class HomePage extends HookWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentIndex = useState(0);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PageView(
        controller: pageController,
        children: const [
          RoutinesPage(),
          RoutinesPage(),
          WeightPage(),
          DebugPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black54,
        unselectedItemColor: Colors.white54,
        items: BottomNavigationItems.getBottomNavigationItems(),
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
