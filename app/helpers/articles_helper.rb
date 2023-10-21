module ArticlesHelper
  def vote_button(article, vote)
    if vote
      button_to 'Unlike', article_vote_path(article, vote), method: :delete
    else
      button_to 'like', article_votes_path(article)
    end
  end
end
