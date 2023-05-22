import 'package:flutter/material.dart';
import 'package:project1/component/bottom_bar.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aboutAs'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('assets/images/building.png'),
          SafeArea(
              child: Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Niratcha Sukkasam',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'At first he was ashamed  among his fellow foxes. ',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.red.shade400,
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [Text('Ml')],
                        ),
                        Row(
                          children: const[
                            Text("Mark Lee Mark Lee Mark Lee  Mark Lee")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Wrap(
                    spacing: 6,
                    children: List.generate(
                        10,
                        (index) => Chip(
                              label: Text('people ${index + 1}'),
                              avatar: const Icon(Icons.person_add_alt_outlined),
                              backgroundColor: Colors.red.shade400,
                            ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cct_logo.png'),
                      radius: 50,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cct_logo.png'),
                      radius: 50,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cct_logo.png'),
                      radius: 50,
                    ),
                    SizedBox(
                      width: 60,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.cake),
                            Icon(Icons.sunny),
                            Icon(Icons.tornado_outlined),
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      )),
      bottomNavigationBar: const ButtomNavbar(number: 2,),
    );
  }
}
