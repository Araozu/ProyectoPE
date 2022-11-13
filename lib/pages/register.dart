import "package:flutter/material.dart";

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 50),
                alignment: Alignment.center,
                child: Text(
                  "BIENVENIDO",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xfff91f1f)
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 40),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),

                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Nombres",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Apellidos",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Correo",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Pais",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Region",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Provincia",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Distrito",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 33, right: 33, top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(fontSize: 15),
                  obscureText: true,
                  cursorColor: Color(0xfff91f1f),
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {

                },
                child: Container(
                  margin: EdgeInsets.only(left: 33, right: 33, top: 40),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  alignment: Alignment.center,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(
                        offset: Offset(0, 10),
                        color: Color(0xfff91f1f)
                    )],
                  ),
                  child: Text(
                    "Ingresar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),
                  ),
                ),
              ),



            ],
          )
      ),
    );
  }
}
