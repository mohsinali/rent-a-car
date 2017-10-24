window.App ||= {}
class App.Bookings extends App.Base

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
    new App.Bookings().bookingFormHandler()
    
    # get Advance Payment value from booking and insert in price details
    $('#booking_advance_payment').change ->
      $('#my-id').val $(this).val()
  


  edit: =>
    return

  # form Validation function
  bookingFormHandler: ->
    $bookingForm = $("#booking_form").validate

        rules:
          "booking[customer_attributes][name]":
            required: true
          "booking[customer_attributes][phone]":
            required: true
            digits: true
          "booking[customer_attributes][cnic]":
            required: true
            digits: true
            minlength: 13
            maxlength: 13
          "booking[customer_attributes][address]":
            required: true
          "booking[advance_payment]":
            digits: true
            required: true
          "booking[from_booking]":
            date: true
            required: true
          "booking[to_booking]":
            date: true
            required: true

        messages:
          "booking[booking_price]":
            required: "Please enter booking price."
            digits: "must be numeric."
          "booking[advance_payment]":
            required: "Please enter advance payment."
            digits: "must be numeric."
          "booking[customer_attributes][name]": "Please enter name."
          "booking[customer_attributes][cnic]":
            required: "Please enter CNIC no."
            digits: "must be numeric."
            minlength: "must be {0} characters long."
            maxlength: "must be {0} characters long."
          "booking[customer_attributes][phone]":
            required: "Please enter phone no."
            digits: "must be numeric."
          "booking[customer_attributes][address]": "Please enter address."
    return


