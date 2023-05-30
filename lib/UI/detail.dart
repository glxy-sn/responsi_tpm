import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:provider/provider.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/detail_matches_model.dart';

class DetailPertandingan extends StatefulWidget {
  final id;
  const DetailPertandingan({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPertandingan> createState() => _DetailPertandinganState();
}

class _DetailPertandinganState extends State<DetailPertandingan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Match ID: " + widget.id!),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
        foregroundColor: Colors.white,
      ),
      body: _buildDetail(widget.id!),
    ));
  }
}

Widget _buildDetail(String id){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadDetail(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        if(snapshot.hasError){
          return _buildErrorSection();
        }
        if(snapshot.hasData){
          DetailMatchesModel detailModel = DetailMatchesModel.fromJson(snapshot.data);
          // Officials officials = detailModel.officials;
          return _buildSuccessSection(context, detailModel);
        }
        return _buildLoadingSection();
      },
    ),
  );
}
Widget _buildErrorSection(){
  return Container(
    child: Text('Error Occured'),
  );
}
Widget _buildLoadingSection() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
      ],
    ),
  );
}

Widget _buildSuccessSection(BuildContext context,DetailMatchesModel data) {
  return SingleChildScrollView( // Wrap with SingleChildScrollView
    child: Container(
      // padding: EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: 150,
                    child: Image.network("https://flagcdn.com/256x192/" +
                        data.homeTeam!.country!.substring(0, 2).toLowerCase() +
                        ".png"),
                  ),
                  Text(data.homeTeam!.name!)
                ],
              ),
              Row(
                children: [
                  Text(data.homeTeam!.goals!.toString()),
                  Text(" - "),
                  Text(data.awayTeam!.goals!.toString())
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    child: Image.network("https://flagcdn.com/256x192/" +
                        data.awayTeam!.country!.substring(0, 2).toLowerCase() +
                        ".png"),
                  ),
                  Text(data.awayTeam!.name!)
                ],
              )
            ],
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Stadium : " + data.venue!),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text("Location : " + data.location!),
          ),
          Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              border: Border.all(), // Add border
            ),
            child: Column(
              children: [
                Text(
                  "Statistics",
                  style: TextStyle(
                    fontSize: 26.0,
                  ),
                ),
                Text("Ball Possession"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.ballPossession.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.ballPossession.toString())
                  ],
                ),
                Text("Shot"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.attemptsOnGoal.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.attemptsOnGoal.toString())
                  ],
                ),
                Text("Shot on Goal"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.kicksOnTarget.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.kicksOnTarget.toString())
                  ],
                ),
                Text("Corners"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.corners.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.corners.toString())
                  ],
                ),
                Text("Offside"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.offsides.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.offsides.toString())
                  ],
                ),
                Text("Fouls"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(data.homeTeam!.statistics!.foulsCommited.toString()),
                    Text(" - "),
                    Text(data.awayTeam!.statistics!.foulsCommited.toString())
                  ],
                ),
                Text("Pass Accuracy"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(passAccu(data.homeTeam!.statistics!.passesCompleted!, data.homeTeam!.statistics!.passes!).toString() + "%"),
                    Text(" - "),
                    Text(passAccu(data.awayTeam!.statistics!.passesCompleted!, data.awayTeam!.statistics!.passes!).toString() + "%"),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "Referees : ",
            style: TextStyle(
              fontSize: 26.0,
            ),
          ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemCount: data.officials!.length,
          //         itemBuilder: (BuildContext context, int index){
          //           Officials official = data.officials![index];
          //           return Container(
          //             width: 150.0,
          //             margin: EdgeInsets.only(right: 16.0),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(official.name ?? ""),
          //                 SizedBox(height: 4.0),
          //                 Text(official.role ?? ""),
          //                 SizedBox(height: 4.0),
          //                 Text(official.country ?? ""),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //     ]
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.officials!.length,
              itemBuilder: (BuildContext context, int index) {
                Officials official = data.officials![index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(), // Add border
                  ),
                  width: 150.0,
                  margin: EdgeInsets.only(right: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(official.name ?? ""),
                      SizedBox(height: 4.0),
                      Text(official.role ?? ""),
                      SizedBox(height: 4.0),
                      Text(official.country ?? ""),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    ),
  );
}

int passAccu(int a, int b){
  var pass = (a / b) * 100;
  return pass.round();
}




