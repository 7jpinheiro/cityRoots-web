$ ->
  $('.with_autocomplete').autocomplete
    minLength: 1
    source: (request, response) ->
      $.ajax
        url: $('.with_autocomplete').data('autocompleteurl')
        dataType: "json"
        data:
          name: request.term
        success: (data) ->
          response(data)