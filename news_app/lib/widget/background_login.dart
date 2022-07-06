import 'package:flutter/material.dart';


class BackGroundScreen extends StatelessWidget {

  final Widget childbody ;
  final IconData iconAvatar;

  const BackGroundScreen({key,  this.childbody ,  this.iconAvatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children:  [
          _PurpleBoxHeader(),
          _avatarIcon(), 
           childbody, 
        ],
      ),
    );
  }

  Widget _avatarIcon (){
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon( iconAvatar, color: Colors.white, size: 100, ),
      )
    );
  } 

}


class _PurpleBoxHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final mediaquery = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: mediaquery.height * 0.4,
      decoration: decorationPurple(),
      child: Stack(
        children: [
          _Bubble(),
          Positioned(child: _Bubble() , top: 50, left: 240,),
          Positioned(child: _Bubble() , top: 190, left: 50,),
          Positioned(child: _Bubble() , top: -40, left: 140,),
          Positioned(child: _Bubble() , top: 180, right: 20,),
        ],
      ),
    );
  }

  BoxDecoration decorationPurple (){
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ])
    );
  }
}


class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.07),
      ),
    );
  }
}