import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../controller/cubits/cubit_export.dart';
import '../../constans/colors.dart';
import '../../constans/spacing.dart';

class ItemLeft extends StatelessWidget {
  const ItemLeft({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetInTouchCubit, GetInTouchState>(
      builder: (context, state) {
        if (state is GetInTouchLoading) {
          return const SizedBox(
            height: 280,
            child: RiveAnimation.asset("assets/animations/anima_reply-ing.riv"),
          );
        } else if (state is GetInTouchLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...List.generate(
                state.listGetInTouch.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      state.listGetInTouch[index].text,
                      style: const TextStyle(fontSize: 18, color: kTextColor),
                    ),
                    const SizedBox(height: kDefaultPadding),
                  ],
                ),
              )
            ],
          );
        } else if (state is GetInTouchError) {
          return Container();
        }
        return Container();
      },
    );
  }
}
