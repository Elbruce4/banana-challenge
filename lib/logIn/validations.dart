  
import 'package:email_validator/email_validator.dart';

validateEmail (email) {

    
  print("corre esto");
  print(email);

  if(email.length == 0) return "Este campo es obligatorio";
  return email != null && !EmailValidator.validate(email) ? "Ingrese un mail valido" : null;

}

