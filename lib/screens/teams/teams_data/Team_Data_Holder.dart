import 'package:dscnsec_app/screens/teams/teamDetailMember.dart';
import 'package:flutter/cupertino.dart';

/***CORE Team Data Holder***/
//Core team Data Starts here ->

List<dynamic> id = [0];
List<dynamic> name = ["..."];
List<dynamic> designation = ["..."];
List<dynamic> desc = ["..."];
List<dynamic> skills = ["..."];
List<dynamic> dp = ["..."];
List<dynamic> email = ["..."];
List<dynamic> alt_email = ["..."];
List<dynamic> stream = ["..."];
List<dynamic> linkedin = ["..."];
List<dynamic> github = ["..."];
List<dynamic> website = ["..."];
List<dynamic> blog = ["..."];
List<dynamic> facebook = ["..."];
List<dynamic> twitter = ["..."];
List<dynamic> instagram = ["..."];

//Ends here ->

class TeamMemberDetail {
  String name;
  String designation;
  String desc;
  String skills;
  String dp;
  String email;
  String stream;
  String linkedin;
  String github;
  String website;
  String blog;
  String facebook;
  String twitter;
  String instagram;
  Color color;

  TeamMemberDetail(
      {this.name = "",
      this.designation = "",
      this.desc = "",
      this.skills = "",
      this.dp = "",
      this.email = "",
      this.stream = "",
      this.linkedin = "",
      this.github = "",
      this.website = "",
      this.blog = "",
      this.facebook = "",
      this.twitter = "",
      this.instagram = "",
      this.color});
}
