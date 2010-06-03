module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("/shared/" + association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def google_for(target, year={})
    link_to target, 'http://www.google.de/search?q=' + target + ' ' + year, {:rel => "external", :target => "_blank"}
  end

  def snippet(thought, count)
    thought.gsub(/^(.{#{count}}[\w.]*)(.*)/m) {$2.empty? ? $1 : $1 + '...'}
  end
end

