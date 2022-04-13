import 'package:academics/screen/academic_add_screen.dart';
import 'package:academics/screen/academic_list_screen.dart';
import 'package:academics/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 2;

  List<Widget> pages = [];

  @override
  initState() {
    super.initState();
    // pages.add(const FirstPage());
    pages.add(const AcademicAddScreen());
    // pages.add(const SecondPage());
    pages.add(const AcademicList());
    //
    pages.add(const Dashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CondApp'),
      ),
      body: IndexedStack(
        children: pages,
        index: _selectedPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Menu",
          ),
        ],
        currentIndex: _selectedPage,
        onTap: _onTapped,
      ),
    );
  }

  _onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
