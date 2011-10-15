module AccountsHelper
  def remove_link_unless_new_record(fields)
    unless fields.object.new_record?
      out = ''
      out << fields.hidden_field(:_delete)
      out << link_to_function("remove", "$(this).up('.#{fields.object.class.name.underscore}').hide(); $(this).previous().value = '1'")
      out
    end
  end
  def add_account_item_link(name, form)
    link_to_function name do |page|
      account_item = render(:partial => 'account_item', :locals => { :pf => form, :account_item => AccountItem.new })
      page << %{var new_account_item_id = "new_" + new Date().getTime();
      $('account_items').insert({ bottom: "#{ escape_javascript account_item }".replace(/new_\\d+/g, new_account_item_id) });
      }
    end
  end


end
