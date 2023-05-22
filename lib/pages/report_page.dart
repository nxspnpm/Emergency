import 'package:flutter/material.dart';
import 'map_page.dart';


class Reportanemergency extends StatefulWidget {
  const Reportanemergency({super.key});

  @override
  State<Reportanemergency> createState() => _ReportanemergencyState();
}

class _ReportanemergencyState extends State<Reportanemergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),

                //หัวข้อ
                const Text(
                  'แจ้งเหตุฉุกเฉิน',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),

                //ปุ่ม
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'ลักทรัพย์')));
                        },
                        child: const Text('ลักทรัพย์'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'กรรโชกทรัพย์')));
                        },
                        child: const Text('กรรโชกทรัพย์'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'ทรัพย์สินหาย')));
                        },
                        child: const Text('ทรัพย์สินหาย'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'โดนคุกคาม')));
                        },
                        child: const Text('โดนคุกคาม'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'รถชน')));
                        },
                        child: const Text('รถชน'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Mappage(something: 'คนหาย')));
                        },
                        child: const Text('คนหาย'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Mappage(
                                  something: 'ต้องการสอบถามเพิ่มเติม')));
                        },
                        child: const Text('ต้องการสอบถามเพิ่มเติม'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size(300, 45),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)))),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
