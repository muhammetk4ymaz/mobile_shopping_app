import 'package:flutter/material.dart';

class TopPicksListItem extends StatelessWidget {
  const TopPicksListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                    'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/8df7ec66-8c54-4c9f-bb64-605b212fd34e/flex-experience-run-11-mens-running-shoes-extra-wide-2ZfRLC.png'),
                fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade300,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          'Running Shoes',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          'Men`s Shoes',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          '\$75',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
