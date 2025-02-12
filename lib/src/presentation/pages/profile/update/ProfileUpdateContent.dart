import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {

User? user;
  
  ProfileUpdateContent (this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _imageBackground(context),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _imageProfile(),
                // Spacer(),
                _cardProfileInfo(context)
              ],
            ),
          ),
        ),
        DefaultIconBack(
          left: 15, top: 50
          )
      ],
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _textFieldName(),
            _textFieldLastname(),
            _textFieldPhone(),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 10, top: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {},
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

   Widget _textFieldName() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Nombre',
            icon: Icons.person_4,
            // errorText: snapshot.error?.toString(),
            onChange: (text) {
              // bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
            },
            // validator: (value) {
            //   return state.email.error;
            // }
          )
    );
  }

     Widget _textFieldLastname() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Apellido',
            icon: Icons.person_outline,
            // errorText: snapshot.error?.toString(),
            onChange: (text) {
              // bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
            },
            // validator: (value) {
            //   return state.email.error;
            // }
          )
    );
  }

     Widget _textFieldPhone() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Telefono',
            icon: Icons.phone,
            // errorText: snapshot.error?.toString(),
            onChange: (text) {
              // bloc?.add(EmailChanged(email: BlocFormItem(value: text)));
            },
            // validator: (value) {
            //   return state.email.error;
            // }
          )
    );
  }

  Widget _imageProfile() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1/1,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/img/user.png', 
            image: 'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
            fit: BoxFit.cover,
            fadeInDuration:  Duration(seconds: 1),
            ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset('assets/img/background3.jpg',
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
    color: Color.fromRGBO(0, 0, 0, 0.7),
    colorBlendMode: BlendMode.darken,
    );
  }
}