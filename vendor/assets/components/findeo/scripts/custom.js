import { gridLayoutSwitcher } from '../../../../../app/assets/javascripts/frontend/custom/listing_layout_switcher.js'
import { mmenuInit } from '../../../../../app/assets/javascripts/frontend/custom/mmenu_init.js'
import { inlineCSS, parallaxBG } from '../../../../../app/assets/javascripts/frontend/custom/inline_css.js'
import { mortgageCalc } from '../../../../../app/assets/javascripts/frontend/custom/mortgage_calc.js'
import { fullscreenFix, backgroundResize, parallaxPosition } from '../../../../../app/assets/javascripts/frontend/custom/parallax.js'
import { searchTypeButtons } from '../../../../../app/assets/javascripts/frontend/custom/search_type_buttons.js'
import { sliders } from '../../../../../app/assets/javascripts/frontend/custom/sliders.js'
import { carousel, owlCarousel } from '../../../../../app/assets/javascripts/frontend/custom/carousel.js'
import { magnificPopup } from '../../../../../app/assets/javascripts/frontend/custom/popup.js'
import { callMetrika } from "../../../../../app/assets/javascripts/frontend/call_metrika";
import { deviceMobile } from "../../../../../app/assets/javascripts/frontend/utils";
// var contactForm = require("exports-loader?contactForm!~/../../javascripts/frontend/custom/contact_form");


