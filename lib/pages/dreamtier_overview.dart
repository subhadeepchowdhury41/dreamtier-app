import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home bg-01.png'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(7),
                height: size.height / 9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                    ),
                    Container(
                      height: double.infinity,
                      width: size.width / 2.5,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/DreamTier png white-01.png'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _bannerImages.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        width: size.width,
                        child: Container(
                            width: size.width * 0.97,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      _bannerImages[_currIndex],
                                    ),
                                    alignment: Alignment.center,
                                    fit: BoxFit.fill))),
                      );
                    }),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Text('Top Mentors in Photography',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  itemCount: _bannerImages.length,
                  itemBuilder: ((ctx, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 12),
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.amber.shade100,
                                Colors.amber.shade400
                              ]),
                          border: Border.all(
                            color: Colors.grey.shade600,
                            width: 0.3,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  width: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subhadeep Chowdhury',
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        'Photographer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Text(
                                  '(4.5)',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87),
                                ),
                                const SizedBox(width: 8),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 20,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color:
                                        index < 3 ? Colors.amber : Colors.grey,
                                  ),
                                  onRatingUpdate: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Text('Ways to fullfill your dream Profession',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  itemCount: _bannerImages.length,
                  itemBuilder: ((ctx, index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 15,
                            spreadRadius: 0 / 7,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(17),
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.shade400,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(3),
                            alignment: Alignment.center,
                            width: 100,
                            child: const Text(
                              'Guidance and Mentorship ',
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
