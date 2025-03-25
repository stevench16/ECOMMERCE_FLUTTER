import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextfield.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateEvent.dart';


class AdminProductCreateContent extends StatelessWidget {
  
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;


  AdminProductCreateContent(this.bloc,this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: state.formKey,      
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imageBackground(context),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _imageProductOne(context),
                        SizedBox(width: 20,),
                        _imageProductTwo(context)
                      ],
                    ),
                    _cardCategoryForm(context)
                  ],
                ),
              ),
            ),
            //DefaultIconBack(left: 0, top: 0),
            Positioned(
              left: -33,
              top: -70,
              child: DefaultIconBack(
                left: 0,top: 0
              ),
            ),
          ],
        )
    );
  }

  Widget _cardCategoryForm(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.53,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255,255,255,0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewProduct(),
            _textFieldName(),
            _textFieldDescription(),
            _textFieldPrice(),
            _fabSubmit()
          ],
        ),
      ),
    );

  }
  
  Widget _fabSubmit(){
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: (){
          if (state.formKey!.currentState!.validate()){
            bloc?.add(FormSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVO PRODUCTO',
        style: TextStyle(
          fontSize: 17
        ),
      ),
    );
  }

  Widget _textFieldName(){
    return DefaultTextField(
      label: 'Nombre del Producto',
      icon: Icons.category, 
      onChange: (text){
        bloc?.add(AdminProductCreateNameChanged(name:BlocFormItem(value: text)));
      },
      validator: (value){
        return state.name.error;
      },
      color: Colors.black,
    );
  }

Widget _textFieldPrice(){
  return DefaultTextField(
    label: 'Precio del Producto',
    icon: Icons.money,       
    keyboardType: TextInputType.number, // ✅ Ahora sí está bien
    onChange: (text){
      bloc?.add(AdminProductCreatePriceChanged(price:BlocFormItem(value: text)));
    },
    validator: (value){
      return state.price.error;
    },
    color: Colors.black,
  );
}


  Widget _textFieldDescription(){
    return DefaultTextField(
      label: 'Descripción', 
      icon: Icons.list, 
      onChange: (text){
        bloc?.add(AdminProductCreateDescriptionChanged(description:BlocFormItem(value: text)));
      },
      validator: (value){
        return state.description.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageProductOne(BuildContext context){
    return GestureDetector(
      onTap: (){
        SelectOptionImageDialog(
          context, 
          () {bloc?.add(PickImage(numberFile: 1));}, 
          (){bloc?.add(TakePhoto(numberFile: 1));}
        );
      },
      child :Container(
      width: 150,
      margin: EdgeInsets.only(top: 100),
      child: AspectRatio(
        aspectRatio:1/1,
        child: ClipOval(
          child: state.file1 !=null
           ? Image.file(
              state.file1!,
              fit: BoxFit.cover
             )
             :Image.asset(
              'assets/img/no-image.png',
              fit: BoxFit.cover,
          ),
        ),
      ),
     ),
    );
  }

  Widget _imageProductTwo(BuildContext context){
    return GestureDetector(
      onTap: (){
        SelectOptionImageDialog(
          context, 
          () {bloc?.add(PickImage(numberFile: 2));}, 
          (){bloc?.add(TakePhoto(numberFile: 2));}
        );
      },
      child :Container(
      width: 150,
      margin: EdgeInsets.only(top: 100),
      child: AspectRatio(
        aspectRatio:1/1,
        child: ClipOval(
          child: state.file2 !=null
           ? Image.file(
              state.file2!,
              fit: BoxFit.cover
             )
             :Image.asset(
              'assets/img/no-image.png',
              fit: BoxFit.cover,
          ),
        ),
      ),
     ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/background4.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
