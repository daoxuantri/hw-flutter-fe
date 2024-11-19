import 'dart:io';
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/screens/shop/screen/edit_upload/bloc/edit_bloc.dart';
import 'package:myproject/screens/shop/validator/my_validators.dart';
import 'package:myproject/screens/shop/widget/subtitle_text.dart';
import 'package:myproject/screens/shop/widget/title_text.dart';
import 'package:myproject/size_config.dart';

class Body extends StatefulWidget {
  final EditBloc editBloc ; 
  const Body({super.key, required this.editBloc});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController,
      _priceController,
      _descriptionController;

  File? _selectedImage ;

  @override
  void initState() {
    _nameController = TextEditingController(text: "");
    _priceController = TextEditingController(text: "");
    _descriptionController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void clearForm() {
    _nameController.clear();
    _priceController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedImage = null; // Xóa ảnh
    });
  }

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery, // Hoặc ImageSource.camera nếu muốn chụp ảnh
      maxHeight: 800,
      maxWidth: 800,
    );

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomSheet: SizedBox(
        height: getProportionateScreenHeight(50),
        child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.clear),
                label: const Text(
                  "Clear",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: clearForm,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.upload),
                label: const Text(
                  "Upload Product",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid || _selectedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields and select an image")),
                    );
                    return;
                  }

                  widget.editBloc.add(
                    EditProductClickedEvent(
                      name: _nameController.text.trim(),
                      description: _descriptionController.text.trim(),
                      price: double.parse(_priceController.text.trim()),
                      image: _selectedImage!.path,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const TitlesTextWidget(
          label: "Upload a new product",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              /* Image picker here ***********************************/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _pickImage, // Gọi hàm chọn ảnh
                      icon: const Icon(Icons.image),
                      label: const Text("Pick Image"),
                    ),
                    const SizedBox(height: 10),
                    _selectedImage == null // Kiểm tra nếu chưa chọn ảnh
                        ? const Text("No image selected.")
                        : SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.file(
                              _selectedImage!, // Hiển thị ảnh được chọn
                              fit: BoxFit.cover,
                            ),
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              /* Form fields *******************************************/
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        key: const ValueKey('Name'),
                        maxLength: 80,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Product Name',
                        ),
                        validator: (value) {
                          return MyValidators.uploadProdTexts(
                            value: value,
                            toBeReturnedString: "Please enter a valid name",
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _priceController,
                        key: const ValueKey('Price \$'),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d+)?\.?\d{0,2}'),
                          ),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Price',
                          prefix: SubtitleTextWidget(
                            label: "\$ ",
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        validator: (value) {
                          return MyValidators.uploadProdTexts(
                            value: value,
                            toBeReturnedString: "Price is missing",
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        key: const ValueKey('Description'),
                        controller: _descriptionController,
                        minLines: 5,
                        maxLines: 8,
                        maxLength: 1000,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          hintText: 'Product Description',
                        ),
                        validator: (value) {
                          return MyValidators.uploadProdTexts(
                            value: value,
                            toBeReturnedString: "Description is missed",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: kBottomNavigationBarHeight + 10),
            ],
          ),
        ),
      ),
    );
  }
}
