import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://bodysmartinsights.com/wp-content/uploads/2023/06/running-shoes-scaled.jpeg'),
                  fit: BoxFit.cover)),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exclusive Member Benefits Just for You 💪',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Check `em cut to make the the most of your Membership',
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
