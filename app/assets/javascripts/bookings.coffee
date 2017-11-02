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

    # calculate and fill price section in booking form

    new App.Bookings().bookingPriceHandler()

    # hide CNIC form for Returning Customer
    $('.cnic').hide('slow')

    # New Customer form show
    $('#new_customer').click ->
      $('.cnic').hide('slow')
    
      $('#booking_form').show('slow')
  
    # Returning Customer form show
    $('#returning_customer').click ->
      $('#cnic').val("")
      $('.cnic').show('slow')
      $('#booking_form').hide('slow')


  edit: =>
    # form Validation
    new App.Bookings().bookingFormHandler()

    # calculate and fill price section in booking form

    new App.Bookings().bookingPriceHandler()
    

  # calculate and fill price section in booking form

  bookingPriceHandler: ->

    # get Advance Payment value from booking and insert in price details
    $('#booking_advance_payment').change ->
      $('#advance_payment').val $(this).val()

    $('#booking_from_booking').change ->
      fromDate = new Date($(this).val())
      toDate = new Date($('#booking_to_booking').val())
      setTotalDays(fromDate,toDate)

    $('#booking_to_booking').change ->
      toDate = new Date($(this).val())
      fromDate = new Date($('#booking_from_booking').val())
      setTotalDays(fromDate,toDate)
      
    # calculate number of days

    setTotalDays = (fromDate,toDate) ->
        diff = toDate - fromDate
        days = diff/(24 * 3600 * 1000)
        if isNaN(days)
          days =1

        setTotalRent(days)
        $('#booking_number_of_days').val days

    # calculate total total rent

    setTotalRent = (days) ->
      rent = $('#per_day_rent').val()

      total_rent = parseInt(rent * days)
      $('#total_price').val total_rent

      setRemainingAmount(total_rent)

    # calculate remaining amount  

    setRemainingAmount = (total_rent) ->
      advance = $('#booking_advance_payment').val()

      remaining_amount = total_rent - advance
      $('#remaining_price').val remaining_amount

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
            length: 13
          "booking[customer_attributes][address]":
            required: true
          "booking[advance_payment]":
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


