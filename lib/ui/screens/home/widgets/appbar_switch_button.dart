import 'package:comic_book/cubits/configs/configs_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarSwitchButton extends StatelessWidget {
  const AppBarSwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final configsValue = context.watch<ConfigsCubit>();

    bool showText = MediaQuery.of(context).size.width <= 800;

    String text = 'Switch to ${configsValue.state.showListView ? 'grid' : 'list'}';

    return Tooltip(
      message: text,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => configsValue.changeTypeOfView(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                if (!showText) ...[
                  Text(text),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                Icon(
                  configsValue.state.showListView ? Icons.grid_4x4 : Icons.list,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
