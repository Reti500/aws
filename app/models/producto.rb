class Producto < ActiveRecord::Base
	before_save :randomize_file_name

	has_attached_file :imagen,
    :storage => :s3,
    :bucket => 'pruebaimg',
    :s3_credentials => {
      :access_key_id => 'AKIAI37NH6YABDJANX6A',
      :secret_access_key => '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',
      :s3_endpoint => 's3-us-west-1.amazonaws.com'
    },
    :styles => Proc.new { |attachment| attachment.instance.styles }

  def dynamic_style_format_symbol
    URI.escape(@dynamic_style_format).to_sym
  end

  def styles
    unless @dynamic_style_format.blank?
      { dynamic_style_format_symbol => @dynamic_style_format }
    else
      {}
    end
  end

  def dynamic_attachment_url(format)
    @dynamic_style_format = format
    imagen.reprocess!(dynamic_style_format_symbol) unless imagen.exists?(dynamic_style_format_symbol)
    imagen.url(dynamic_style_format_symbol)
  end

  private

  def randomize_file_name
    extension = File.extname(imagen_file_name).downcase
    self.imagen.instance_write(:file_name, "#{SecureRandom.hex}#{extension}")
  end
end
