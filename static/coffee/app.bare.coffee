# Your javascript goes here

$ ->

  #Prevent modal windows from returning
  $('.md-trigger').click ->
    false

  #Wrap inline videos in video iframes so they are responsive
  $('iframe').wrap '<figure class="video"></figure>'

  #wrap inline images in figure tags so they are responsive
  $('.content img').wrap '<figure></figure>'

  #Enable responsive video with Fitvids http://fitvidsjs.com/
  $('.video').fitVids()

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

  #Pill checkbox & radio buttons a little help
  $('.js-pill input').change ->
    type = $(@).parents('.js-pill')
    check = $(@).parent('label')
    if $(type).hasClass('check-buttons')
      check.toggleClass('checked')
    else if $(type).hasClass('radio-buttons')
      check.siblings('label').removeClass('checked')
      check.addClass('checked')
