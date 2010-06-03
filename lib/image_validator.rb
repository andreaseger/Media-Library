class ImageValidator < ActiveModel::EachValidator
  protocol = '(https?):\/\/'
  sub      = '([_a-z\d\-]+(\.[_a-z\d\-]+)+)'
  domain   = '(([_a-z\d\-\\\.\/]+[_a-z\d\-\\\/])+)'
  EXT_REGEX = /^(.png|.jpg|.gif)$/i
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
      # URL syntax korrekt, prüfen ob die url auf ein image zeigt
      if result
        if (value[-4..-1] =~ EXT_REGEX) == 0
          result = true
        else
          result = false
        end
      end
    end
    record.errors[attribute] << (options[:message] || :invalid) unless result
  end
end

