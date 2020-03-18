
import 'package:chatapp/resources/firebase_repository.dart';
import 'package:chatapp/utils/universal_variables.dart';
import 'package:chatapp/utils/utilities.dart';
import 'package:chatapp/widgets/appbar.dart';
import 'package:chatapp/widgets/custom_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ChatListScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

final FirebaseRepository _repository = FirebaseRepository();

class _State extends State<ChatListScreen> {
  String currentUserId;
  String initials;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository.getCurrentUser().then((FirebaseUser user) {
     setState(() {
       currentUserId = user.uid;
       initials = Utils.getInitials(user.displayName);
     });
    });
  }

  CustomAppBar customAppBar(BuildContext context)
  {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        onPressed: (){},
      ),
      title: UserCircle(text: initials),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pushNamed(context, "/search_screen");
          },
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: (){

          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      floatingActionButton: NewChatButton(),
      body: ChatListContainer(currentUserId),
    );
  }
}

class ChatListContainer extends StatefulWidget {

  final String currentUserId;
  ChatListContainer(this.currentUserId);

  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: 2,
        itemBuilder: (context,index){
          return CustomTile(
            mini: false,
            onTap: () {},
            title: Text(
              "Ashutosh Pradhan",
              style: TextStyle(
                color: Colors.white, fontFamily: "Arial", fontSize: 18
              ),
            ),
          subtitle: Text(
          "Hello",
          style: TextStyle(
          color: UniversalVariables.greyColor,
          fontSize: 14,
          ),
          ),
            leading: Container(
              constraints: BoxConstraints(
                maxHeight: 60,
                maxWidth: 60,
              ),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage('https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg'),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: UniversalVariables.onlineDotColor,
                          border: Border.all(
                            color: UniversalVariables.blackColor,
                            width: 1,
                          )
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class UserCircle extends StatelessWidget {
 String text;
 UserCircle({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: UniversalVariables.separatorColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              text!=null?text:'Default Value',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UniversalVariables.lightBlueColor,
                fontSize: 13,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: UniversalVariables.blackColor,
                  width: 2
                ),
                color: UniversalVariables.onlineDotColor
              )

            ),
          )
        ],
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: UniversalVariables.fabGradient,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Icon(
        Icons.edit,
        color: Colors.white,
        size: 25,
      ),
      padding: EdgeInsets.all(25.0),
    );
  }
}


