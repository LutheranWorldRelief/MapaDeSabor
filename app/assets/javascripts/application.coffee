#= require jquery
#= require jquery_ujs
#= require foundation
#= require lightslider.min
#= require chosen.jquery.min
#= require leaflet.markercluster-src.js
#= require jquery-ui
#= require override-menu
# require_tree .



$ ->

  setTimeout(AOS.init, 500);

  icons =
    header: 'ui-icon-circle-arrow-e'
    activeHeader: 'ui-icon-circle-arrow-s'


  $(document).foundation()

  slider = $('#lightSlider').lightSlider(
    item: 4
    autoWidth: false
    slideMove: 1
    slideMargin: 20
    mode: 'slide'
    useCSS: true
    cssEasing: 'ease'
    easing: 'linear'
    speed: 400
    slideEndAnimation: true
    pause: 2000
    keyPress: false
    controls: true
    prevHtml: ''
    nextHtml: ''
    currentPagerPosition: 'middle'
    enableTouch: true
    freeMove: true
    loop:true,
    responsive : [
      {
        breakpoint:800,
        settings: {
          item:3,
          slideMove:1,
        }
      }
      {
        breakpoint:480,
        settings: {
          item:2,
          slideMove:1
        }
      }
    ]
  )

  $("#switch-slider").click ->
    console.log this.checked

    if this.checked == true
      slider.play()
      return
    else
      slider.pause()
      return

  $('.open-side-form').each ->
    $(this).on 'click', (e) ->
      $("#map-leaflet").toggleClass("medium-8 medium-11")
      $("#tabs-cols").toggleClass("collapsed collapsible")
      $(".chosen-select").chosen()
      $(".accordion").accordion(
        active: 0
        collapsible: true
        icons: icons
      )

      e.preventDefault()
      # to prevent page from jumping to the top of the page
      return
    return
