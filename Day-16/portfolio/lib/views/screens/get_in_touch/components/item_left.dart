import 'package:flutter/material.dart';
import '../../../../controllers/blocs/bloc_exports.dart';
import '../../../constans/colors.dart';
import '../../../constans/spacing.dart';

class ItemLeft extends StatelessWidget {
  const ItemLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetInTouchBloc, GetInTouchState>(
      builder: (context, state) {
        if (state is LoadingGetInTouchState) {
          return const CircularProgressIndicator();
        } else if (state is GetAllGetInTouchState) {
          var data = state.listGetInTouch;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...List.generate(
                data.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data[index].text,
                      style: const TextStyle(fontSize: 18, color: kTextColor),
                    ),
                    const SizedBox(height: kDefaultPadding),
                  ],
                ),
              )
            ],
          );
        } else if (state is ErrorGetInTouchState) {
          return Container();
        }
        return Container();
      },
    );
  }
}
