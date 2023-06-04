import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../constans/colors.dart';
import '../../constans/grid_system.dart';

class ProcessDetail extends StatelessWidget {
  const ProcessDetail({
    Key? key,
    required this.workId,
  }) : super(key: key);

  final String workId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessCubit, ProcessState>(
      builder: (context, state) {
        if (state is ProcessLoadingState) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is GetAllProcessState) {
          if (state.listProcess == null) {
            return Container();
          }
          return gridSystemMyApp(
            context,
            [
              ...List.generate(
                state.listProcess!.length,
                (index) {
                  switch (state.listProcess![index]!.typeProcess) {
                    case 'TypeProcess.title':
                      return item100(
                        context,
                        false,
                        widget: Text(
                          state.listProcess![index]!.nameTitle!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    case 'TypeProcess.stepName':
                      return item25(
                        context,
                        false,
                        widget: Text(
                          state.listProcess![index]!.nameStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    case 'TypeProcess.stepContain':
                      return item75(
                        context,
                        false,
                        widget: Text(
                          state.listProcess![index]!.contentStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    case 'TypeProcess.detailProcess':
                      return item100(
                        context,
                        false,
                        widget: Text(
                          state.listProcess![index]!.nameStep!,
                          style: const TextStyle(
                            fontSize: 28,
                            color: kTextColor,
                          ),
                        ),
                      );
                    case 'TypeProcess.smallPicture':
                      return item50(
                        context,
                        false,
                        image: state.listProcess![index]!.image,
                      );
                    case 'TypeProcess.bigPicture':
                      return item100(
                        context,
                        false,
                        image: state.listProcess![index]!.image,
                      );
                    case 'TypeProcess.video':
                      return item100(
                        context,
                        false,
                        list: [],
                      );

                    default:
                      return item100(
                        context,
                        false,
                      );
                  }
                },
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
