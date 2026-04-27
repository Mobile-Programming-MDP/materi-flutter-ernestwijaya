import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _descriptionController = TextEditingController();

  //list category
  
  String? _base64Image;
  String? _latitude;
  String? _longitude;

  List<String> get _categories {
    return [
      "Jalan rusak", 
      "Lampu mati", 
      "Lawan arah",
      "Merokok di jalan",
      "Tidak pakai Helm"
      ];
  }
  String? _category;

  //1. fungsi pick, compress, dan convert image
  Future<void> pickImageAndConvert() async {}

  //2. fungsi get geo location
  Future<void> _getGeoLocation() async {}

  //3. fungsi tampil pilihan category
  void _showCategorySelect(){
    showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: _categories.map((category) {
            return ListTile(
              title: Text(category),
              onTap: () {
                setState(() {
                  _category = category;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}