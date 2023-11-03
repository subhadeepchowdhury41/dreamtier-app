import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DreamtierOverview extends StatefulWidget {
  const DreamtierOverview({super.key});

  @override
  State<DreamtierOverview> createState() => _DreamtierOverviewState();
}

class _DreamtierOverviewState extends State<DreamtierOverview> {
  late final ScrollController _scrollController;
  final List<String> _bannerImages = [
    'assets/images/home banner1.png',
    'assets/images/home banner2.png',
    'assets/images/home baner3.png',
  ];

  int _currIndex = 1;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home bg-01.png'),
            ),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    itemCount: _bannerImages.length,
                    itemBuilder: ((ctx, index) {
                      return SizedBox(
                        height: 200,
                        child: Image.asset(
                          _bannerImages[_currIndex],
                          height: 200,
                          width: size.width,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    text: 'Top Mentors Related to your dream ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'PHTOGRAPHY',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    itemCount: _bannerImages.length,
                    itemBuilder: ((ctx, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 120,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            Text('ankita '),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    text: 'Ways to fulfill your',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                        text: 'DREAM PROFESSION',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    itemCount: _bannerImages.length,
                    itemBuilder: ((ctx, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 180,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            Text('ankita '),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
