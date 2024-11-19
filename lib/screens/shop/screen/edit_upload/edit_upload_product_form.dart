 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/components_buttons/snackbar.dart';
import 'package:myproject/screens/shop/screen/edit_upload/bloc/edit_bloc.dart'; 
import 'package:myproject/screens/shop/screen/edit_upload/component/body.dart'; 
import 'package:myproject/size_config.dart';
 

class EditOrUploadProductScreen extends StatefulWidget {
  static const routeName = '/EditOrUploadProductScreen';

  const EditOrUploadProductScreen({
    super.key,
  });

  @override
  State<EditOrUploadProductScreen> createState() =>
      _EditOrUploadProductScreenState();
}

class _EditOrUploadProductScreenState extends State<EditOrUploadProductScreen> {
  final EditBloc editBloc = EditBloc();
  
  @override
  void initState() {
    editBloc.add(EditInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<EditBloc, EditState>(
      bloc: editBloc,
      listenWhen: (previous, current) => current is EditActionState,
      buildWhen: (previous, current) => current is! EditActionState,
      listener: (context, state) {
        if (state is EditUploadedSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarLoginSuccess('Thêm sản phẩm thành công'),);
          editBloc.add(EditInitialEvent());
        }
        // if (state is HomeProductClickedState) {
        //   Navigator.pushNamed(context, ProductScreen.routeName,
        //       arguments: state.productId);
        // }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case EditLoadingState:
            return const Center(child: CircularProgressIndicator(),);
          case EditLoadedSuccessState:
            final successState = state as EditLoadedSuccessState;
            return GestureDetector(
              onTap: (){
                FocusScope.of(context).unfocus();
              } ,
              child: Body(editBloc: editBloc,),
            );
            //xemlai
          case EditErrorState:
            final errorState = state as EditErrorState;
            return Center(child: Text('Lỗi abc'),);
          
          case EditErrorScreenToLoginState:
            return const SizedBox(
                child: Center(
              child: Text('HomeErrorScreenToLoginState'),
            ));
          default:
            return const SizedBox();
        }
      },
    );
  }
  
  
}

