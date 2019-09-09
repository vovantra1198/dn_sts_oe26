$(document).ready(function(){
  $('#open_notification').click(function(){
    $('#notificationContainer').fadeToggle(300);
    $('#notification-new-noti').fadeOut('fast');
    return false;
  });

  $(document).click(function(){
    $('#notificationContainer').hide();
  });

  $('#notificationContainer').click(function(){
    return;
  });

  (function(){
    var sub_users = $("#sub_user").val();
    for(var i=0; i< sub_users.length; i++){
      setupAllChannel(sub_users[i]);
    };
    function setupAllChannel(id){
      App.notifications = App.cable.subscriptions.create(
      {
        channel: 'NotificationsChannel', recipient_id: id
      },
      {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          $('#notificationList').prepend('' + data.notification);
          $('#notificationList li').click(function(){
            window.location.href = $(this).find('a').first().attr('href');
          });
          $('#notification-new-noti').fadeIn('fast');
          return true;
        }
      });
    }
  }).call(this);
});
