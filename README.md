US Standard *                           s3.amazonaws.com(default)
US West (Oregon) Region                 s3-us-west-2.amazonaws.com
US West (Northern California) Region    s3-us-west-1.amazonaws.com
EU (Ireland) Region                     s3-eu-west-1.amazonaws.com
Asia Pacific (Singapore) Region         s3-ap-southeast-1.amazonaws.com
Asia Pacific (Tokyo) Region             s3-ap-northeast-1.amazonaws.com
South America (Sao Paulo) Region        s3-sa-east-1.amazonaws.com





Paperclip::Attachment.default_options.merge!(
  url:                  ':s3_domain_url',
  path:                 ':class/:attachment/:id/:style/:filename',
  storage:              :s3,
  s3_credentials:       Rails.configuration.aws,
  s3_permissions:       :private,
  s3_protocol:          'https'
)



http://hiphotos.s3.amazonaws.com/ads/photos/000/000/015/original/test_tree.jpg