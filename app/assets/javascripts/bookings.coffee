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
    $('#booking_advance_payment').change ->
      $('#my-id').val $(this).val()
    return
    # return


  edit: =>
    return
