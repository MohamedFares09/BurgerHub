import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/feature/cart/presentation/cart_view.dart';
import 'package:hungry_app/feature/home/presentation/home_view.dart';
import 'package:hungry_app/feature/order_history/presentation/order_history_view.dart';
import 'package:hungry_app/feature/profile/presentation/profile_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  static const routeName = 'route';
  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  final List<Widget> views = [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
  int currentView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.all(10),

        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentView,
          onTap: (value) {
            setState(() {
              currentView = value;
            });
            controller.jumpToPage(currentView);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_outlined),
              label: "Oreder History",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: views,
      ),
    );
  }
}
