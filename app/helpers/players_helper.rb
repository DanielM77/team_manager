module PlayersHelper
  def format_date(date) 
     date.to_s.sub(/(\w+)-(\w+)-(\w+)/, '\\3.\\2.\\1')
  end

end
