##########################################################
## All the regular experession validators will be
## defined in this method: FormValidators
## Scope: Globally used throughout the application
## Author: Sarwan Kumar
App.formValidators = ->
  $.validator.addMethod 'phoneCheck', ((phone_number, element) ->
    $(element).intlTelInput("isValidNumber")
  ), 'Please enter a valid phone number'

############# END OF Method: FormValidators ##############
##########################################################

#### signin form validations ####
App.signinFormValidator = ->
  $("#signin_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[email]":
        required: true
        email: true
      "user[password]":
        required: true
    messages:
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."

      "user[password]":
        required: "Password is required."

#### signup form validations ####
App.signUpFormValidator = ->
  App.applyIntlInput($("#user_phone"))
  $("#signup_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[name]":
        required: true
      "user[email]":
        required: true
        email: true
      "user[phone]":
        required: true
        phoneCheck: true
      "user[password]":
        minlength: 8
        required: true

      "user[password_confirmation]":
        required: true
        minlength: 8
        equalTo: "#user_password"
    messages:
      "user[name]":
        required: "Name is required."
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."
      "user[phone]":
        required: "Phone is required."
      "user[password]":
        required: "Password is required."

      "user[password_confirmation]":
        required: "Confirm password is required."
        equalTo: "Password and Confirm Password does not match."


#### new password form validations ####
App.newPasswordFormValidator = ->
  $("#new_password_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[email]":
        required: true
        email: true
    messages:
      "user[email]":
        required: "Email is required."
        email: "Please enter a valid email address."

#### edit password form validations ####
App.editPasswordFormValidator = ->
  $("#edit_password_form").validate
    errorClass: 'invalid'
    validClass: 'valid'
    errorPlacement: (error, element) ->
      error.insertAfter $(element)

    rules:
      "user[password]":
        minlength: 8
        required: true

      "user[password_confirmation]":
        required: true
        minlength: 8
        equalTo: "#user_password"
    messages:
      "user[password]":
        required: "Password is required."
      "user[password_confirmation]":
        required: "Confirm password is required."
        equalTo: "Password and Confirm Password does not match."


App.applyIntlInput = ($element) ->
  $element.intlTelInput
    initialCountry: 'pk'
    formatOnInit: true
    separateDialCode: false
    utilsScript: "assets/libphonenumber/utils.js"

  $element.on 'change', ->
    App.setIntlValue($element)

  # default set initial value.
  App.setIntlValue($element)

App.setIntlValue = ($element) ->
  intlNumber = $element.intlTelInput('getNumber')
  if intlNumber
    $element.val intlNumber