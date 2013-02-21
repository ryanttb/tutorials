class UsersController < ApplicationController
  def show
    @user = User.find( params[ :id ] );
  end

  def new
    # get /signup = users#new
    @user = User.new( );
  end

  def create
    # post /users (works because we did resources( :users ) in routes.rb
    @user = User.new( params[ :user ] );
    if ( @user.save( ) )
      # handle success
    else
      render( "new" );
    end
  end

end
