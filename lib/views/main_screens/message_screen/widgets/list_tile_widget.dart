import 'package:flutter/material.dart';
import 'package:foundr_project/core/colors.dart';
import 'package:foundr_project/core/widgets/textstyle.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Image.asset('assets/images/user.png'),
        ),
        title: TextStyleWidget(
          title: 'Event Seeker',
          thick: FontWeight.w600,
          textcolor: kBrown,
          fontsize: 20,
        ),
        subtitle: const Text('hi'),
        trailing: const Text(
          '2:00 pm',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
