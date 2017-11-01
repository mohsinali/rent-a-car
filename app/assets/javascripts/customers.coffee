window.App ||= {}
class App.Customers extends App.Base

  beforeAction: (action) =>
    return


  afterAction: (action) =>
    return


  index: =>
    return


  show: =>
    return


  new: =>

     # form Validation
    new App.Customers().customerFormHandler()

    return


  edit: =>
    return


  # form Validation function
  customerFormHandler: ->
    $customerForm = $("#customer_form").validate

        rules:
          "customer[name]":
            required: true
          "customer[phone]":
            required: true
            digits: true
          "customer[cnic]":
            required: true
            digits: true
            length: 13
          "customer[address]":
            required: true