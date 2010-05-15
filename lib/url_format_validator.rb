# Validates the format of a url with simple regexp
class UrlFormatValidator < ActiveModel::EachValidator
  protocol = '(https?):\/\/'
  sub      = '([_a-z\d\-]+(\.[_a-z\d\-]+)+)'
  domain   = '(([_a-z\d\-\\\.\/]+[_a-z\d\-\\\/])+)'
  URL_REGEX = /^#{protocol}#{sub}#{domain}*/i

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || :invalid) unless value =~ URL_REGEX
  end
end

