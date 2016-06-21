class Account::MatchesController < ApplicationController
  def show
    @matches = current_user.matches.all

  end
end

