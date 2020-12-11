import 'dart:convert';
import 'package:dscnsec_app/screens/teams/teams_data/Team_Data_Holder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

var teamCategoryFinal;

//Upcoming Events at Events Page REST api --starts here--->>
Future<Album> fetchAlbum() async {
  final response = await http.get(
      'https://www.attendanceapp.ml/dsc_testing/${teamCategoryFinal}.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load up_event data');
  }
}

//Data Holder
class Album {
  final List<dynamic> id;

  final List<dynamic> name;

  final List<dynamic> designation;

  final List<dynamic> desc;

  final List<dynamic> skills;

  final List<dynamic> dp;

  final List<dynamic> email;

  final List<dynamic> alt_email;

  final List<dynamic> stream;

  final List<dynamic> linkedin;

  final List<dynamic> github;

  final List<dynamic> website;

  final List<dynamic> blog;

  final List<dynamic> facebook;

  final List<dynamic> twitter;

  final List<dynamic> instagram;

  Album(
      {this.id,
      this.name,
      this.designation,
      this.desc,
      this.skills,
      this.dp,
      this.email,
      this.alt_email,
      this.stream,
      this.linkedin,
      this.github,
      this.website,
      this.blog,
      this.facebook,
      this.twitter,
      this.instagram});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        name: json['name'],
        designation: json['designation'],
        desc: json['desc'],
        skills: json['skills'],
        dp: json['dp'],
        email: json['email'],
        alt_email: json['alt_email'],
        stream: json['stream'],
        linkedin: json['linkedin'],
        github: json['github'],
        website: json['website'],
        blog: json['blog'],
        facebook: json['facebook'],
        twitter: json['twitter'],
        instagram: json['instagram']);
  }
}
//Ends upcoming events Rest API -->>

class teamDetails extends StatefulWidget {
  var teamCategory;
  var teamColor;

  teamDetails(this.teamCategory, this.teamColor);

  @override
  State<StatefulWidget> createState() {
    return teamDetailsState(this.teamCategory, this.teamColor);
  }
}

class teamDetailsState extends State<teamDetails>
    with TickerProviderStateMixin {
  var teamCategory;
  var teamColor;

  //
  Future<Album> futureAlbum;

  //

  teamDetailsState(this.teamCategory, this.teamColor);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teamCategoryFinal = teamCategory == "\nManagementTeam\n❯"
        ? "Management Team"
        : teamCategory.toString().split("\n")[0];
    teamCategoryFinal = teamCategoryFinal.toString().replaceAll(" ", "_");
    debugPrint(teamCategoryFinal);

    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          // AnimatedBackground(
          //   behaviour: RandomParticleBehaviour(
          //       options: ParticleOptions(baseColor: teamColor, spawnMaxSpeed: 150)),
          //   vsync: this,
          //   child:
          SafeArea(
        child: Stack(children: [
          //Future builder from Restful api starts from here /////-->>
          FutureBuilder<Album>(
              future: futureAlbum,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  id = snapshot.data.id;
                  name = snapshot.data.name;
                  designation = snapshot.data.designation;
                  desc = snapshot.data.desc;
                  skills = snapshot.data.skills;
                  dp = snapshot.data.dp;
                  email = snapshot.data.email;
                  alt_email = snapshot.data.alt_email;
                  stream = snapshot.data.stream;
                  linkedin = snapshot.data.linkedin;
                  github = snapshot.data.github;
                  website = snapshot.data.website;
                  blog = snapshot.data.blog;
                  facebook = snapshot.data.facebook;
                  twitter = snapshot.data.twitter;
                  instagram = snapshot.data.instagram;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                        ),
                        //Cards-->>
                        for (int i = 0; i < name.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 20),
                            child: Card(
                                elevation: 2,
                                child: Column(children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 55,
                                        child: ClipOval(
                                            child: FadeInImage.assetNetwork(
                                          fadeInCurve: Curves.bounceIn,
                                          fadeInDuration:
                                              const Duration(seconds: 1),
                                          placeholder:
                                              'assets/images/loading.gif',
                                          image: dp[i],
                                          fit: BoxFit.fill,
                                        )),
                                      )),
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 2, 20, 10),
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Text(
                                        name[i],
                                        style: TextStyle(
                                          fontFamily: 'productSans',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      )),
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 15),
                                      decoration:
                                          BoxDecoration(shape: BoxShape.circle),
                                      child: Text(designation[i],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'productSans',
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                          ))),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 1,
                                        ),
                                        if (linkedin[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(linkedin[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child: Icon(
                                                  FontAwesomeIcons.linkedin),
                                            ),
                                          ),
                                        if (github[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(github[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child:
                                                  Icon(FontAwesomeIcons.github),
                                            ),
                                          ),
                                        if (twitter[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(twitter[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child: Icon(
                                                  FontAwesomeIcons.twitter),
                                            ),
                                          ),
                                        if (facebook[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(facebook[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child: Icon(
                                                  FontAwesomeIcons.facebook),
                                            ),
                                          ),
                                        if (instagram[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(instagram[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child: Icon(
                                                  FontAwesomeIcons.instagram),
                                            ),
                                          ),
                                        if (website[i] != "")
                                          GestureDetector(
                                            onTap: () {
                                              _launchAnyURL(website[i]);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 3, 10),
                                              child: Icon(Icons.language),
                                            ),
                                          ),
                                      ]),
                                ])),
                          ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Oops! Unable to fetch info. Check your network or Try Again.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: teamColor,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: RaisedButton.icon(
                              color: teamColor,
                              onPressed: () {
                                setState(() {
                                  futureAlbum = fetchAlbum();
                                });
                              },
                              icon: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Refresh",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  );
                } else
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                        backgroundColor: teamColor,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                    ],
                  );
              }),
          Column(
            children: [
              Card(
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 5),
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: teamColor,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "DSC NSEC",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 12.0, top: 5.0, bottom: 5),
                      child: CircleAvatar(
                        radius: 29.0,
                        child: dsclogo(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 18),
                child: Chip(
                  elevation: 2,
                  backgroundColor: Colors.white,
                  label: Text(
                    teamCategory == "\nManagementTeam\n❯"
                        ? "Management Team"
                        : teamCategory.toString().split("\n")[0],
                    style: TextStyle(
                      fontFamily: 'productSans',
                      fontSize: 33.0,
                      fontWeight: FontWeight.w500,
                      color: teamColor,
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  // DSC NSEC LOGO
  Widget dsclogo() {
    var assetImage = AssetImage("assets/images/dsclogo.png");
    var image = Image(
      image: assetImage,
      height: 100,
      width: 100,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }

  //Any URL Launcher
  _launchAnyURL(var getUrl) async {
    var url = getUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
