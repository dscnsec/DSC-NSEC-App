 //Ye comments mat hatana baad me kaam aaega
 
 
 
 
 
 
 
 
 
            // Padding(
            //   padding: EdgeInsets.only(
            //     top: 50.0,
            //     left: 10.0,
            //     bottom: 10.0,
            //   ),
            //   child: Text(
            //     'Project Showcase',
            //     style: TextStyle(
            //       fontFamily: 'productSans',
            //       fontSize: 33.0,
            //       fontWeight: FontWeight.w400,
            //       color: Colors.grey[800],
            //     ),
            //   ),
            // ),
            
            // ProjectCard('Attendence App','Saurav Kumar','assets/images/event.jpg'),
            // ProjectCard('Birthday Wishes','Ashutosh Krishna','assets/images/event2.jpg'),
// class ProjectCard extends StatelessWidget {
//   final String title;
//   final String author;
//   final String imgpath;

//   ProjectCard(this.title, this.author,this.imgpath);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(padding: EdgeInsets.symmetric(vertical:15.0),
//           child: Container(
//         height: MediaQuery.of(context).size.height * 0.2,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           boxShadow: [
//             new BoxShadow(
//               color: Colors.grey,
//               offset: new Offset(15.0, 5.0),
//               blurRadius: 20.0,
//             )
//           ],
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(imgpath),
//                       fit: BoxFit.cover),
//                   color: Colors.yellow,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(4.0),
//                     bottomLeft: Radius.circular(4.0),
//                   ),
//                 ),
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 width: MediaQuery.of(context).size.width * 0.35,
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(4.0),
//                       bottomRight: Radius.circular(4.0),
//                     ),
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Flexible(
//                           child: Text(
//                             title,
//                             style: TextStyle(
//                               fontFamily: 'productSans',
//                               fontSize: 25.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Flexible(
//                           child: Text(
//                             author,
//                             style: TextStyle(
//                               fontFamily: 'productSans',
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                         RaisedButton(
//                           color: Colors.blue,
//                           child: Text(
//                             "View Project",
//                             style: TextStyle(
//                               fontFamily: 'productSans',
//                               fontSize: 19.0,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           onPressed: () {},
//                           shape: RoundedRectangleBorder(
//                             borderRadius: new BorderRadius.circular(30.0),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }