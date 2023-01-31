import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/models/back_end/process.dart';
import 'package:portfolio/views/constans/colors.dart';

import '../../../../controllers/blocs/process/process_bloc.dart';
import '../../../../controllers/services/firestore_service/process.dart';
import '../../../constans/grid_system.dart';

class ProcessDetail extends StatelessWidget {
  const ProcessDetail({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProcessBloc>(
      create: (context) => ProcessBloc(
          processService: RepositoryProvider.of<ProcessService>(context))
        ..add(GetAllProcessEvent(workId: workId)),
      child: BlocBuilder<ProcessBloc, ProcessState>(
        builder: (context, state) {
          if (state is LoadingProcessState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAllProcessState) {
            var data = state.listProcess;

            if (data == null) {
              return Container();
            }
            return gridSystemMyApp(
              context,
              [
                ...List.generate(
                  data.length,
                  (index) {
                    if (data[index]!.typeProcess ==
                        TypeProcess.title.toString()) {
                      return item100(
                        context,
                        widget: Text(
                          data[index]!.nameTitle!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.stepName.toString()) {
                      return item25(
                        context,
                        widget: Text(
                          data[index]!.nameStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.stepContain.toString()) {
                      return item75(
                        context,
                        widget: Text(
                          data[index]!.contentStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.smallPicture.toString()) {
                      return item50(
                        context,
                        list: [],
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.bigPicture.toString()) {
                      return item100(
                        context,
                        list: [],
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.detailProcess.toString()) {
                      return item100(
                        context,
                        widget: Text(
                          data[index]!.nameStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    }
                    if (data[index]!.typeProcess ==
                        TypeProcess.video.toString()) {
                      return item100(
                        context,
                        list: [],
                      );
                    }
                    return item100(context);
                  },
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
