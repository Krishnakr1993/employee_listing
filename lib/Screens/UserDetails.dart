
import 'package:employee_list/Models/Repos.dart';
import 'package:employee_list/Models/Users.dart';
import 'package:employee_list/Screens/SearchScreen.dart';
import 'package:employee_list/Services/RepoList.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserDetails extends StatefulWidget {
  final User selectedUser;

  UserDetails({required this.selectedUser});

  @override
  State<StatefulWidget> createState() {
    return _UserDetailsState(selectedUser);
  }
}

class _UserDetailsState extends State<UserDetails> {
  final User user;

  _UserDetailsState(this.user);
  List<Repo> ulist = [];
  List<Repo> userLists = [];
  int selectedIndex = 0;
  List<Widget> listWidgets = [
    SearchScreen(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       
        appBar: AppBar(
          title: Text(user.name),
        ),
        //  body: listWidgets[selectedIndex],
        body: Builder(
          builder: (context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              child: Container(
                                alignment: Alignment(0.0, 2.5),
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(user.profileImage),
                                  radius: 60.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            user.name,
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.blueGrey,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.email,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black45,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                          ),
                           SizedBox(
                            height: 10,
                          ),
                          Text(
                            user.website,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black45,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 8.0),
                              elevation: 2.0,
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Address",
                                          style: TextStyle(
                                               color: Colors.blueAccent,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          user.address!.street,
                                          style: TextStyle(
                                              letterSpacing: 2.0
                                            ),
                                        ),
                                        Text(
                                          user.address!.suite,
                                          style: TextStyle(
                                              letterSpacing: 2.0
                                            ),
                                        ),
                                        Text(
                                          user.address!.city,
                                          style: TextStyle(
                                              letterSpacing: 2.0
                                            ),
                                        ),
                                        Text(
                                          user.address!.zipcode,
                                          style: TextStyle(
                                              letterSpacing: 2.0
                                            ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        
                                      ],
                                    )),
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Company Details",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600),
                                        ),

                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                         user.company!.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                             
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                         user.company!.catchPhrase,
                                          style: TextStyle(
                                              color: Colors.black,
                                              
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                         user.company!.bs,
                                          style: TextStyle(
                                              color: Colors.black,
                                             
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                
              ],
            ),
          ),
        ));
  }
 
}
