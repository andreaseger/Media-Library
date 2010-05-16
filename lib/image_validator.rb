# Validates the format of a url with simple regexp
class ImageValidator < ActiveModel::EachValidator
  URL_REGEX = /^(.png|.jpg|.gif)$/i

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || :invalid) unless value[-4..-1] =~ URL_REGEX
  end
end

