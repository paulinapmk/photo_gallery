# photo_gallery

This application is written in Ruby 2.3.1 and Rails 4.2.6, using HAML.

Mailny this is based on the tutorial proposed by [Ben Walker](www.devwalks.com), but I added some features, such as:
* extended notifications for like, unlike; pagination of all notifications basing on \'time ago\'
* mark notification as read/unread directly from the dropdown or from the notifications index
* my post structure is a bit different, I added also the title and the caption (I am going to use it later for dinamic Open Graph tags)