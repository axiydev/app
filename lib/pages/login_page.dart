import 'package:app/models/user_model.dart';
import 'package:app/pages/signup_page.dart';
import 'package:app/service/pref_servise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LoginPage extends StatefulWidget {
  static final id='login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController=new TextEditingController();
  final TextEditingController passwordController=new TextEditingController();
  void _login(){
    String _email=emailController.text.trim();
    String _pass=passwordController.text.trim();
    User user=new User.from(email: _email,password: _pass);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user){
      print(user.email);
      print(user.password);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        width: double.infinity,
        child:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              //#figure in topRight
              Container(
                height:40,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color:Colors.lightBlue[50],
                        borderRadius: BorderRadius.only(
                            bottomLeft:Radius.circular(70),
                            bottomRight: Radius.circular(40)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //#image
              Container(
                width: 200,
                height: 200,
                child:Image.asset('assets/images/ic_image.png',fit:BoxFit.cover),
              ),
              Transform.translate(
                offset:Offset(0,-15),
                child:Column(
                  children:[
                    Text('Welcome back!',style:GoogleFonts.poppins(
                      color:Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    )),
                    SizedBox(height: 3,),
                    Text('Log in to your existant account of Q Allure',style:TextStyle(color:Colors.grey[500],fontSize: 15),),
                  ],
                ),
              ),
              SizedBox(height:20),
              //#gmail or account
              Container(
                margin:EdgeInsets.symmetric(horizontal: 20),
                padding:EdgeInsets.only(left:30,top:4),
                height:60,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  border:Border.all(width: 2,color:Colors.blue,),
                  color:Colors.white,
                ),
                child:TextField(
                  controller: emailController,
                  style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),
                  decoration:InputDecoration(
                    icon:FaIcon(FontAwesomeIcons.user,color:Colors.blue,size: 16,),
                    border:InputBorder.none,
                    hintText:'Jonewilliams@gmail.com',
                    hintStyle: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              //#password
              Container(
                margin:EdgeInsets.symmetric(horizontal: 20),
                padding:EdgeInsets.only(left:30,top:4),
                height:60,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(30),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[300],blurRadius:50,offset: Offset(0,1))
                  ],
                ),
                child:TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:InputDecoration(
                    icon:Icon(Icons.lock_open_rounded,color:Colors.grey,size: 18,),
                    border:InputBorder.none,
                    hintText:'Password',
                    hintStyle: TextStyle(color:Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                width: double.infinity,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot Password?',style:GoogleFonts.poppins(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height:20),
              //#login button
              Container(
                margin:EdgeInsets.symmetric(horizontal: 90),
                height:60,
                width: double.infinity,
                decoration:BoxDecoration(
                  color:Colors.blue[900],
                  borderRadius:BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(color:Colors.lightBlue[100],blurRadius: 20,offset: Offset(0,10)),
                  ],
                ),
                child:FlatButton(
                  child:Text('LOG IN',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color:Colors.white,
                  ),),
                  onPressed:(){
                    _login();
                  },
                ),
              ),
              SizedBox(height: 30,),
              //#or connect
              Text('Or connect using',style:GoogleFonts.poppins(color:Colors.grey[500],fontSize:16),),
              SizedBox(height:15,),
              Container(
                height:45,
                margin:EdgeInsets.symmetric(horizontal: 45),
                child:Row(
                  children: [
                    //facebook button
                    Expanded(flex: 7,
                      child:Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:Colors.blue[800],
                        ),
                        child:Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.facebookF,color:Colors.white,size: 15,),
                              SizedBox(width:10,),
                              Text('Facebook',style:GoogleFonts.poppins(
                                fontSize: 15,
                                color:Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1,),
                    //#google button
                    Expanded(flex: 7,
                      child:Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:Colors.redAccent,
                        ),
                        child:Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.google,color:Colors.white,size: 15,),
                              SizedBox(width:10,),
                              Text('Google',style:GoogleFonts.poppins(
                                fontSize: 15,
                                color:Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              //#dont have an account?
              Container(
                width: double.infinity,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text('Don\'t have an account? ',style:GoogleFonts.poppins()),
                    GestureDetector(
                      child:Text('Sign Up',style:GoogleFonts.poppins(color:Colors.blue,fontWeight: FontWeight.bold),),
                      onTap:()async{
                        await Navigator.pushNamed(context,SignUp.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
