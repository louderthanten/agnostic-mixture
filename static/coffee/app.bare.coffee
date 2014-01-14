# Your javascript goes here
$ ->

    #Wrap inline videos in video iframes so they are responsive
    $('iframe').wrap '<figure class="video"></figure>'

    #wrap inline images in figure tags so they are responsive
    $('.content img').wrap '<figure></figure>'

    #Enable responsive video with Fitvids http://fitvidsjs.com/
    $('.video').fitVids()

    # Default slider. Requires jQueryUI
    $( '.js-slider' ).slider()

    # Toggle hidden drawers
    $(document).on 'click', '.js-reveal', (e) ->
        target = $(@).attr 'href'
        $(target).toggleClass 'opened'
        e.preventDefault()

    #Show/hide password fields
    $('.js-show-pw').click (e) ->
        type = $(@).parents('.field').find('input')
        if $(type).attr('type') is 'text'
            $(type).get(0).type = 'password'
            $(@).text 'Show password'
        else
            $(type).get(0).type = 'text'
            $(@).text 'Hide password'
        e.preventDefault()

    #Pill checkbox & radio buttons a little help
    $('.js-options input').change ->
        type = $(@).parents('.js-pill')
        check = $(@).parent('label')
        if $(type).hasClass('check-buttons')
            check.toggleClass('checked')
        else if $(type).hasClass('radio-buttons')
            check.siblings('label').removeClass('checked')
            check.addClass('checked')