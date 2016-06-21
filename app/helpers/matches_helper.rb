module MatchesHelper
  def match_product(match)
    appreciation = match.appreciation
    secondary_appreciation = match.secondary_appreciation

    if appreciation.user == current_user
      secondary_appreciation.product
    else
      appreciation.product
    end
  end

  def match_other_product(match)
    appreciation = match.appreciation
    secondary_appreciation = match.secondary_appreciation

    if appreciation.user == current_user
      appreciation.product
    else
      secondary_appreciation.product
    end
  end
end
