module TeamsHelper
  def remove_link_unless_new_record(fields)
    unless fields.object.new_record?
      out = ''
      out << fields.hidden_field(:_delete)
      out << link_to_function("remove", "$(this).up('.#{fields.object.class.name.underscore}').hide(); $(this).previous().value = '1'")
      out
    end
  end
  def add_bonus_link(name, form)
    link_to_function name do |page|
      bonus = render(:partial => 'bonus', :locals => { :tf => form, :bonus => Bonus.new })
      page << %{
          var new_bonus_id = "new_" + new Date().getTime();
          $('bonuses').insert({ bottom: "#{ escape_javascript bonus }".replace(/new_\\d+/g, new_bonus_id) });
      }
    end
  end      
end
