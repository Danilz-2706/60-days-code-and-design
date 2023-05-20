import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../components/big_title.dart';
import '../components/footer.dart';
import '../constans/grid_system.dart';
import 'components/list_work.dart';

class ContainerWork extends StatefulWidget {
  const ContainerWork({super.key});

  @override
  State<ContainerWork> createState() => _ContainerWorkState();
}

class _ContainerWorkState extends State<ContainerWork> {
  late ScrollController scrollController;
  bool startAnimation = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
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
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebSmoothScroll(
      controller: scrollController,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            gridSystemMyApp(
              context,
              [
                BigTitle(
                    context: context,
                    title: "All work",
                    startAnimation: startAnimation),
              ],
            ),
            ListWork(startAnimation: startAnimation),
            gridSystemMyApp(
              context,
              [
                item100(
                  context,
                  false,
                  widget: const Footer(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
