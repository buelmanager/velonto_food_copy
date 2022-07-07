import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velonto_food_copy/presentation/home/home_screen.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  double width = -1;
  double height = -1;
  int pageIndex = 0;

  // index가 0인 페이지 먼저 보여줌
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('clicked');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xffff623a),
        child: const Icon(
          CupertinoIcons.arrow_right,
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.black,
      width: width,
      height: height,
      child: Stack(
        children: [
          _buildBackground(),
          _buildContent(),
          _buildIndicator(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: width,
      height: height,
      child: PageView(
          controller: pageController,
          onPageChanged: (int page) {
            // this page variable is the new page and will change before the pageController fully reaches the full, rounded int value
            setState(() {
              pageIndex = page;
              print('page $page');
            });
          }, // PageController 연결
          children: [
            _buildContent1(),
            _buildContent1(),
            _buildContent1(),
          ]),
    );
  }

  Widget _buildContent1() {
    return Stack(
      children: [
        Positioned(
          bottom: 70,
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Food',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(' you love,',
                        style: TextStyle(fontSize: 35, color: Colors.white)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'delivered ',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    Text('to you',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Easily delegate the small tasks and devote \ntime to the modst important things',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 50,
      child: Container(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          children: [
            _makeLine(0 == pageIndex),
            const SizedBox(width: 8),
            _makeLine(1 == pageIndex),
            const SizedBox(width: 8),
            _makeLine(2 == pageIndex),
          ],
        ),
      ),
    );
  }

  Container _makeLine(
    bool isSelected,
  ) {
    return Container(
      width: isSelected ? 20 : 15,
      height: 5,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  Opacity _buildBackground() {
    return Opacity(
      opacity: 0.5,
      child: Image.network(
        'https://loremflickr.com/g/${width.toInt()}/${height.toInt()}/food',
        fit: BoxFit.fill,
      ),
    );
  }
}
