$("a[href*=#]:not([href=#])").click ->
  if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
    target = $(@hash)
    target = (if target.length then target else $("[name=#{@hash.slice(1)}]"))
    if target.length
      $("html, body").animate
        scrollTop: target.offset().top - 18
      , 1000
      false
