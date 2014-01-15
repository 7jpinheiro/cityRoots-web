$ ->
  $('.with_autocomplete').autocomplete
    minLength: 2
    source: (request, response) ->
      $.ajax
        url: $('.with_autocomplete').data('autocompleteurl')
        dataType: "json"
        data:
          name: request.term
        success: (data) ->
          response(data)