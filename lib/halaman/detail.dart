import 'package:flutter/material.dart';
import '../api/api_valo.dart';
import '../models/model_agents.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AgentDetailPage extends StatefulWidget {
  String name;
  AgentDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  State<AgentDetailPage> createState() => _AgentDetailPageState();
}

class _AgentDetailPageState extends State<AgentDetailPage> {
  Future<void> _setLastOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last_open', widget.name);
    prefs.setString('code', 'agent');
  }

  @override
  void initState() {
    super.initState();
    _setLastOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
              "Detail ${widget.name[0].toUpperCase()}${widget.name.substring(1).toLowerCase()}"),
        ),
        body: FutureBuilder(
          future: ValoApi().getAgentDetail(widget.name),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: Text("Tidak ada data"),
                ),
              );
            } else {
              AgentsModel agent = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '. https://valorant-api.com/v1/agents/${agent.name!.toLowerCase()}/gacha-splash'),
                                fit: BoxFit.cover)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '. https://valorant-api.com/v1/agents/${agent.uuid!.toLowerCase()}/icon'),
                                  fit: BoxFit.cover),
                            ),
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            agent.name!,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                      Text(agent.name!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < agent.rarity!; i++)
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                        ],
                      ),


                              Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        agent.skillTalents![i].unlock!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        agent.skillTalents![i].name!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        agent.skillTalents![i].description!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}

String urlImageTalent(String name, String detaill) {
  var split = talent.split("_");
  var tipe = split[1];

  if (split[1] == 'Details') {
    tipe = 'na';
  } else {
    tipe = split[1].toLowerCase();
  }

  return ". https://valorant-api.com/v1/agents//${name.toLowerCase()}";
}
