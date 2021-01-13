import 'package:flutter/material.dart';
import 'package:goals/providers/goal_provider.dart';
import 'package:goals/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import './select_image.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime selectedDate;

  _showDatePicker(BuildContext context) async {
    DateTime datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      helpText: 'Escolha uma data',
      confirmText: 'ESCOLHER',
      cancelText: 'CANCELAR',
    );

    if (datePicker == null) {
      return;
    }
    print(datePicker);

    setState(() {
      selectedDate = datePicker;
    });
  }

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _createGoal() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedDate != null) {
      print('Salvar meta');
      Provider.of<GoalProvider>(context, listen: false).createGoal(
        titleController.text,
        descriptionController.text,
        selectedDate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SelectImage(),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: titleController,
              style: TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Título',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Descrição',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate == null
                    ? 'Prazo não selecionado'
                    : 'Data: ${DateFormat("d MMM y").format(selectedDate)}',
                style: TextStyle(
                  color: Color(0xFF868B90),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              FlatButton(
                onPressed: () {
                  _showDatePicker(context);
                },
                child: Text(
                  selectedDate == null ? 'Selecionar prazo' : 'Modificar prazo',
                  style: TextStyle(color: Colors.white),
                ),
                color: kPrimaryColor,
              )
            ],
          ),
          Spacer(),
          FlatButton(
            minWidth: double.infinity,
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            height: 50,
            onPressed: () {
              _createGoal();
              Navigator.of(context).pop();
            },
            child: Text(
              '+ Criar meta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
