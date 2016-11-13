# photo_gallery

This application is written in Ruby 2.3.1 and Rails 4.2.6, using HAML.

Mailny this is based on the tutorial proposed by [Ben Walker](www.devwalks.com), but I added some features, such as:
* extended notifications for like and unlike post; information about \'time ago\'
* mark notification as read/unread directly from the dropdown or from the notifications index (however there is a problem with the update at index - not always works on first click)
* my post structure is a bit different, I added also the title and the caption (I am going to use it later for dinamic Open Graph tags)

###To do:
* different styles for read and unread notifications
* pagination for all notifications
* dinamic OG tags