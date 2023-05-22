import 'package:flutter/material.dart';

import '../models/apikey.dart';
import '../service/service.dart';

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {
  List<Apikey>? Apikey1;
  var isLoaded = false;

  // Apikey _datafromapi;
  @override
  void initState() {
    super.initState();
    getData();
    print(Apikey1);
  }

  getData() async {
    Apikey1 = await RemoteService().getDataApi();
    if (Apikey1 != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: Apikey1?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Apikey1![index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Apikey1![index].body ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Apikey1![index].userId.toString(),
                                  ),
                                  Text(
                                    Apikey1![index].id.toString(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  void apikeyFromJson(String body) {}
}
