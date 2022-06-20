import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/views/grocery_list.dart';
import 'package:grocery_list/views/home.dart';

void main() {
  runApp(
    const CupertinoApp(home: MainPage()),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: const Color.fromRGBO(222, 179, 173, 1),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'Grocery List',
              icon: Icon(CupertinoIcons.list_bullet),
            ),
            BottomNavigationBarItem(
              label: 'Recipes',
              icon: Icon(Icons.dinner_dining),
            )
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => HomeView(),
              );
            case 1:
              return CupertinoTabView(
                builder: (context) => GroceryListView(),
              );
            case 2:
            default:
              return Container(
                alignment: Alignment.center,
                child: const Text('Recipes Page'),
              );
          }
        },
      );
}
