import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/blocs/work/work_bloc.dart';
import '../../../../controllers/services/firestore_service/work.dart';
import '../../../constans/colors.dart';
import '../../../constans/grid_system.dart';

class TitleWorkDetail extends StatelessWidget {
  const TitleWorkDetail({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkBloc>(
      create: (context) =>
          WorkBloc(workService: RepositoryProvider.of<WorkService>(context))
            ..add(GetOnlyWorkEvent(workId: workId)),
      child: BlocBuilder<WorkBloc, WorkState>(
        builder: (context, state) {
          if (state is LoadingWorkState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetOnlyWorkState) {
            var data = state.work;
            return gridSystemMyApp(
              context,
              [
                item100(
                  context,
                  widget: Text(
                    "${data.nameWork} - ${data.nameType}",
                    style: const TextStyle(fontSize: 22, color: kTextColor),
                  ),
                ),
                item100(
                  context,
                  widget: Text(
                    data.titleWorkDetail,
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
