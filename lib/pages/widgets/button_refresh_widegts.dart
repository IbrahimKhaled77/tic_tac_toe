import 'package:flutter/material.dart';

import '../../controller/cubit/cubit_cubit.dart';

class ButtonRefresh extends StatelessWidget {
  final HomeCubit cubit;

  const ButtonRefresh({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: () {
          cubit.initialGame();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Refresh',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
