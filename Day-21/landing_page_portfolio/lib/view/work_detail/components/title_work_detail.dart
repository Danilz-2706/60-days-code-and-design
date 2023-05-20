import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../controller/cubits/cubit_export.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';

class TitleWorkDetail extends StatelessWidget {
  const TitleWorkDetail({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkOnlyCubit, WorkOnlyState>(
      builder: (context, state) {
        if (state is WorkOnlyLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is WorkOnlyLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gridSystemMyApp(
                context,
                [
                  item100(
                    context,
                    false,
                    widget: Text(
                      "${state.work.nameWork} - ${state.work.nameType}",
                      style: const TextStyle(fontSize: 22, color: kTextColor),
                    ),
                  ),
                  item100(
                    context,
                    false,
                    widget: Text(
                      state.work.titleWorkDetail,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 88,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  item100(
                    context,
                    false,
                    widget: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "View Prototype",
                          style: TextStyle(fontSize: 22, color: kTextColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                height: 50,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
