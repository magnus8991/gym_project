import 'package:flutter/material.dart';
import 'package:gym/ui/widgets/Inputs.dart';
import 'package:gym/ui/widgets/app_background.dart';
import 'package:gym/ui/widgets/button.dart';
import 'package:gym/ui/widgets/controlfecha.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/entities/gym.dart';
import '../../../widgets/dialog.dart';

class RegisterScreen extends StatefulWidget {
  final User user;

  const RegisterScreen({super.key, required this.user});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalWidgetDialog globalDialog = GlobalWidgetDialog();
  final TextEditingController identificationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailUserController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameGymController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailGymController = TextEditingController();

  void createUser() {
    if (nameController.text.isNotEmpty &&
        surnameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        identificationController.text.isNotEmpty &&
        emailUserController.text.isNotEmpty &&
        nameGymController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        emailGymController.text.isNotEmpty) {
      widget.user.identification = identificationController.text;
      widget.user.name = nameController.text;
      widget.user.surname = surnameController.text;
      widget.user.email = emailUserController.text;
      widget.user.userName = userNameController.text;
      widget.user.password = passwordController.text;
      widget.user.gym = Gym();
      widget.user.gym!.name = nameGymController.text;
      widget.user.gym!.address = addressController.text;
      widget.user.gym!.phoneNumber = phoneNumberController.text;
      widget.user.gym!.email = emailGymController.text;
      Navigator.pop(context, {widget.user});
    } else {
      globalDialog.seeDialog(context, "Debe diligenciar todos los campos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Crea tu cuenta', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(30), child: Text(
                "Datos del propietario",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 25))),
              RadialInput(
                controller: identificationController,
                color: Colors.white,
                icon: FontAwesomeIcons.idCard,
                label: "Identificación",
                obscureText: false,
              ),
              RadialInput(
                controller: nameController,
                color: Colors.white,
                icon: Icons.drive_file_rename_outline,
                label: "Nombre(s)",
                obscureText: false,
              ),
              RadialInput(
                controller: surnameController,
                color: Colors.white,
                icon: Icons.drive_file_rename_outline,
                label: "Apellido(s)",
                obscureText: false,
              ),
              RadialInput(
                controller: emailUserController,
                color: Colors.white,
                icon: Icons.markunread,
                label: "Correo electrónico",
                obscureText: false,
              ),
              RadialInput(
                controller: userNameController,
                color: Colors.white,
                icon: FontAwesomeIcons.circleUser,
                label: "Nombre de Usuario",
                obscureText: false,
              ),
              RadialInput(
                controller: passwordController,
                color: Colors.white,
                icon: Icons.lock,
                label: "Contraseña",
                obscureText: true,
              ),Padding(padding: EdgeInsets.all(20), child: Text(
                  "Datos del gimnasio",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 25))),
              RadialInput(
                controller: nameGymController,
                color: Colors.white,
                icon: Icons.sports_martial_arts,
                label: "Nombre del gimnasio",
                obscureText: false,
              ),
              RadialInput(
                controller: addressController,
                color: Colors.white,
                icon: Icons.location_city,
                label: "Dirección",
                obscureText: false,
              ),
              RadialInput(
                controller: phoneNumberController,
                color: Colors.white,
                icon: Icons.phone,
                label: "Teléfono",
                obscureText: false,
              ),
              RadialInput(
                controller: emailGymController,
                color: Colors.white,
                icon: Icons.markunread,
                label: "Correo electrónico",
                obscureText: false,
              ),
              RadialButton(
                  color: Colors.black,
                  text: "Crear cuenta",
                  press: createUser,
                  textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
