import 'package:academics/screen/dashboard/item_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  final ItemDashboard item1 = const ItemDashboard(
    title: 'Unidades',
    subTitle: 'Casas dos Moradores',
    event: '0',
    image: './assets/images/home.png',
  );

  final ItemDashboard item2 = const ItemDashboard(
    title: 'Food',
    subTitle: 'Food',
    event: '0',
    image: './assets/images/food.png',
  );

  final ItemDashboard item3 = const ItemDashboard(
    title: 'Unidades',
    subTitle: 'Casas dos Moradores',
    event: '0',
    image: './assets/images/home.png',
  );

  final ItemDashboard item4 = const ItemDashboard(
    title: 'Unidades',
    subTitle: 'Casas dos Moradores',
    event: '0',
    image: './assets/images/home.png',
  );

  @override
  Widget build(BuildContext context) {
    List<ItemDashboard> list = [
      item1,
      item2,
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = list[index];
            return GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.deepPurple.shade400,
                ),
                child: Column(children: [
                  Image.asset(item.image),
                  Text(item.title),
                ]),
              ),
              onTap: () => callOwner(context, index),
            );
          },
        ),
      ),
    );
  }

  callOwner(BuildContext context, int index) {
    if (index == 1) {
      Navigator.of(context).pushNamed('/ownerAdd');
    }
  }
}
