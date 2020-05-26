import 'package:covid_app/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/pages/pak.dart';
import 'package:covid_app/pages/chi.dart';
import 'package:covid_app/pages/nep.dart';


class Ban extends StatefulWidget {
  @override
  _BanState createState() => _BanState();
}

class _BanState extends State<Ban> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
        elevation: 0,
        titleSpacing: 10,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('total confirm'.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontFamily: 'Bebas',
          fontWeight: FontWeight.bold,
          fontSize: 35
          ),),
            
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('statCollection').snapshots(),
        builder: (context, snapshot)  {
          if(!snapshot.hasData) return Text('...');
          return Column(
            
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(top: 0),
              ),
              Text(
                snapshot.data.documents[0]['confirm'].toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 80,
                  fontFamily: 'Bebas',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'INFECTED'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'RECOVERED'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    LinearPercentIndicator(
                      lineHeight: 8.0,
                      percent: 0.62,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor:
                          Theme.of(context).accentColor.withAlpha(30),
                      progressColor: Theme.of(context).primaryColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                    ),
                    Text(
                      'BANGLADESH'.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'Bebas',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   
                  ],
                ),
              ),
              Divider(
                height: 32,
                color: Colors.grey[300],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'CURRENT',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data.documents[0]['active'].toString(),                     
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'RECOVERIES',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data.documents[0]['recovered'].toString(),                     
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'DEATHS',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data.documents[0]['death'].toString(),                     
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 25,
                color: Colors.grey[300],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'STATS FOR NEARBY COUNTRIES',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24,
                      fontFamily: 'Bebas',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: 230,
                padding: EdgeInsets.fromLTRB(10, 27, 0, 10),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    StatCard(
                      title: 'INDIA',
                      total: snapshot.data.documents[2]['confirm'],
                      achieved: snapshot.data.documents[2]['confirm'] - snapshot.data.documents[4]['recovered'],
                      color: Theme.of(context).primaryColor,
                      image: Image.asset('assets/img/india.png', width: 30),
                      link: 'ind'
                    ),
                    StatCard(
                      title: 'PAKISTAN',
                      total: snapshot.data.documents[4]['confirm'],
                      achieved: snapshot.data.documents[4]['confirm'] - snapshot.data.documents[4]['recovered'],
                      color: Theme.of(context).primaryColor,
                      image: Image.asset('assets/img/pakistan.png', width: 30),
                      link: 'pak',
                    ),
                    StatCard(
                      title: 'CHINA',
                      total: snapshot.data.documents[1]['confirm'],
                      achieved: snapshot.data.documents[1]['confirm'] - snapshot.data.documents[1]['recovered'],
                      color: Theme.of(context).primaryColor,
                      image: Image.asset('assets/img/china.png', width: 30),
                      link: 'chi',
                    ),
                    StatCard(
                      title: 'NEPAL',
                      total: snapshot.data.documents[3]['confirm'],
                      achieved: snapshot.data.documents[3]['confirm'] - snapshot.data.documents[3]['recovered'],
                      color: Theme.of(context).primaryColor,
                      image: Image.asset('assets/img/srilanka.png', width: 30),
                      link: 'nep',
                    ),
                  ],
                ),
              ),
            ],
        
          );  
      }, 
      )
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final int total;
  final int achieved;
  final Image image;
  final Color color;
  final String link;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.image,
    @required this.color,
    @required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).accentColor.withAlpha(100),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: achieved / (total < achieved ? achieved : total),
            circularStrokeCap: CircularStrokeCap.round,
            center: image,
            progressColor: color,
            backgroundColor: Theme.of(context).accentColor.withAlpha(30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
              TextSpan(
                text: ' / $total',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    ),
    onTap: () {                          
        Navigator.push(
    context,
    link == 'pak' ? MaterialPageRoute(builder: (context) => Pak()): link == 'ind' ? MaterialPageRoute(builder: (context) => Dashboard()): link == 'chi' ? MaterialPageRoute(builder: (context) => Chi()): link == 'nep' ? MaterialPageRoute(builder: (context) => Nep()): "lol",
  );
        }, 
      );
    }
}