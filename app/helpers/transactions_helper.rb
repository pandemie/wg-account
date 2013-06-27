module TransactionsHelper
  def id_to_flatmate(flatmate_id)
    if flatmate_id.nil?
      "Ooops, no flatmate!"
    else
      Flatmate.find(flatmate_id).name
    end
  end

  def flatmate_group_list(list)
    list.collect { |f| f.name }.join ', '
  end

end
