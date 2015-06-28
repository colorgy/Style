$(document).on 'ready page:load', ->
  $("a[href*=#]:not([href=#])").click (e) ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname and $(this).attr('data-toggle') != 'collapse'
      e.preventDefault()
      target = $(@hash)
      target = (if target.length then target else $("[name=#{@hash.slice(1)}]"))
      if target.length
        $("html, body").animate
          scrollTop: target.offset().top - 0
        , 500
      setTimeout =>
        window.location.hash = @hash
      , 600
