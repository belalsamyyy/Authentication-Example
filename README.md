# Authentication-Example

```swift 
func validateFields() {
   do {
        let name = try userName_tf.validate(type: .required("User Name"))
        let email = try email_tf.validate(type: .email)
        let password = try password_tf.validate(type: .password)
         _ = try confirmPasswrod_tf.validate(type: .confirm(password_tf))

        self.simpleAlert(title: "Success", message: "you registerd Successfully !")
        save(name: name, email: email, password: password) // save in userDefaults

   } catch(let error) {
        self.simpleAlert(title: "Error", message: (error as! ValidationError).message)
   }
}
```

## Author

BelalSamy, belalsamy10@gmail.com

## License

SimpleAPI is available under the MIT license. See the LICENSE file for more info.
