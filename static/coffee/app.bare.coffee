# Your javascript goes here

window.mySwipe = Swipe(document.getElementById('gallery'))

$ ->

  $('#slider-range').slider
    range: true
    min: 0
    max: 500
    values: [75, 300]
    slide: (event, ui) ->
      $('#amount').val '$' + ui.values[0] + ' - $' + ui.values[1]

  $('#amount').val '$' + $('#slider-range').slider('values', 0) + ' - $' + $('#slider-range').slider('values', 1)

  #Prevent modal windows from returning
  $('.md-trigger').click ->
    false

  #Wrap inline videos in video iframes so they are responsive
  $('.loop iframe').wrap '<figure class="video"></figure>'

  #wrap inline images in figure tags so they are responsive
  $('.loop > p > img, .loop > img, article > img').wrap '<figure></figure>'

  #Enable responsive video with Fitvids http://fitvidsjs.com/
  $('.video').fitVids()

  $.stellar {
    horizontalScrolling: false
  }

  # Toggle hidden drawers
  $(document).on 'click', '.js-reveal', ->
    target = $(@).attr 'href'
    $(target).toggleClass 'opened'
    if $(@).hasClass('js-sign-in-opener')
      if $(target).hasClass('opened')
        $('#username').focus()
    false

  #Show/hide password fields
  $('.js-show-pw').click ->
    type = $(@).parents('.field').find('input')
    if $(type).attr('type') is 'text'
      $(type).get(0).type = 'password'
      $(@).text 'Show password'
    else
      $(type).get(0).type = 'text'
      $(@).text 'Hide password'
    false

  #Give checkbox buttons a little help
  $('.check-buttons input').change ->
    check = $(@).parent('label')
    check.toggleClass('checked')
    if check.hasClass 'checked'
      $(@).siblings('.livicon').updateLivicon {
        c : '#55BA7F'
      }
    else
      $(@).siblings('.livicon').updateLivicon {
        c : '#fff'
      }