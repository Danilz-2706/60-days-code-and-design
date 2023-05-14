import 'package:flutter/material.dart';

import '../../model/fake_data.dart';
import '../constans/responsive.dart';
import 'components/item_social.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int _currentPage = 0;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
    Future.delayed(const Duration(microseconds: 500), () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          startAnimation = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: !MyResponsive.isMobile(context)
            ? Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Wrap(
                        children: List.generate(
                          list_social.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemSocial(
                                startAnimation: startAnimation,
                                positionY: -60,
                                icon: list_social[index]['icon']!,
                                title: list_social[index]['title']!,
                                link: list_social[index]['link']!,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 400,
                      child: Image.asset("assets/images/avatar.png"),
                    ),
                    Center(
                      child: Wrap(
                        children: List.generate(
                          list_social.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ItemSocial(
                                startAnimation: startAnimation,
                                positionY: -60,
                                icon: list_social[index]['icon']!,
                                title: list_social[index]['title']!,
                                link: list_social[index]['link']!,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  // Widget carouselView(int index) {
  //   return AnimatedBuilder(
  //     animation: _pageController,
  //     builder: (context, child) {
  //       double value = 0.0;
  //       if (_pageController.position.haveDimensions) {
  //         value = index.toDouble() - (_pageController.page ?? 0);
  //         value = (value * 0.038).clamp(-1, 1);
  //         print("value $value index $index");
  //       }
  //       return Transform.rotate(
  //         angle: pi * value,
  //         child: carouselCard(dataList[index]),
  //       );
  //     },
  //   );
  // }

  // Widget carouselCard(DataModel data) {
  //   return Column(
  //     children: <Widget>[
  //       Expanded(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Hero(
  //             tag: data.imageName,
  //             child: GestureDetector(
  //               onTap: () {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => DetailsScreen(data: data)));
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     borderRadius: BorderRadius.circular(30),
  //                     image: DecorationImage(
  //                         image: AssetImage(
  //                           data.imageName,
  //                         ),
  //                         fit: BoxFit.fill),
  //                     boxShadow: const [
  //                       BoxShadow(
  //                           offset: Offset(0, 4),
  //                           blurRadius: 4,
  //                           color: Colors.black26)
  //                     ]),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 20),
  //         child: Text(
  //           data.title,
  //           style: const TextStyle(
  //               color: Colors.black45,
  //               fontSize: 25,
  //               fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Text(
  //           "\$${data.price}",
  //           style: const TextStyle(
  //               color: Colors.black87,
  //               fontSize: 16,
  //               fontWeight: FontWeight.bold),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