/* ----------------- Start Document ----------------- */
( function($) {
    "use strict";

    $(document).ready(readyEvents).on('render_async_load', readyEvents);

    $(document).ready(function () {
        /*  User Menu */
        $('.user-menu').on('click', function(){
            $(this).toggleClass('active');
        });


        /*----------------------------------------------------*/
        /*  Compare Menu
        /*----------------------------------------------------*/
        $('.csm-trigger').on('click', function(){
            $('.compare-slide-menu').toggleClass('active');
        });
    })

    function readyEvents() {

        /*--------------------------------------------------*/
        /*  Mobile Menu - mmenu.js
        /*--------------------------------------------------*/
        $(function() {
            mmenuInit();
            $(window).resize(function() { mmenuInit(); });
        });


        /*----------------------------------------------------*/
        /*  Sticky Header
        /*----------------------------------------------------*/
        $( "#header" ).not( "#header-container.header-style-2 #header" ).clone(true).addClass('cloned unsticky').insertAfter( "#header" );
        $( "#navigation.style-2" ).clone(true).addClass('cloned unsticky').insertAfter( "#navigation.style-2" );

        // Logo for header style 2
        $( "#logo .sticky-logo" ).clone(true).prependTo("#navigation.style-2.cloned ul#responsive");


        // sticky header script
        var headerOffset = $("#header-container").height() * 1; // height on which the sticky header will shows

        $(window).scroll(function(){
            if($(window).scrollTop() >= headerOffset){
                $("#header.cloned").addClass('sticky').removeClass("unsticky");
                $("#navigation.style-2.cloned").addClass('sticky').removeClass("unsticky");
            } else {
                $("#header.cloned").addClass('unsticky').removeClass("sticky");
                $("#navigation.style-2.cloned").addClass('unsticky').removeClass("sticky");
            }
        });


        /*----------------------------------------------------*/
        /* Top Bar Dropdown Menu
        /*----------------------------------------------------*/

        $('.top-bar-dropdown').on('click', function(event){
            $('.top-bar-dropdown').not(this).removeClass('active');
            if ($(event.target).parent().parent().attr('class') == 'options' ) {
                hideDD();
            } else {
                if($(this).hasClass('active') &&  $(event.target).is( "span" )) {
                    hideDD();
                } else {
                    $(this).toggleClass('active');
                }
            }
            event.stopPropagation();
        });

        $(document).on('click', function(e){ hideDD(); });

        function hideDD(){
            $('.top-bar-dropdown').removeClass('active');
        }


        /*----------------------------------------------------*/
        /* Advanced Search Button
        /*----------------------------------------------------*/
        $('.adv-search-btn').on('click', function(e){

            if ( $(this).is(".active") ) {

                $(this).removeClass("active");
                $(".main-search-container").removeClass("active");
                setTimeout( function() {
                    $("#map-container.homepage-map").removeClass("overflow")
                }, 0);

            } else {

                $(this).addClass("active");
                $(".main-search-container").addClass("active");
                setTimeout( function() {
                    $("#map-container.homepage-map").addClass("overflow")
                }, 400);

            }

            e.preventDefault();
        });



        /*----------------------------------------------------*/
        /*  Inline CSS replacement for backgrounds etc.
        /*----------------------------------------------------*/
        // Init
        inlineCSS();
        parallaxBG();


        // Slide to anchor
        $('#titlebar .listing-address').on('click', function(e){
            e.preventDefault();

            $('html, body').animate({
                scrollTop: $( $.attr(this, 'href') ).offset().top-40
            }, 600);

            //Метрика нажатий на адрес недвижимости
            callMetrika('click-property-address');
        });


        /*----------------------------------------------------*/
        /*  Tooltips
        /*----------------------------------------------------*/


        $(".tooltip.top").tipTip({
            defaultPosition: "top"
        });

        $(".tooltip.bottom").tipTip({
            defaultPosition: "bottom"
        });

        $(".tooltip.left").tipTip({
            defaultPosition: "left"
        });

        $(".tooltip.right").tipTip({
            defaultPosition: "right"
        });


        /*----------------------------------------------------*/
        /*  Mortgage Calculator
        /*----------------------------------------------------*/

        // Gets property price
        var propertyPricing = parseFloat($('.property-price').text().replace(/[^0-9\.]+/g,""));
        if (propertyPricing > 0) {
            $('.pick-price').on('click', function(){
                $('#amount').val(parseInt(propertyPricing));
            });
        }

        // replacing comma with dot
        // $(document).on('change', function() {
        //     $("#interest").val($("#interest").val().replace(/,/g, '.'));
        // });

        // Calculate
        $('.calc-button').on('click', function(){
            mortgageCalc();
        });



        /*----------------------------------------------------*/
        /*  Parallax
        /*----------------------------------------------------*/

        /* detect touch */
        if("ontouchstart" in window){
            document.documentElement.className = document.documentElement.className + " touch";
        }
        if(!$("html").hasClass("touch")){
            /* background fix */
            $(".parallax").css("background-attachment", "fixed");
        }

        /* fix vertical when not overflow
        call fullscreenFix() if .fullscreen content changes */
        $(window).resize(fullscreenFix);
        fullscreenFix();

        /* resize background images */

        $(window).resize(backgroundResize);
        $(window).focus(backgroundResize);
        backgroundResize();

        /* set parallax background-position */

        if(!$("html").hasClass("touch")){
            $(window).resize(parallaxPosition);
            //$(window).focus(parallaxPosition);
            $(window).scroll(parallaxPosition);
            parallaxPosition();
        }

        // Jumping background fix for IE
        if(navigator.userAgent.match(/Trident\/7\./)) { // if IE
            $('body').on("mousewheel", function () {
                event.preventDefault();

                var wheelDelta = event.wheelDelta;
                var currentScrollPosition = window.pageYOffset;
                window.scrollTo(0, currentScrollPosition - wheelDelta);
            });
        }


        /*----------------------------------------------------*/
        /*  Search Type Buttons
        /*----------------------------------------------------*/

        // Init
        if ($(".main-search-form").length){
            searchTypeButtons();
            $(window).on('load resize', function() { searchTypeButtons(); });
        }


        /*----------------------------------------------------*/
        /*  Chosen Plugin
        /*----------------------------------------------------*/

        var config = {
            '.chosen-select'           : {disable_search_threshold: 10, width:"100%"},
            '.chosen-select-deselect'  : {allow_single_deselect:true, width:"100%"},
            '.chosen-select-no-single' : {disable_search_threshold:100, width:"100%"},
            '.chosen-select-no-single.no-search' : {disable_search_threshold:10, width:"100%"},
            '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
            '.chosen-select-width'     : {width:"95%"}
        };

        for (var selector in config) {
            if (config.hasOwnProperty(selector)) {
                $(selector).chosen(config[selector]);
            }
        }


        /*  Custom Input With Select
        /*----------------------------------------------------*/
        $('.select-input').each(function(){

            var thisContainer = $(this);
            var $this = $(this).children('select'), numberOfOptions = $this.children('option').length;

            $this.addClass('select-hidden');
            $this.wrap('<div class="select"></div>');
            $this.after('<div class="select-styled"></div>');
            var $styledSelect = $this.next('div.select-styled');
            $styledSelect.text($this.children('option').eq(0).text());

            var $list = $('<ul />', {
                'class': 'select-options'
            }).insertAfter($styledSelect);

            for (var i = 0; i < numberOfOptions; i++) {
                $('<li />', {
                    text: $this.children('option').eq(i).text(),
                    rel: $this.children('option').eq(i).val()
                }).appendTo($list);
            }

            var $listItems = $list.children('li');

            $list.wrapInner('<div class="select-list-container"></div>');


            $(this).children('input').on('click', function(e){
                $('.select-options').hide();
                e.stopPropagation();
                $styledSelect.toggleClass('active').next('ul.select-options').toggle();
            });

            $(this).children('input').keypress(function() {
                $styledSelect.removeClass('active');
                $list.hide();
            });


            $listItems.on('click', function(e){
                e.stopPropagation();
                // $styledSelect.text($(this).text()).removeClass('active');
                $(thisContainer).children('input').val( $(this).text() ).removeClass('active');
                $this.val($(this).attr('rel'));
                $list.hide();
                //console.log($this.val());
            });

            $(document).on('click', function(e){
                $styledSelect.removeClass('active');
                $list.hide();
            });


            // Unit character
            var fieldUnit = $(this).children('input').attr('data-unit');
            $(this).children('input').before('<i class="data-unit">'+ fieldUnit + '</i>');


        });



        /*----------------------------------------------------*/
        /*  Searh Form More Options
        /*----------------------------------------------------*/
        $('.more-search-options-trigger').on('click', function(e){
            e.preventDefault();
            $('.more-search-options, .more-search-options-trigger').toggleClass('active');
            $('.more-search-options.relative').animate({height: 'toggle', opacity: 'toggle'}, 300);
        });

        $('.csm-mobile-trigger').on('click', function(){
            $('.compare-slide-menu').removeClass('active');
        });

        // Tooltips
        $(".compare-button.with-tip, .like-icon.with-tip, .widget-button.with-tip").each(function() {
            $(this).on('click', function(e){
                e.preventDefault();
            });
            var tipContent = $(this).attr('data-tip-content');
            $(this).append('<div class="tip-content">'+ tipContent + '</div>');
        });

        // Demo Purpose Trigger
        $('.compare-button, .compare-widget-button').on('click', function(){
            if (!deviceMobile()) {
                $('.compare-slide-menu').addClass('active');
            }
        });

        $(".remove-from-compare").on('click', function(e){
            e.preventDefault();
        });


        /*----------------------------------------------------*/
        /*  Like Icon Trigger
        /*----------------------------------------------------*/
        $('.like-icon, .widget-button').on('click', function(e){
            e.preventDefault();
            $(this).toggleClass('liked');
            $(this).children('.like-icon').toggleClass('liked');
        });


        /*----------------------------------------------------*/
        /*  Show More Button
        /*----------------------------------------------------*/
        $('.show-more-button').on('click', function(e){
            e.preventDefault();
            $(e.target.parentElement).toggleClass('visible');
        });


        /*----------------------------------------------------*/
        /*  Back to Top
        /*----------------------------------------------------*/
        var pxShow = 600; // height on which the button will show
        var fadeInTime = 300; // how slow / fast you want the button to show
        var fadeOutTime = 300; // how slow / fast you want the button to hide
        var scrollSpeed = 500; // how slow / fast you want the button to scroll to top.

        $(window).scroll(function(){
            if($(window).scrollTop() >= pxShow){
                $("#backtotop").fadeIn(fadeInTime);
            } else {
                $("#backtotop").fadeOut(fadeOutTime);
            }
        });

        $('#backtotop a').on('click', function(){
            $('html, body').animate({scrollTop:0}, scrollSpeed);
            return false;
        });


        /*----------------------------------------------------*/
        /*  Owl Carousel
        /*----------------------------------------------------*/
        owlCarousel();


        /*----------------------------------------------------*/
        /*  Slick Carousel
        /*----------------------------------------------------*/
        carousel();

        /*----------------------------------------------------*/
        /*  Magnific Popup
        /*----------------------------------------------------*/
        magnificPopup ()

        /*----------------------------------------------------*/
        /*  Sticky Footer (footer-reveal.js)
        /*----------------------------------------------------*/

        // disable if IE
        if(navigator.userAgent.match(/Trident\/7\./)) { // if IE
            $('#footer').removeClass("sticky-footer");
        }

        $('#footer.sticky-footer').footerReveal();


        /*----------------------------------------------------*/
        /*  Image Box
        /*----------------------------------------------------*/
        $('.img-box').each(function(){

            // add a photo container
            $(this).append('<div class="img-box-background"></div>');

            // set up a background image for each tile based on data-background-image attribute
            $(this).children('.img-box-background').css({'background-image': 'url('+ $(this).attr('data-background-image') +')'});

            // background animation on mousemove
            // $(this).on('mousemove', function(e){
            //   $(this).children('.img-box-background').css({'transform-origin': ((e.pageX - $(this).offset().left) / $(this).width()) * 100 + '% ' + ((e.pageY - $(this).offset().top) / $(this).height()) * 100 +'%'});
            // })
        });

        /*----------------------------------------------------*/
        /*  Listing Layout Switcher
        /*----------------------------------------------------*/
        gridLayoutSwitcher();

        /*----------------------------------------------------*/
        /*  Range Sliders
        /*----------------------------------------------------*/

        sliders();

        /*----------------------------------------------------*/
        /*  Masonry
        /*----------------------------------------------------*/

        // Agent Profile Alignment
        $(window).on('load resize', function() {

            $('.agents-grid-container').masonry({
                itemSelector: '.grid-item', // use a separate class for itemSelector, other than .col-
                columnWidth: '.grid-item',
                percentPosition: true
            });

            var agentAvatarHeight = $(".agent-avatar img").height();
            var agentContentHeight = $(".agent-content").innerHeight();

            if ( agentAvatarHeight < agentContentHeight ) {
                $('.agent-page').addClass('long-content');
            } else  {
                $('.agent-page').removeClass('long-content');
            }
        });



        /*----------------------------------------------------*/
        /*  Submit Property
        /*----------------------------------------------------*/

        // Tooltip
        $(".tip").each(function() {
            var tipContent = $(this).attr('data-tip-content');
            $(this).append('<div class="tip-content">'+ tipContent + '</div>');
        });



        /*----------------------------------------------------*/
        /*  Tabs
        /*----------------------------------------------------*/

        var $tabsNav    = $('.tabs-nav'),
            $tabsNavLis = $tabsNav.children('li');

        $tabsNav.each(function() {
            var $this = $(this);

            $this.next().children('.tab-content').stop(true,true).hide()
                .first().show();

            $this.children('li').first().addClass('active').stop(true,true).show();
        });

        $tabsNavLis.on('click', function(e) {
            var $this = $(this);

            $this.siblings().removeClass('active').end()
                .addClass('active');

            $this.parent().next().children('.tab-content').stop(true,true).hide()
                .siblings( $this.find('a').attr('href') ).fadeIn();

            e.preventDefault();
        });
        var hash = window.location.hash;
        var anchor = $('.tabs-nav a[href="' + hash + '"]');
        if (anchor.length === 0) {
            $(".tabs-nav li:first").addClass("active").show(); //Activate first tab
            $(".tab-content:first").show(); //Show first tab content
        } else {
            console.log(anchor);
            anchor.parent('li').click();
        }


        /*----------------------------------------------------*/
        /*  Accordions
        /*----------------------------------------------------*/
        var $accor = $('.accordion');

        $accor.each(function() {
            $(this).toggleClass('ui-accordion ui-widget ui-helper-reset');
            $(this).find('h3').addClass('ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all');
            $(this).find('div').addClass('ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom');
            $(this).find("div").hide();
        });

        var $trigger = $accor.find('h3');

        $trigger.on('click', function(e) {
            var location = $(this).parent();

            if( $(this).next().is(':hidden') ) {
                var $triggerloc = $('h3',location);
                $triggerloc.removeClass('ui-accordion-header-active ui-state-active ui-corner-top').next().slideUp(300);
                $triggerloc.find('span').removeClass('ui-accordion-icon-active');
                $(this).find('span').addClass('ui-accordion-icon-active');
                $(this).addClass('ui-accordion-header-active ui-state-active ui-corner-top').next().slideDown(300);
            }
            else if( $(this).is(':visible') ) {
                var $triggerloc = $('h3',location);
                $triggerloc.removeClass('ui-accordion-header-active ui-state-active ui-corner-top').next().slideUp(300);
                $triggerloc.find('span').removeClass('ui-accordion-icon-active');
            }
            e.preventDefault();
        });



        /*----------------------------------------------------*/
        /*	Toggle
        /*----------------------------------------------------*/

        $(".toggle-container").hide();

        $('.trigger, .trigger.opened').on('click', function(a){
            $(this).toggleClass('active');
            a.preventDefault();
        });

        $(".trigger").on('click', function(){
            $(this).next(".toggle-container").slideToggle(300);
        });

        $(".trigger.opened").addClass("active").next(".toggle-container").show();


        /*----------------------------------------------------*/
        /*  Notifications
        /*----------------------------------------------------*/

        $("a.close").removeAttr("href").on('click', function(){
            $(this).parent().fadeOut(200);
        });


        /*----------------------------------------------------*/
        /*  Contact Form
        /*----------------------------------------------------*/
        // contactForm();

// ------------------ End Document ------------------ //
    };

}) (jQuery);

(function($) {

    $.fn.footerReveal = function(options) {

        $('#footer.sticky-footer').before('<div class="footer-shadow"></div>');

        var $this = $(this),
            $prev = $this.prev(),
            $win = $(window),

            defaults = $.extend ({
                shadow : true,
                shadowOpacity: 0.12,
                zIndex : -10
            }, options ),

            settings = $.extend(true, {}, defaults, options);

        $this.before('<div class="footer-reveal-offset"></div>');

        if ($this.outerHeight() <= $win.outerHeight()) {
            $this.css({
                'z-index' : defaults.zIndex,
                position : 'fixed',
                bottom : 0
            });

            $win.on('load resize', function() {
                $this.css({
                    'width' : $prev.outerWidth()
                });
                $prev.css({
                    'margin-bottom' : $this.outerHeight()
                });
            });
        }

        return this;

    };

}) (jQuery);
