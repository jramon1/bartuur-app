$(document).ready(function() {
  $('.attachinary-input').attachinary({
    template: "<ul>\
      <% for(var i=0; i<files.length; i++){ %>\
        <li>\
          <% if(files[i].resource_type == \"raw\") { %>\
            <div class=\"raw-file\"></div>\
          <% } else { %>\
            <img\
              src=\"<%= $.cloudinary.url(files[i].public_id, { \"version\": files[i].version, \"format\": 'jpg', \"crop\": 'scale', \"width\": 200, \"height\": 200 }) %>\"\
              alt=\"\" width=\"200\" height=\"200\" />\
          <% } %>\
          <a href=\"#\" data-remove=\"<%= files[i].public_id %>\"></a>\
        </li>\
      <% } %>\
      </ul>"
  });
});
