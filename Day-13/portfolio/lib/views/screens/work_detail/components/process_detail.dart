import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    return item50(
                      context,
                      list: [],
                    );
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
