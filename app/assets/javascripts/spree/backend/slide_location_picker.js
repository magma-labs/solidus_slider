//= require spree/backend

let slideLocationsSearchPath = Spree.pathFor('admin/slide_locations/search');

$.fn.slideLocationAutocomplete = function (options) {
  'use strict';

  // Default options
  options = options || {}
  var multiple = typeof(options['multiple']) !== 'undefined' ? options['multiple'] : true

  function formatSlideLocation(slide_location) {
    return Select2.util.escapeMarkup(slide_location.name);
  }

  this.select2({
    minimumInputLength: 3,
    multiple: multiple,
    initSelection: function (element, callback) {
      $.get(slideLocationsSearchPath, {
        ids: element.val().split(','),
        token: Spree.api_key
      }, function (data) {
        callback(multiple ? data.slide_locations : data.slide_locations[0]);
      });
    },
    ajax: {
      url: slideLocationsSearchPath,
      datatype: 'json',
      params: { 'headers': { 'X-Spree-Token': Spree.api_key } },
      data: function (term, page) {
        return {
          q: {
            name_cont: term
          },
          token: Spree.api_key,
          page: page
        };
      },
      results: function (data, page) {
        var slide_locations = data.slide_locations ? data.slide_locations : [];

        return {
          results: slide_locations
        };
      }
    },
    formatResult: formatSlideLocation,
    formatSelection: formatSlideLocation
  });
};

Spree.ready(function() {
  $('.slide_location_picker').slideLocationAutocomplete();
});
