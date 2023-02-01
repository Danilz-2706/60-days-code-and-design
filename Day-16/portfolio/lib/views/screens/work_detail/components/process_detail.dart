import 'package:flutter/material.dart';
import '../../../../controllers/blocs/bloc_exports.dart';
import '../../../../controllers/services/service_exports.dart';
import '../../../constans/colors.dart';
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
                    switch (data[index]!.typeProcess) {
                      case 'TypeProcess.title':
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
                      case 'TypeProcess.stepName':
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
                      case 'TypeProcess.stepContain':
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
                      case 'TypeProcess.detailProcess':
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
                      case 'TypeProcess.smallPicture':
                        return item50(
                          context,
                          image: data[index]!.image,
                        );
                      case 'TypeProcess.bigPicture':
                        return item100(
                          context,
                          image: data[index]!.image,
                        );
                      case 'TypeProcess.video':
                        return item100(
                          context,
                          list: [],
                        );

                      default:
                        return item100(context);
                    }
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
