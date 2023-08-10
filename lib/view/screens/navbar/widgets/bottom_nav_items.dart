import 'package:easybuy_user_app/controller/nav_bar_controller.dart';
import 'package:easybuy_user_app/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NavBarItems extends StatelessWidget {
  const NavBarItems({
    super.key,
    required this.landingPageController,
  });
  final LandingPageController landingPageController;

  final TextStyle selectedLabelStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 60,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.tabIndex.value,
          selectedItemColor: const Color(0xFF212121),
        unselectedItemColor: const Color(0xFF9E9E9E),
        selectedLabelStyle: selectedLabelStyle,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesome.first_order,
                size: 20.0,
              ),
              label: 'Order',
              backgroundColor: kwhite,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 20.0,
              ),
              label: 'Wishlist',
              backgroundColor: kwhite,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: 'Home',
              backgroundColor: kwhite,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_travel,
                size: 20.0,
              ),
              label: 'Cart',
              backgroundColor: kwhite,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_history,
                size: 20.0,
              ),
              label: 'Profile',
              backgroundColor: kwhite,
            ),
          ],
        ),
      ),
    );
  }
}
