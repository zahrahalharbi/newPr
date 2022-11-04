
import SwiftUI
import AuthenticationServices

struct sign: View {
    @State private var name = ""
    @State private var emailAddress = ""
    @State private var pass = ""
    @State private var passConfirm = ""
    @State private var numberphone = ""
    
    
    //sign in with apple
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    //checked
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}
    var body: some View {
        NavigationView{
         
                
                ZStack{
                    Color("Color")
                   
                        .ignoresSafeArea()
                       
                    
                    
                    
                    VStack{
                        Text("Already have an account?")
                            .font(.title)
                            .bold()
                            .padding(.vertical, 77.0)
                        HStack{
                    Image(systemName: "envelope.fill")
                        .resizable()
                    .frame(width : 25,height: 20 )
                    .foregroundColor(Color("Color 1"))
                               
                            
            TextField("HaveFun@.......", text: $emailAddress)
                                .padding()
                .frame(width: 300,height: 40)
            .overlay(RoundedRectangle(cornerRadius:500)
              .stroke(Color("Color 1"), lineWidth: 2))
            .padding()
            
            
            
                        }
                        
                        HStack{
                            Image(systemName: "lock.fill")
                                .resizable()
                        .foregroundColor(Color("Color 1"))
                                .frame(width : 20,height: 27 )
                
                            SecureField("Enter your password", text: $pass)
                                .padding()
                                .frame(width: 300,height: 40)
                            
                              
        .overlay(RoundedRectangle(cornerRadius:500)
            .stroke(Color("Color 1"), lineWidth: 2))

                        .padding()
                            
                        }
        NavigationLink(destination:
                                        
                            ZStack{
                            Color("Color")
                           
                             
                        .ignoresSafeArea()
                           
                            VStack{
                Image(systemName: "lock.fill")
                    .resizable()
                    .foregroundColor(Color("Color 1"))
            .frame(width : 70,height: 100 )
            .foregroundColor(Color(hue: 0.029, saturation: 0.291, brightness: 0.864))
                                //sty
                Text("Forgot password")
                .font(.largeTitle)
                .padding(.bottom,70)
            Text("Enter your email to get a verification link to able to change your password")
                            .font(.body)
                        .foregroundColor(Color("Color 1"))
                .multilineTextAlignment(.center)
                    .bold()
                .padding()
                                
                HStack{
            Image(systemName: "envelope.fill")
                    .resizable()
            .frame(width : 25,height: 20 )
            .foregroundColor(Color("Color 1"))
                                       
                                       
                                    
        TextField("Enter your email", text: $emailAddress)
            .padding()
                .frame(width: 300,height: 40)
                                    
            .overlay(RoundedRectangle(cornerRadius:500)
                .stroke(Color("Color 1"), lineWidth: 2))
            .padding()
                                }
                                
              Button("Enter"){
                                    
                                }
                                
                .foregroundColor(.white)
                .frame(width: 300,height: 50)
        .background(Color(hue: 0.029, saturation: 0.291, brightness: 0.864))
            .cornerRadius(10)
            .padding()
                               }
                        }
                        )
                        {
                            
                            //page2
                            //st4
                Button(action: toggle){
                HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                    .frame(width:1)
                    .foregroundColor(Color("Color 1"))
                    Text("Remamber me")
                        .font(.footnote)
                        .foregroundColor(Color("Color 1"))
                    .padding(.trailing, 40.0)
                } .padding(.leading, 35.0 )
                                
                                
                            }
                           Spacer()
                    Text("Forgot password?")
                        .font(.footnote)
                        .padding(.horizontal )
                                
                            
                          
                           
                            
                        }.padding(.bottom, 50)
                        //end
                        
                        Button("Sign in"){
                            
                        }
                .foregroundColor(.white)
            .frame(width: 300,height: 50)
            .background(Color(hue: 0.029, saturation: 0.291, brightness: 0.864))
                        .cornerRadius(10)
                        .padding()
                        // sign in with apple
                        VStack {
                    SignInWithAppleButton(.continue){ request in request.requestedScopes = [.email, .fullName]
                    } onCompletion: { result in
                        switch result{
                        case .success(let auth):
                            switch auth.credential{
                            case let Credential as
                            ASAuthorizationAppleIDCredential:
                                // User Id
                                let userId = Credential.user
                                // User info
                                let email = Credential.email
                                let firstName = Credential.fullName?.givenName
                                let lastName = Credential.fullName?.familyName
                                
                                self.email = email ?? ""
                                self.userId = userId
                                self.firstName = firstName ?? ""
                                self.lastName = lastName ?? ""
                                
                            default:
                                break
                            }
                            
                           
                        case .failure(let error):
                            print(error)
                        }
                    }
                    .signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
                    .frame(width: 300,height: 50)
                    .padding()
                   
                    .cornerRadius(10)
                    
                              
                            }
                        //end
                        
                        HStack{
                Text("You don't have an account?")
                                .font(.title3)
                                .padding(.top,40)
                            
                NavigationLink(destination:
                                        
                            ZStack{
                        Color("Color")
                    .ignoresSafeArea()
                                   
                  VStack{
                    Text("Create account")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 70.0)
                                    HStack{
                Image(systemName: "person.fill")
                    .resizable()
            .frame(width : 30,height: 30 )
            .foregroundColor(Color("Color 1"))
                                        
            TextField("name", text: $name)
                .padding()
                .frame(width: 300,height: 40)
                                        
                                           
    .overlay(RoundedRectangle(cornerRadius:500)
        .stroke(Color("Color 1"), lineWidth: 2))

                .padding()
                                    
                                    }
                      
                                    HStack{
        Image(systemName: "envelope.fill")
                .resizable()
        .frame(width : 25,height: 20 )
        .foregroundColor(Color("Color 1"))
                                        
        TextField("HaveFun@.......", text: $emailAddress)
                .padding()
        .frame(width: 300,height: 40)
                                        
                                          
        .overlay(RoundedRectangle(cornerRadius:500)
            .stroke(Color("Color 1"), lineWidth: 2))

                .padding()
                                    }
                      
                             HStack{
        Image(systemName: "phone.fill")
            .resizable()
            .frame(width : 25,height: 25 )
            .foregroundColor(Color("Color 1"))
                                        
        TextField("Phone number", text: $numberphone)
                                        //phone
            .keyboardType(.numberPad)
                                        
                    .padding()
        .frame(width: 300,height: 40)
                                        
                                          
        .overlay(RoundedRectangle(cornerRadius:500)
            .stroke(Color("Color 1"), lineWidth: 2))

        .padding()
                                    }
                      
                                    HStack{
                                        Image(systemName: "lock.fill")
                                            .resizable()
                                            .frame(width : 24,height: 30 )
                                            .foregroundColor(Color("Color 1"))
                                        SecureField("Enter your password", text: $pass)
                                            .padding()
                                            .frame(width: 300,height: 40)
                                        
                                           
                                            .overlay(RoundedRectangle(cornerRadius:500)
                                                .stroke(Color("Color 1"), lineWidth: 2))

                                            .padding()
                                        
                                    }
                                    HStack{
                                        Image(systemName: "lock.fill")
                                            .resizable()
                                            .frame(width : 24,height: 30 )
                                            .foregroundColor(Color("Color 1"))
                                        SecureField("Confirm paasword", text: $passConfirm)
                                            .padding()
                                            .frame(width: 300,height: 40)
                                        
                                           
                                            .overlay(RoundedRectangle(cornerRadius:500)
                                                .stroke(Color("Color 1"), lineWidth: 2))

                                            .padding()
                                        
                                    }
                                    Button("Sign up"){
                                        
                                    }
                                    .foregroundColor(.white)
                                    .frame(width: 300,height: 50)
                                    .background(Color(hue: 0.029, saturation: 0.291, brightness: 0.864))
                                    .cornerRadius(10)
                                    .padding()
                                }
                            }){
                                Text("Sign up")
                                    .font(.title2)
                                    .padding(.top,40)
                                
                            }
                            
                        }
                    }
                }
            
        }
        
    }
}

struct sign_Previews: PreviewProvider {
    static var previews: some View {
        sign()
    }
}
