import 'package:flutter/material.dart';

Widget itemsCard(BuildContext context){
  return Card(
    elevation: 3.0,
    shadowColor: Colors.red,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    //image: NetworkImage()(

                    )
                  ),
                //)
              ],
            )
          ],
        )
      ],
    ),
  );
}