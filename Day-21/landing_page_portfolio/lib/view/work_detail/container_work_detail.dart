import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../components/footer.dart';
import '../constans/grid_system.dart';
import 'components/process_detail.dart';
import 'components/title_work_detail.dart';

class ContainerWorkDetail extends StatefulWidget {
  const ContainerWorkDetail({
    super.key,
    required this.workId,
  });

  final String workId;

  @override
  State<ContainerWorkDetail> createState() => _ContainerWorkDetailState();
}

class _ContainerWorkDetailState extends State<ContainerWorkDetail> {
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
            TitleWorkDetail(workId: widget.workId),
            ProcessDetail(workId: widget.workId),
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
