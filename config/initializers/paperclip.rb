# Smart ID partitioning so we don't max out files in one directory
# This is setup for backwards compatibility with existing records!
# Just use :id_partition if you are just starting out
Paperclip.interpolates(:id_smart) do |attachment, style|
  limit = 33600
  if attachment.instance.id > limit
    id_partition(attachment, style)
  else
    id(attachment, style)
  end
end

# Direct paperclip logging to Rails logger, not STDOUT
#Paperclip.logger = Rails.logger
#Paperclip.options[:logger] = Rails.logger
