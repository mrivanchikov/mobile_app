
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserProfilePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, required this.title});

  final String title;

  @override
  State<UserProfilePage> createState() => _UserProfilePage();
}

class _UserProfilePage extends State<UserProfilePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [UserProfileImage(), UserInfo(),SwitchButton(),],
      ) ,
    );
  }
}

//---------

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({Key? key}) : super(key: key);

  @override
  State<UserProfileImage> createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {

  AssetImage getPicture(String picturePass){
    return AssetImage(picturePass);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        CircleAvatar(
          backgroundImage: getPicture('assets/images/photo.png'),
          radius: 70.0,
      ),
    );
  }
}

//---------

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  String getNickname({String nickName='Пользователь'}){
    return nickName;
  }

  String getUserStatus({String userStatus='Базовый аккаунт'}){
    return userStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(
              children:[
                Text(getNickname(nickName: 'Валерий Сацура')),
                Text(getUserStatus(userStatus: 'VIP клиент')),
          ])

    );
  }
}

//--------


/*добавить отрисовку меню к кнопке а не к main*/
class SwitchButton extends StatefulWidget {
  SwitchButton({Key? key}) : super(key: key);

  final List<bool> selectedOptions = <bool>[true, false];
  final int myDiscounts = 0, myAutos=1;
  Widget showInfo(){
    if(selectedOptions[myDiscounts]==true) {
        return MainPageInfo(/*DiscountField()*/);
      }
    else{
      return MainPageInfo(/*AutosField*/);
    }
  }

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  String switchKeyOptions(String keyOption){
    return keyOption;
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [ToggleButtons(
        isSelected: widget.selectedOptions,
        onPressed: (int index){
          setState(() {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < widget.selectedOptions.length; i++) {
              widget.selectedOptions[i] = i == index;
            }
          });
        },
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Colors.red[700],
        selectedColor: Colors.white,
        fillColor: Colors.red[200],
        color: Colors.red[400],
        constraints: const BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
        children: [Text(switchKeyOptions('Мои скидки')), Text(switchKeyOptions('Мои авто'))],
      ),
    ]);
  }
}

//-------------

class MainPageInfo extends StatefulWidget {
  MainPageInfo({Key? key, Widget? info= const DiscountField()}) : super(key: key);

  Widget infoType = info;
  void setInfoType(Widget infoType){
    this.infoType=infoType;
  }

  @override
  State<MainPageInfo> createState() => _MainPageInfoState();
}

class _MainPageInfoState extends State<MainPageInfo> {



  void setInfoType(Widget newInfoType){
    widget.infoType = newInfoType;
  }


  List<Widget> infoList = <Widget>[];

  List<Widget> setInfo(List<Widget> defaultInfo, Widget newInfoType){
    defaultInfo.add(newInfoType);
    return defaultInfo;
  }

  @override
  Widget build(BuildContext context) {
    for (int i =0; i<2; i++){
      setInfo(infoList, widget.infoType);
    }
    return Expanded(child: ListView(
      padding: const EdgeInsets.all(8),
      children: infoList,)
    );
  }
}
//--------------------

class DiscountField extends StatefulWidget {
  const DiscountField({Key? key}) : super(key: key);

  @override
  State<DiscountField> createState() => _DiscountFieldState();
}

class _DiscountFieldState extends State<DiscountField> {

  String getCouponName({String couponName='Купон отсутствует' }){
    return couponName;
  }

  String getCouponValue({String couponValue='-------'}){
    return couponValue;
  }

  String getCouponStatus({String couponStatus='недействителен'}){
    return couponStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(getCouponName()),
          Text(getCouponValue()),
          Text(getCouponStatus()),
        ],
      ),
    );
  }
}

//-------------------------------

class CarField extends StatefulWidget {
  const CarField({Key? key}) : super(key: key);

  @override
  State<CarField> createState() => _CarFieldState();
}

class _CarFieldState extends State<CarField> {

  String getCarName({String carName='Авто отсутствует' }){
    return carName;
  }

  String getCarValue({String carValue='-------'}){
    return carValue;
  }

  String getCarStatus({String carStatus='недействителен'}){
    return carStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(getCarName()),
          Text(getCarValue()),
          Text(getCarStatus()),
        ],
      ),
    );
  }
}
