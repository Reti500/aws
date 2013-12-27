class Producto < ActiveRecord::Base
	has_attached_file :imagen,
    :storage => :s3,
    :bucket => 'pruebanews',
    :s3_credentials => {
      :access_key_id => 'AKIAI37NH6YABDJANX6A',
      :secret_access_key => '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'
    }
end
