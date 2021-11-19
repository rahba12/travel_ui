import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/screens/destination_carousel.dart';
import 'package:travel_ui/screens/destination_screen.dart';

import 'hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _CurrentTab = 0;

  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.car,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.walking,
  ];

  Widget _buildIcon(int index) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: CircleAvatar(
          radius: 28,
          backgroundColor: _selectedIndex == index
              ? const Color(0xFFC8E8F3)
              : Colors.grey.shade200,
          child: Icon(
            _icons[index],
            size: 20,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.indigo,
        currentIndex: _CurrentTab,
        onTap: (int index) {
          setState(() {
            _CurrentTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
              size: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://image.freepik.com/free-photo/pretty-smiling-redhead-woman-uses-mobile-phone-application-glad-get-message-from-boyfriend-has-pleasant-conversation-online-dressed-fasionable-autumn-clothes_273609-46944.jpg'),
            ),
            label: '',
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 100),
            child: Text(
              'what you would like to find?',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList()),
          const SizedBox(
            height: 20,
          ),
          const DestinationCarousel(),
          const SizedBox(
            height: 20,
          ),
          const HotelCarousel(),
        ],
      ),
    );
  }
}
