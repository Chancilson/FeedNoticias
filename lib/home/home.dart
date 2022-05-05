import 'package:feed/feed/feed_screen.dart';
import 'package:feed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int index = 0;

class _HomeScreenState extends State<HomeScreen> {


  List<Widget> _optionWidgets() {

    List<Widget> widgets = [
      const FeedScreen(),
      Center(
        child: Text("Second",
          style: GoogleFonts.nunito(
            fontSize: 16,
          ),
        ),
      ),
      Center(
        child: Text("third",
          style: GoogleFonts.nunito(
            fontSize: 16,
          ),
        ),
      ),
      Center(
        child: Text("Fourth",
          style: GoogleFonts.nunito(
            fontSize: 16,
          ),
        ),
      ),
      Center(
        child: Text("last",
          style: GoogleFonts.nunito(
            fontSize: 16,
          ),
        ),
      ),
    ];

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _optionWidgets().elementAt(index),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (selectedIndex){
          setState(() {
            index = selectedIndex;
          });
        },
        fixedColor: kPrimaryColor,
        showUnselectedLabels: true,
        unselectedItemColor:  kGreyColors, //#879099
        unselectedLabelStyle: const TextStyle( color: kGreyColors),

        items: [
          BottomNavigationBarItem(
            label: "Feed",
              icon: SvgPicture.asset(
                  "assets/svg/ic_tab_feed_default.svg",
                  color: index == 0 ? kPrimaryColor : null,
              ),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: SvgPicture.asset(
              "assets/svg/ic_tab_feed_default.svg",
              color: index == 1 ? kPrimaryColor : null,
            ),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
              color: index == 2 ? kPrimaryColor : null,
            ),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
              color: index == 3 ? kPrimaryColor : null,
            ),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
              color: index == 4 ? kPrimaryColor : null,
            ),
          ),
        ],
      ),
    );
  }
}
