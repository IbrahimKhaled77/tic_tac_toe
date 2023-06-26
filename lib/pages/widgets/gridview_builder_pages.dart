import 'package:flutter/material.dart';

import '../../controller/cubit/cubit_cubit.dart';

class GridViewWidget extends StatelessWidget {
  final HomeCubit cubit;

  const GridViewWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cubit.item!.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _itemBuilder(index);
      },
    );
  }

  Widget _itemBuilder(index) {
    return InkWell(
      onTap: () {
        cubit.onTaps(index);
      },
      child: Container(
        color: cubit.item![index].isNotEmpty &&
                cubit.item![index] == HomeCubit.playerX
            ? Colors.blue
            : cubit.item![index].isNotEmpty &&
                    cubit.item![index] == HomeCubit.playerO
                ? Colors.yellow
                : Colors.white70,
        child: Center(
          child: Text(
            cubit.item![index],
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ),
    );
  }
}
