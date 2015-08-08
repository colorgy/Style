$ ->
  MOBILE_SWIPE_WIDTH = 250

  $mobileSlide = $('.mobile-slide')
  $mobileSlideSecond = $('.mobile-slide-second')

  setMobileSlideBodyDimmer = ->
    if !$('#mobile-slide-body-dimmer').length
      mobileSlideBodyDimmer = document.createElement("div")
      mobileSlideBodyDimmer.id = 'mobile-slide-body-dimmer'
      document.body?.insertBefore(mobileSlideBodyDimmer, document.body.firstChild)
    $('#mobile-slide-body-dimmer').click ->
      $('body').removeClass('is-mobile-slide-active')
      $('body').removeClass('is-mobile-slide-second-active')
    $('#mobile-slide-body-dimmer')

  if $mobileSlide.length > 0
    $bodyDimmer = setMobileSlideBodyDimmer()

    # add touch trigger

    touchTrigger = document.getElementById('mobile-slide-touch-trigger')
    touchTrigger?.parentNode?.removeChild(touchTrigger)
    touchTrigger = document.createElement("div")
    touchTrigger.id = 'mobile-slide-touch-trigger'
    document.body?.insertBefore(touchTrigger, document.body.firstChild)

    $mobileSlideTouchTrigger = $("#mobile-slide-touch-trigger")

    # Click events

    $('.mobile-slide-trigger-button').click ->
      $('body').toggleClass('is-mobile-slide-active')
      $('body').removeClass('is-mobile-slide-second-active')
      false

    $('.mobile-slide a:not([href=#]), .mobile-slide-second a:not([href=#])').click ->
      $('body').removeClass('is-mobile-slide-active')
      $('body').removeClass('is-mobile-slide-second-active')

    # Touch swipe events

    mobileSlideSwipe = (event, phase, direction, distance, duration, fingers, fingerData) ->
      px = fingerData[0].end.x - fingerData[0].start.x
      if phase == 'move'
        window.mobileSlideSwipeTouching = true
        if $('body').hasClass('is-mobile-slide-active')
          px = px + MOBILE_SWIPE_WIDTH
        px = MOBILE_SWIPE_WIDTH + 4 if px > MOBILE_SWIPE_WIDTH + 4
        swipeRate = (MOBILE_SWIPE_WIDTH-px)/MOBILE_SWIPE_WIDTH
        $(this).css
          "width": "100%"
          "left": "0"
        $mobileSlide.css
          "-webkit-transition-property": "none"
          "-moz-transition-property": "none"
          "-o-transition-property": "none"
          "transition-property": "none"
          "-webkit-transition-duration": "0"
          "-moz-transition-duration": "0"
          "-o-transition-duration": "0"
          "transition-duration": "0"
          "-webkit-transform": "translateX(#{px}px)"
          "-moz-transform": "translateX(#{px}px)"
          "-ms-transform": "translateX(#{px}px)"
          "-o-transform": "translateX(#{px}px)"
          "transform": "translateX(#{px}px)"
        $bodyDimmer.css
          "-webkit-transition-property": "none"
          "-moz-transition-property": "none"
          "-o-transition-property": "none"
          "transition-property": "none"
          "-webkit-transition-duration": "0"
          "-moz-transition-duration": "0"
          "-o-transition-duration": "0"
          "transition-duration": "0"
          "opacity": "#{0.5 - 0.5*swipeRate}"
      else if phase == 'end'
        window.mobileSlideSwipeTouching = false
        if distance > 52 or duration < 120
          if direction == 'left'
            $('body').removeClass('is-mobile-slide-active')
          if direction == 'right'
            $('body').addClass('is-mobile-slide-active')
      else if phase == 'cancel'
        window.mobileSlideSwipeTouching = false
        eventX = event.x or event.changedTouches[0]?.pageX
        if eventX > MOBILE_SWIPE_WIDTH
          $('body').removeClass('is-mobile-slide-active')
          $('body').removeClass('is-mobile-slide-second-active')
          window.disableTouch = true
          setTimeout ->
            window.disableTouch = false
          , 500
      if phase != 'move'
        $mobileSlide.attr('style', '')
        $mobileSlideSecond.attr('style', '')
        $bodyDimmer.attr('style', '')
        $(this).attr('style', '')

    $mobileSlideTouchTrigger.swipe
      swipeStatus: mobileSlideSwipe
      allowPageScroll: "vertical"
      threshold: 5
      excludedElements: ''

    $mobileSlide.swipe
      swipeStatus: mobileSlideSwipe
      allowPageScroll: "vertical"
      threshold: 5
      excludedElements: ''

    $mobileSlideTouchTrigger.on 'touchstart', ->
      if !$('body').hasClass('is-mobile-slide-active') && !window.mobileSlideSwipeTouching
        px = 16
        $mobileSlide.css
          "-webkit-transform": "translateX(#{px}px)"
          "-moz-transform": "translateX(#{px}px)"
          "-ms-transform": "translateX(#{px}px)"
          "-o-transform": "translateX(#{px}px)"
          "transform": "translateX(#{px}px)"

  if $mobileSlideSecond.length
    $bodyDimmer = setMobileSlideBodyDimmer()

    # add touch trigger

    touchTrigger = document.getElementById('mobile-slide-second-touch-trigger')
    touchTrigger?.parentNode?.removeChild(touchTrigger)
    touchTrigger = document.createElement("div")
    touchTrigger.id = 'mobile-slide-second-touch-trigger'
    document.body?.insertBefore(touchTrigger, document.body.firstChild)

    $mobileSlideSecondTouchTrigger = $("#mobile-slide-second-touch-trigger")

    # Click events

    $('.mobile-slide-second-trigger-button').click ->
      $('body').addClass('is-mobile-slide-active')
      $('body').addClass('is-mobile-slide-second-active')
      false

    $('.mobile-slide a:not([href=#]), .mobile-slide-second a:not([href=#])').click ->
      $('body').removeClass('is-mobile-slide-active')
      $('body').removeClass('is-mobile-slide-second-active')

    # Touch swipe events

    mobileSlideSecondSwipe = (event, phase, direction, distance, duration, fingers, fingerData) ->
      px = fingerData[0].end.x - fingerData[0].start.x
      if phase == 'move'
        px = px + MOBILE_SWIPE_WIDTH if $('body').hasClass('is-mobile-slide-second-active')
        px = MOBILE_SWIPE_WIDTH + 4 if px > MOBILE_SWIPE_WIDTH + 4
        $(this).css
          "width": "100%"
          "left": "0"
        $mobileSlideSecond.css
          "-webkit-transition-property": "none"
          "-moz-transition-property": "none"
          "-o-transition-property": "none"
          "transition-property": "none"
          "-webkit-transition-duration": "0"
          "-moz-transition-duration": "0"
          "-o-transition-duration": "0"
          "transition-duration": "0"
          "-webkit-transform": "translateX(#{px}px)"
          "-moz-transform": "translateX(#{px}px)"
          "-ms-transform": "translateX(#{px}px)"
          "-o-transform": "translateX(#{px}px)"
          "transform": "translateX(#{px}px)"
      else if phase == 'end'
        if distance > 52 or duration < 120
          if direction == 'left'
            $('body').removeClass('is-mobile-slide-second-active')
          if direction == 'right'
            $('body').addClass('is-mobile-slide-second-active')
      else if phase == 'cancel'
        eventX = event.x or event.changedTouches[0]?.pageX
        if eventX > MOBILE_SWIPE_WIDTH
          $('body').removeClass('is-mobile-slide-active')
          $('body').removeClass('is-mobile-slide-second-active')
          window.disableTouch = true
          setTimeout ->
            window.disableTouch = false
          , 500
      if phase != 'move'
        $mobileSlideSecond.attr('style', '')
        $bodyDimmer.attr('style', '')
        $(this).attr('style', '')

    $mobileSlideSecondTouchTrigger.swipe
      swipeStatus: mobileSlideSecondSwipe
      allowPageScroll: "vertical"
      threshold: 5
      excludedElements: ''

    $mobileSlideSecond.swipe
      swipeStatus: mobileSlideSecondSwipe
      allowPageScroll: "vertical"
      threshold: 5
      excludedElements: ''
