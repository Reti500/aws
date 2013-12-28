Paperclip::Attachment.default_options[:url] = 'pruebanews.s3.amazonaws.com'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-1.amazonaws.com'
Paperclip::Attachment.default_options[:s3_endpoint] = 's3-us-west-1.amazonaws.com'

module Paperclip
  module Interpolations
    def time(attachment, style)
      Time.now
    end
  end
end