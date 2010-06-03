# Validates the format of a url with simple regexp
class UrlFormatValidator < ActiveModel::EachValidator
  protocol = '(https?):\/\/'
  sub      = '([_a-z\d\-]+(\.[_a-z\d\-]+)+)'
  domain   = '(([_a-z\d\-\\\.\/]+[_a-z\d\-\\\/])+)'
  URL_REGEX = /^#{protocol}#{sub}#{domain}*/i

  def validate_each(record, attribute, value)
    result = false
    if value.blank?
      result = true
    else
      if (value =~ URL_REGEX) == 0
        result = true
      elsif ("http://#{value}" =~URL_REGEX) == 0
        result = true
        record[:url] = "http://#{value}"
      end
    end
    record.errors[attribute] << (options[:message] || :invalid) unless result
  end
end

