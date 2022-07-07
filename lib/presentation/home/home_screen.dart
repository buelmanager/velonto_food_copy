import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBodyTitle(),
            const SizedBox(height: 32),
            _buildTypeSelectList(),
            const SizedBox(height: 32),
            _buildCategoriTitle(),
            const SizedBox(height: 8),
            _buildCategoriList()
          ],
        ),
      ),
    );
  }

  Padding _makeCategoriCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          height: 250,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://loremflickr.com/g/${(MediaQuery.of(context).size.width).toInt()}/${250}/food',
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Sweety bar, \$5',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Min -\$5',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  _makeCateItem('americon'),
                                  const SizedBox(width: 5),
                                  _makeCateItem('Itallan'),
                                ],
                              ),
                              const Text(
                                '- 10:00 ~ 22:00',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriList() {
    return Container(
      child: Expanded(
        child: ListView(
          children: [
            _makeCategoriCard(),
            _makeCategoriCard(),
            _makeCategoriCard(),
            _makeCategoriCard(),
            _makeCategoriCard(),
            _makeCategoriCard(),
          ],
        ),
      ),
    );
  }

  ClipRRect _makeCateItem(String name) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Row _buildCategoriTitle() {
    return Row(
      children: const [
        Text(
          'All categories . ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Text(
          'delivery, \$5',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Container _buildTypeSelectList() {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _makeTypeItem('assets/svg/apple.svg', true),
          _makeTypeItem('assets/svg/bread-slice-solid.svg', false),
          _makeTypeItem('assets/svg/cookie-solid.svg', false),
          _makeTypeItem('assets/svg/cheese-solid.svg', false),
          _makeTypeItem('assets/svg/pizza-slice-solid.svg', false),
          _makeTypeItem('assets/svg/hamburger-solid.svg', false),
          _makeTypeItem('assets/svg/carrot-solid.svg', false),
        ],
      ),
    );
  }

  _makeTypeItem(String url, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff3754d1) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 60,
              height: 60,
              child: SvgPicture.asset(
                url,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildBodyTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 16,
        ),
        Text(
          'Hello, Dilan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          'what do you want to eat?',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/svg/bars-solid.svg',
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Container(
        width: 200,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.grey.shade100),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Current location',
                style: TextStyle(fontSize: 12),
              ),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
      actions: [
        _makeActionButton(Icons.search_rounded),
        _makeActionButton(Icons.list),
      ],
    );
  }

  Widget _makeActionButton(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 35,
          height: 35,
          color: Colors.grey.shade100,
          child: Icon(
            icon,
            size: 22,
          ),
        ),
      ),
    );
  }
}
