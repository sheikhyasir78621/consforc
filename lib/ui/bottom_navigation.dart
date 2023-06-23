import 'package:consforc/state/state.dart';
import 'package:flutter/material.dart';
import 'package:consforc/costants/colors.dart';
import 'package:consforc/costants/assets.dart';
import 'package:consforc/ui/home_screen.dart';
import 'package:provider/provider.dart';
class BottomNavigationScreen extends StatelessWidget {
   BottomNavigationScreen({Key? key}) : super(key: key);




   static const List<Widget> _screens = [
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),
     HomeScreen(),

   ];

  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppTheme.whiteColor,

            body: Center(
              child: _screens.elementAt(provider.tabIndex),
            ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: _bottomNavigation(context),)
      ],
    );
  }

  Widget _bottomNavigation(context) {
    AppState provider = Provider.of<AppState>(context);
    return Container(


      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.purpleColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 4, top: 4),
                child: Image.asset(
                    homeIcon,
                    height: 24,
                    color: provider.tabIndex != 0 ? AppTheme.unselectedTabColor : AppTheme.whiteColor),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
               savedIcon,
                  height: 30,
                  width: 30,
                  color: provider.tabIndex != 1 ? AppTheme.unselectedTabColor : AppTheme.whiteColor),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 4, top: 4),
                child: Image.asset(
                  courseIcon,

                    height: 24,

                    color: provider.tabIndex != 2 ? AppTheme.unselectedTabColor : AppTheme.whiteColor),
              ),
              label: "Course",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 4, top: 4),
                child: Image.asset(
                    libraryIcon,
                    height: 24,

                    color: provider.tabIndex != 3 ? AppTheme.unselectedTabColor : AppTheme.whiteColor),
              ),
              label: "Library",
            ),

          ],
          currentIndex: provider.tabIndex,
          fixedColor: AppTheme.whiteColor,
          unselectedLabelStyle:  TextStyle(
              color: AppTheme.unselectedTabColor,
              fontWeight: FontWeight.w100,
              fontSize: 12
          ),
          selectedLabelStyle: TextStyle(
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w100,
            fontSize: 12
          ),
          onTap: (index) {
            provider.updateTabIndex(index);


          },
          unselectedItemColor: AppTheme.unselectedTabColor,
        ),
      ),
    );
  }


}
