/**
 *
 * Inject this Javascript into the stripe backend with a bookmarklet or similar.
 * The bookmarklet in bookmarklet.txt should load this Javascript via server.rb with the self signed SSL certificates
 *
 **/

function update_stripe_webhooks() {
  var endpoint = $('select[name=endpoint] option').val();
  var url = 'https://manage.stripe.com/ajax/settings/webhooks/test/' + endpoint;
  var version = $('select[name=version] option:selected').val();

  $('select[name=event]').children().each(function(i,obj) {
    $.post(url, { event: $(obj).val(), application: false, stripe_version: version }).done(function (data) {
      var file = 'data:application/octet-stream;charset=utf-8;base64,' + btoa(data['request_body']);
      var filename = $(obj).html();
      var content = '<a id="download-json-response" download="' + $(obj).html() + '.json" href="' + file + '" >Download ' + filename + '</a><br />';
      $('.test-webhook-endpoint-view .modal-content').append(content);
      $('#download-json-response').trigger('click', function() { });
    });
  });
 
}

update_stripe_webhooks();
