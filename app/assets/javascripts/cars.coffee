class App.Cars extends App.Base
  
  index: =>
    
    return

  new: =>
    new App.Cars().carFormHandler()
    return

  edit: =>
    new App.Cars().carFormHandler()
    return

  show: =>
    $(document).on 'click','.thumb_image', (event) ->
      event.preventDefault()
      image_id = $(this).attr 'photo_id'
      # hide large image, and only show image with this id
      $(".large_image").addClass('hide')
      $(".large_image[photo_id=#{image_id}]").removeClass('hide')
      # show thumb image, and only hide image with this id
      $(".thumb_image").removeClass('hide')
      $(".thumb_image[photo_id=#{image_id}]").addClass('hide')

  # car form validator
  carFormHandler: ->
    $carForm = $("#car_form")

    # update models list according to selected make.
    $(document).on "change","#car_make_id",(event) ->
      make_id = $(this).val()
      $.get "/makes/#{make_id}/car_models",(data) ->
        options = ""
        # iterate car models, and populate in options
        $.each data.car_models,(index,element) ->
          options += "<option value='#{element.id}'>#{element.name}</options>"

        # replace car models list with updated list
        $("#car_model_id").html(options)

    $carForm.submit (event) ->
      $($carForm).validate
        focusInvalid: true
        errorClass: 'invalid'
        validClass: 'valid'
        errorPlacement: (error, element) ->
          error.insertAfter $(element)

        rules:
          "car[make_id]":
            required: true
          "car[car_model_id]":
            required: true
          "car[registration_no]":
            required: true
          "car[mileage]":
            required: true
          "car[last_oil_change]":
            required: true
          "car[per_day_rent]":
            number: true
            required: true
          "car[car_photos_attributes][0][image]":
            required:
              depends: (element) ->
                $('#car_car_photos_attributes_0_id').val() == ''
          "car[car_photos_attributes][1][image]":
            required:
              depends: (element) ->
                $('#car_car_photos_attributes_1_id').val() == ''
          "car[car_photos_attributes][2][image]":
            required:
              depends: (element) ->
                $('#car_car_photos_attributes_2_id').val() == ''
          "car[car_photos_attributes][3][image]":
            required:
              depends: (element) ->
                $('#car_car_photos_attributes_3_id').val() == ''
        messages:
          "car[registration_no]":
            required: "Registration number is required."
          "car[mileage]":
            required: "Mileage is required."
          "car[last_oil_change]":
            required: "Last oil change date is required."
          "car[per_day_rent]":
            number: "Enter fare in digits."
            required: "Day rate is required."
          "car[car_photos_attributes][0][image]":
            required: "Upload front view image."
          "car[car_photos_attributes][1][image]":
            required: "Upload right view image."
          "car[car_photos_attributes][2][image]":
            required: "Upload rear view image."
          "car[car_photos_attributes][3][image]":
            required: "Upload left view image."

      if $($carForm).valid()
        $($carForm).find("button[type='submit']").attr('disabled',true)
        return true
      # Prevent the form from being submitted:
      false
    return